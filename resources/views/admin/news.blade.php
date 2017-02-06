@extends('layouts.admin')
@section('content')
<div class="container">
<h1>Новости</h1>
	<div>
		<form>
	       	<meta name="csrf-token" content="{{ csrf_token() }}">
	       	<div class="col-md-6">
		        <div class="form-group">
		            <input type="text" class="form-control" id="searchstring" placeholder="Введите заголовок новости">
		        </div>
	        </div>
	      	<div class="col-md-6">
	    		<button class="btn btn-primary" id="searchButton">Найти</button>
	    	</div>
        </form>
	</div>
	<div class="col-md-12">
		<a href="#" id="addNews" class="btn btn-success">Добавить новость</a>
		<hr/>
		
		<div id="allNews">тут новости</div>
	</div>
</div>
<!--Модальное окно для добавления/редактирования-->
<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" id="ModalForm" aria-labelledby="mySmallModalLabel">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="exampleModalLabel"><b id="captionHeader"></b></h4>
                    </div>
                    <div class="modal-body">
                        <div id="editBlock">
                            <form name="editform" enctype="multipart/form-data">
                            	<meta name="csrf-token" content="{{ csrf_token() }}">
                                <input type="hidden" id="editId" />
                                  <div class="form-group">
                                    <label for="addName">Название:</label>
                                    <input type="text" class="form-control" id="editName" name="title" placeholder="Введите название новости">
                                </div>
                                
                                  <div class="form-group">
                                    <label for="shortDesk">Краткое описание:</label>
                                    <input type="text" class="form-control" id="editshortDesk" name="short_desc" placeholder="Введите краткое содержание новости">
                                </div>
                                
                                <div class="form-group">
                                    <label for="shortDesk">Картинка:</label>
                                    <input type="file" class="filestyle" data-buttonName="btn-primary" id="img" name="img" data-buttonText="Выберите изображение">
                                </div>
                                
                                  <div class="form-group">
                                    <label for="fulltext">Полное описание:</label>
                                    <input type="text" class="form-control" id="editfulltext" name="fulltext" placeholder="Введите полный текста новости">
                                </div>


                                <div class="form-group">
                                    <label for="meta_k">Meta_k:</label>
                                    <input type="text" class="form-control" id="editmeta_k" name="meta_k" placeholder="Введите Meta Key">
                                </div>

                                <div class="form-group">
                                    <label for="meta_d">Meta_d:</label>
                                    <input type="text" class="form-control" id="editmeta_d" name="meta_d" placeholder="Введите Meta Description">
                                </div>  
                                <button class="btn btn-primary btn-xs" id="saveEditNews">Сохранить</button>
                                  
                            </form>
                        </div>

                        <div id="createBlock">
                            <form name="addform" enctype="multipart/form-data">
								<meta name="csrf-token" content="{{ csrf_token() }}">
                                <div class="form-group">
                                    <label for="addName">Название:</label>
                                    <input type="text" class="form-control" id="addName" name="title" placeholder="Введите название новости">
                                </div>
                                
                                  <div class="form-group">
                                    <label for="shortDesk">Краткое описание:</label>
                                    <input type="text" class="form-control" id="shortDesk" name="short_desc" placeholder="Введите краткое содержание новости">
                                </div>
                                
                                <div class="form-group">
                                    <label for="shortDesk">Картинка:</label>
                                    <input type="file" class="filestyle" data-buttonName="btn-primary" id="addimg" name="img" data-buttonText="Выберите изображение">
                                </div>
                               
                                
                                  <div class="form-group">
                                    <label for="fulltext">Полное описание:</label>
                                    <input type="textarea" class="form-control" id="fulltext" name="fulltext" placeholder="Введите полный текста новости" cols="100">
                                </div>
                                <div class="form-group">
                                    <label for="meta_k">Meta_k:</label>
                                    <input type="text" class="form-control" id="meta_k" name="meta_k" placeholder="Введите Meta Key">
                                </div>

                                <div class="form-group">
                                    <label for="meta_d">Meta_d:</label>
                                    <input type="text" class="form-control" id="meta_d" name="meta_d" placeholder="Введите Meta Description">
                                </div>
                                <button class="btn btn-primary btn-xs" id="saveAddNews">Сохранить</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>  
        
        <script  src="{{asset('assets/admin/assets/js/ckeditor/ckeditor.js')}}"></script>
         <script src="{{asset('assets/admin/assets/js/app.js')}}"></script>  
	<script>
		CKEDITOR.replace('fulltext');
		CKEDITOR.replace('editfulltext');
	</script>
@endsection