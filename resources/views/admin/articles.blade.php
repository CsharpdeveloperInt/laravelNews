@extends('layouts.admin')
@section('content')
<div class="container">
<h1>Статьи</h1>
	<div>
		<form>
	       	<meta name="csrf-token" content="{{ csrf_token() }}">
	       	<div class="col-md-6">
		        <div class="form-group">
		            <input type="text" class="form-control" id="searchstring" placeholder="Введите автора статьи">
		        </div>
	        </div>
	      	<div class="col-md-6">
	    		<button class="btn btn-primary" id="searchButton">Найти</button>
	    	</div>
        </form>
	</div>
	<div class="col-md-12">
		<a href="#" id="addNews" class="btn btn-success">Добавить статью</a>
		<hr/>
		
		<div id="allArticles">тут статьи</div>
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
                            <form>
                            	<meta name="csrf-token" content="{{ csrf_token() }}">
                                <input type="hidden" id="editId" />
                                  <div class="form-group">
                                    <label for="addName">Название:</label>
                                    <input type="text" class="form-control" id="editName" placeholder="Введите название статьи">
                                </div>
                                
                                  <div class="form-group">
                                    <label for="editauthor">Автор:</label>
                                    <input type="text" class="form-control" id="editauthor" placeholder="Введите автора статьи">
                                </div>
                                
                                  <div class="form-group">
                                    <label for="fulltext">Полное описание:</label>
                                    <input type="text" class="form-control" id="editfulltext" placeholder="Введите полный текст статьи">
                                </div>


                                <div class="form-group">
                                    <label for="meta_k">Meta_k:</label>
                                    <input type="text" class="form-control" id="editmeta_k" placeholder="Введите Meta Key">
                                </div>

                                <div class="form-group">
                                    <label for="meta_d">Meta_d:</label>
                                    <input type="text" class="form-control" id="editmeta_d" placeholder="Введите Meta Description">
                                </div>  
                                <button class="btn btn-primary btn-xs" id="saveEditArticles">Сохранить</button>
                                  
                            </form>
                        </div>

                        <div id="createBlock">
                            <form >
								<meta name="csrf-token" content="{{ csrf_token() }}">
                                <div class="form-group">
                                    <label for="addName">Название:</label>
                                    <input type="text" class="form-control" id="addName" placeholder="Введите название статьи">
                                </div>
                                
                                                               
                                  <div class="form-group">
                                    <label for="author">Автор:</label>
                                    <input type="text" class="form-control" id="author" placeholder="Введите автора статьи">
                                </div>
                                
                                  <div class="form-group">
                                    <label for="fulltext">Полное описание:</label>
                                    <input type="textarea" class="form-control" id="fulltext" placeholder="Введите полный текста статьи" cols="100">
                                </div>
                                <div class="form-group">
                                    <label for="meta_k">Meta_k:</label>
                                    <input type="text" class="form-control" id="meta_k" placeholder="Введите Meta Key">
                                </div>

                                <div class="form-group">
                                    <label for="meta_d">Meta_d:</label>
                                    <input type="text" class="form-control" id="meta_d" placeholder="Введите Meta Description">
                                </div>
                                <button class="btn btn-primary btn-xs" id="saveAddArticles">Сохранить</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>  
        
        <script  src="{{asset('assets/admin/assets/js/ckeditor/ckeditor.js')}}"></script>
         <script src="{{asset('assets/admin/assets/js/app_articles.js')}}"></script>  
	<script>
		CKEDITOR.replace('fulltext');
		CKEDITOR.replace('editfulltext');
	</script>
@endsection