		//////////////////Отображение всех новостей
  		GetAllNews();
  
          
   		// Получение всех новостей по ajax-запросу
        function GetAllNews() {

            $("#createBlock").css('display', 'none');
            $("#editBlock").css('display', 'none');
            $.ajax({
                url: '/admin/news/newsgetAll',
                type: 'GET',
                dataType: 'json',
                success: function (data) {
                    WriteResponse(data);
                },
                error: function (error) {
                    alert("Произошла ошибка при обработке запроса.Смотри консоль");
                    console.log(error);
                }
            });
        }
        
        // Формируем верстку
        function WriteResponse(news) {
         	var strResult ='';
            $.each(news, function (index, nItem) {
                strResult += "<div class='col-md-12 newsblock'>"+
	   							"<div class='col-md-4'><img src='/assets/site/assets/uploadImg/"+nItem.img+"' height='150px' width='300px'></div>"+
		   							"<div class='col-md-8' style='border:1px solid black; height:150px;'>"+
		   								"<span>"+nItem.title+"<span>"+
										"<p>"+nItem.short_desc+"</p>"+
										"<span><a href='#' id='editNews'   data-item='"+nItem.id+"' onclick='editNews(this)'>Редактировать...</a></span><br /><br />"+
										"<span><a href='#' id='deleteNews' data-item='"+nItem.id+"' onclick='deleteNews(this)'>Удалить...</a></span>"+
		   							"</div>"+
   								"</div>"+
   							"</div>";
            });
            $("#allNews").html(strResult);
        }
        
        
        //////////////////Добавление новости
        
        //Обработка нажатия ссылки добавить
	 	jQuery("#addNews").click(function (event) {
                event.preventDefault();
                $('#ModalForm').modal();
                $("#captionHeader").html('Добавление новости');
                $("#editBlock").css('display', 'none');
                $("#createBlock").css('display', 'block');
                
            });
            
		//обработка нажатия кнопки сохранить
        $("#saveAddNews").click(function (event) {
        	event.preventDefault();
        	saveAddNews(); //вызываем одноименный метод
        });
        
        // Добавление новой Новости
        function saveAddNews() {          
          			
			var form = document.forms.namedItem("addform");
			
			var formData = new FormData(form); 
				formData.append('fulltext', CKEDITOR.instances.fulltext.getData())
            $.ajax({
                url: '/admin/news/newsadd',
                type: 'POST',             
                //data: JSON.stringify(news),            
                data: formData,   
                //dataType : "json",          
                processData: false,
      			contentType: false,
                success: function (data) {
                	//alert(data);
                    $("#createBlock").css('display', 'none');
                    $('#ModalForm').modal('hide');
                    GetAllNews(); 
                },
                error: function (error) {
                	alert(error);
                    alert("Произошла ошибка при обработке запроса.Смотри консоль");
                    console.log(error);
                }
            });
        }

        //////////////////Редактирование новости
     
        // обработчик редактирования Новости
        function editNews(el){
            // получаем id редактируемого объекта
            var id = $(el).attr('data-item');
           
            event.preventDefault();
            GetNews(id);
        }
        
        // запрос новости на редактирование
        function GetNews(id) {
            $.ajax({
                url: '/admin/news/newsget/' + id,
                type: 'GET',
                dataType: 'json',
                success: function (data) {
                    ShowNews(data); //Отображаем новость на редактирование
                },
                error: function (error) {
                    alert("Произошла ошибка при обработке запроса.Смотри консоль");
                    console.log(error);
                }
            });
        }
        
        // вывод данных редактируемой новости в поля для редактирования
        function ShowNews(news) {
            if (news != null) {
                $("#createBlock").css('display', 'none');
                $('#ModalForm').modal();
                $("#captionHeader").html('Редактирование новости');
                $("#editBlock").css('display', 'block');
                
                $("#editId").val(news.id);
                $("#editName").val(news.title);
                $("#editshortDesk").val(news.short_desc);
                //$("#img").val(news.img);
                CKEDITOR.instances.editfulltext.setData(news.fulltext);
                $("#editmeta_k").val(news.meta_k);
                $("#editmeta_d").val(news.meta_d);
            }
            else {
                alert("Такая новость не существует");
            }
        }
        
        //Обработчик нажатия кнопки сохранить новость
        $("#saveEditNews").click(function (event) 
        {
                event.preventDefault();
                EditNews();
        });
     
     	//Редактирование новости сохранение
        function EditNews() {
            var id = $('#editId').val();
            //alert(id);
            // получаем новые значения для редактируемой новости         
                     
            var form = document.forms.namedItem("editform"); 
			
			var formDataEdit = new FormData(form);
				formDataEdit.append('fulltext', CKEDITOR.instances.editfulltext.getData());
				//alert(formDataEdit);
            $.ajax({
                url: '/admin/news/newsedit/' + id,
                type: 'Post',
                data: formDataEdit,
                //contentType: "application/json;charset=utf-8",
                processData: false,
      			contentType: false,
                success: function (data) {
                	//alert(data.title);
                    GetAllNews();
                    $('#ModalForm').modal('hide');
                },
                error: function (error) {
                    alert("Произошла ошибка при обработке запроса.Смотри консоль");
                    console.log(error);
                }
            });
        }	
     
        //////////////////Удаление новости
        
        // обработчик нажатия ссылки удаления
        function deleteNews(el) {
            // получаем id удаляемого объекта
            var id = $(el).attr('data-item');
            DeleteNews(id);
        }
        
        // Удаление книги
        function DeleteNews(id) {
            $.ajax({
                url: '/admin/news/newsdel/' + id,
                type: 'DELETE',
                contentType: "application/json;charset=utf-8",
                success: function () {
                    GetAllNews();
                },
                error: function (error) {
                    alert("Произошла ошибка при обработке запроса.Смотри консоль");
                    console.log(error);
                }
            });
        }
        
        
        //Настройка токена формы	
        $.ajaxSetup({
					  headers: {
					    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
					  }
		});	
		
		
		//////////////////Поиск новости
		
		//Обработка нажатия ссылки поиск
	 	jQuery("#searchButton").click(function (event) {
                event.preventDefault();
                $("#allNews").css('display', 'none');
                var searchString = $('#searchstring').val();
                if(searchString !== "") 
                	SearchNews(searchString);
                else
                (
                	alert("Необходимо указать строку запроса")
                )
            });
            
        //Отправляем запрос на поиск
        function SearchNews(searchString) {
            $.ajax({
                url: '/admin/news/newssearch/' + searchString,
                type: 'GET',
                dataType: 'json',
                contentType: "application/json;charset=utf-8",
                success: function (data) {
                    WriteResponse(data);
                    $("#allNews").css('display', 'block');
                },
                error: function (error) {
                    alert("Произошла ошибка при обработке запроса.Смотри консоль");
                    console.log(error);
                }
            });
        };