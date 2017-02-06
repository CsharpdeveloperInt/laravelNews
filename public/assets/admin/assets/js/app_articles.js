		//////////////////Отображение всех новостей
  		GetAllArticles();
  
          
   		// Получение всех новостей по ajax-запросу
        function GetAllArticles() {

            $("#createBlock").css('display', 'none');
            $("#editBlock").css('display', 'none');
            $.ajax({
                url: '/admin/articles/articlesgetAll',
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
        function WriteResponse(articles) {
         	var strResult ='';
            $.each(articles, function (index, nItem) {
                strResult += "<div class='col-md-12 newsblock'>"+
	   				
		   							"<div class='col-md-12' style='border:1px solid black;'>"+
		   								"<span>"+nItem.title+"<span>"+
										"<p>"+nItem.author+"</p>"+
										"<span><a href='#' id='editArticles'   data-item='"+nItem.id+"' onclick='editArticles(this)'>Редактировать...</a></span><br /><br />"+
										"<span><a href='#' id='deleteArticles' data-item='"+nItem.id+"' onclick='deleteArticles(this)'>Удалить...</a></span>"+
		   							"</div>"+
   								"</div>"+
   							"</div>";
            });
            $("#allArticles").html(strResult);
        }
        
        
        //////////////////Добавление статьи
        
        //Обработка нажатия ссылки добавить
	 	jQuery("#addArticles").click(function (event) {
                event.preventDefault();
                $('#ModalForm').modal();
                $("#captionHeader").html('Добавление статьи');
                $("#editBlock").css('display', 'none');
                $("#createBlock").css('display', 'block');
                
            });
            
		//обработка нажатия кнопки сохранить
        $("#saveAddArticles").click(function (event) {
        	event.preventDefault();
        	saveAddArticles(); //вызываем одноименный метод
        });
        
        // Добавление новой Новости
        function saveAddArticles() {          
            var articles = {
                title: $('#addName').val(),
                author: $('#author').val(),
                fulltext:  CKEDITOR.instances.fulltext.getData(),
                meta_k: $('#meta_k').val(),
                meta_d: $('#meta_d').val()
            }; // получаем значения для добавляемой статьи

            $.ajax({
                url: '/admin/articles/articlesadd',
                type: 'POST',             
                data: JSON.stringify(articles),            
                contentType: "application/json;charset=utf-8",
                success: function () {
                    $("#createBlock").css('display', 'none');
                    $('#ModalForm').modal('hide');
                    GetAllArticles(); 
                },
                error: function (error) {
                	alert(error);
                    alert("Произошла ошибка при обработке запроса.Смотри консоль");
                    console.log(error);
                }
            });
        }

        //////////////////Редактирование статьи
     
        // обработчик редактирования Новости
        function editArticles(el){
            // получаем id редактируемого объекта
            var id = $(el).attr('data-item');
           
            event.preventDefault();
            GetArticles(id);
        }
        
        // запрос статьи на редактирование
        function GetArticles(id) {
            $.ajax({
                url: '/admin/articles/articlesget/' + id,
                type: 'GET',
                dataType: 'json',
                success: function (data) {
                    ShowArticles(data); //Отображаем новость на редактирование
                },
                error: function (error) {
                    alert("Произошла ошибка при обработке запроса.Смотри консоль");
                    console.log(error);
                }
            });
        }
        
        // вывод данных редактируемой статьи в поля для редактирования
        function ShowArticles(articles) {
            if (articles != null) {
                $("#createBlock").css('display', 'none');
                $('#ModalForm').modal();
                $("#captionHeader").html('Редактирование статьи');
                $("#editBlock").css('display', 'block');
                
                $("#editId").val(articles.id);
                $("#editName").val(articles.title);
                $("#editauthor").val(articles.author);
                CKEDITOR.instances.editfulltext.setData(articles.fulltext);
                $("#editmeta_k").val(articles.meta_k);
                $("#editmeta_d").val(articles.meta_d);
            }
            else {
                alert("Такая новость не существует");
            }
        }
        
        //Обработчик нажатия кнопки сохранить новость
        $("#saveEditArticles").click(function (event) 
        {
                event.preventDefault();
                EditArticles();
        });
     
     	//Редактирование статьи сохранение
        function EditArticles() {
            var id = $('#editId').val();
            // получаем новые значения для редактируемой статьи         
             var articles = {
             	Id: $('#editId').val(),
                title: $('#editName').val(),
                author: $('#editauthor').val(),
                fulltext: CKEDITOR.instances.editfulltext.getData(),
                meta_k: $('#editmeta_k').val(),
                meta_d: $('#editmeta_d').val()
            };
            
            $.ajax({
                url: '/admin/articles/articlesedit/' + id,
                type: 'PUT',
                data: JSON.stringify(articles),
                contentType: "application/json;charset=utf-8",
                success: function () {
                    GetAllArticles();
                    $('#ModalForm').modal('hide');
                },
                error: function (error) {
                    alert("Произошла ошибка при обработке запроса.Смотри консоль");
                    console.log(error);
                }
            });
        }	
     
        //////////////////Удаление статьи
        
        // обработчик нажатия ссылки удаления
        function deleteArticles(el) {
            // получаем id удаляемого объекта
            var id = $(el).attr('data-item');
            DeleteArticles(id);
        }
        
        // Удаление Статьи
        function DeleteArticles(id) {
            $.ajax({
                url: '/admin/articles/articlesdel/' + id,
                type: 'DELETE',
                contentType: "application/json;charset=utf-8",
                success: function () {
                    GetAllArticles();
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
		
		//////////////////Поиск статьи
		
		//Обработка нажатия ссылки поиск
	 	jQuery("#searchButton").click(function (event) {
                event.preventDefault();
                $("#allArticles").css('display', 'none');
                var searchString = $('#searchstring').val();
                if(searchString !== "") 
                    SearchArticles(searchString);
                else
                (
                    alert("Необходимо указать строку запроса")
                )
            });
            
        //Отправляем запрос на поиск
        function SearchArticles(searchString) {
            $.ajax({
                url: '/admin/articles/articlessearch/' + searchString,
                type: 'GET',
                dataType: 'json',
                contentType: "application/json;charset=utf-8",
                success: function (data) {
                    WriteResponse(data);
                    $("#allArticles").css('display', 'block');
                },
                error: function (error) {
                    alert("Произошла ошибка при обработке запроса.Смотри консоль");
                    console.log(error);
                }
            });
        };