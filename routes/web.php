<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

//Site
Route::group(['middleware'=>'web'],function() 

{
		Route::get('/', [function () {
		    return view('site.index');
		},'as'=>'home']);

		Route::get('news',['uses'=>'NewsController@index','as'=>'news']);
		Route::get('articles',['uses'=>'ArticlesController@index','as'=>'articles']);
		Route::get('/show/{id}',['uses'=>'NewsController@show','as'=>'newshow']);
		Route::get('/showArticle/{id}',['uses'=>'ArticlesController@show','as'=>'articleshow']);
		Route::auth();
});



//Admin
Route::group(['prefix'=>'admin','middleware'=>'auth'], function() 
	{
	

		Route::get('/',function() {
		
		  	return view('admin.index');
		  
		});
		
		///admin/news  
		Route::group(['prefix'=>'news'],function() {
		
		
					Route::get('/',['uses'=>'AdminNewsController@index','as'=>'news']);
					Route::post('/newsadd',['uses'=>'AdminNewsController@add','as'=>'newsadd']);
					Route::delete('/newsdel/{id}',['uses'=>'AdminNewsController@del','as'=>'newsdell']);
					Route::post('/newsedit/{id}',['uses'=>'AdminNewsController@edit','as'=>'newsedit']);
					Route::get('/newsget/{id}',['uses'=>'AdminNewsController@get','as'=>'newsget']);
					Route::get('/newsgetAll',['uses'=>'AdminNewsController@getall','as'=>'newsgetAll']);
					Route::get('/newssearch/{searchString}',['uses'=>'AdminNewsController@search','as'=>'newssearch']);

		});
		
		
		///admin/articles  
		Route::group(['prefix'=>'articles'],function() {
		
		
					Route::get('/',['uses'=>'AdminarticlesController@index','as'=>'articles']);
					Route::post('/articlesadd',['uses'=>'AdminarticlesController@add','as'=>'articlesadd']);
					Route::delete('/articlesdel/{id}',['uses'=>'AdminarticlesController@del','as'=>'articlesdell']);
					Route::put('/articlesedit/{id}',['uses'=>'AdminarticlesController@edit','as'=>'articlesedit']);
					Route::get('/articlesget/{id}',['uses'=>'AdminarticlesController@get','as'=>'articlesget']);
					Route::get('/articlesgetAll',['uses'=>'AdminarticlesController@getall','as'=>'articlesgetAll']);
					Route::get('/articlessearch/{searchString}',['uses'=>'AdminArticlesController@search','as'=>'articlessearch']);

		});
});
	

Auth::routes();

Route::get('/home', 'HomeController@index');
