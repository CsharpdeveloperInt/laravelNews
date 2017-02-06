<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;

use App\Articles;

class AdminArticlesController  extends Controller
{
	
    public function index(Request $request) {
    	
    	return view('admin.articles');
    
	}
	
	
	public function getall(Request $request){
			
		$allArticles = Articles::all();
		//return view('admin.articles',array('articles'=>$allArticles));
		$response = array(
		            'status' => 'success',
		            'msg' => 'Новость успешно cохранена',
			        );
			        return \Response::json($allArticles);
			        
			        //dd($allArticles);
			        //return view('admin.articles',array('articles'=>$allArticles));
	}
	
	public function add(Request $request){
			
			$input = $request->all();
			$articles = new Articles();
			$articles->fill($input);
			  
			if($articles->save()) 
			{

					$response = array(
		            'status' => 'success',
		            'msg' => 'Новость успешно добавлена',
			        );
			        return \Response::json($response);
			}
			else{
				
					$response = array(
		            'status' => 'error',
		            'msg' => 'Произошла ошибка при сохранении',
			        );
			        return \Response::json($response);
			}
			
	}
    
    
    public function del(int $id){
		
			$Articles = Articles::find($id);
        	if($Articles->delete())
        	{
				$response = array(
		            'status' => 'success',
		            'msg' => 'Новость успешно удалена',
			        );
			        return \Response::json($response);
			}
			else{
				
					$response = array(
		            'status' => 'error',
		            'msg' => 'Произошла ошибка при удалении',
			        );
			        return \Response::json($response);
			}
	}
	
	  
    public function edit(Request $request, int $id){
		    $input = $request->all();
			$articles = Articles::find($id);
			$articles->fill($input);
			  
			if($articles->save()) 
			{
        	
				$response = array(
		            'status' => 'success',
		            'msg' => 'Новость успешно cохранена',
			        );
			        return \Response::json($response);
			}
			else{
				
					$response = array(
		            'status' => 'error',
		            'msg' => 'Произошла ошибка при сохранении',
			        );
			        return \Response::json($response);
			}
	}
	
	
	public function get(int $id){
		    
			$articles = Articles::find($id);
			
			
        	
				$response = array(
		            'status' => 'success',
		            'msg' => 'Новость успешно cохранена',
			        );
			        return \Response::json($articles);
		
			
	}
		
	public function search(string $searchString){
			$articles = Articles::where('author','like','%'.$searchString.'%')->get();
		
			$response = array(
		            'status' => 'success',
		            'msg' => 'Новость успешно cохранена',
			);
		    
		    return \Response::json($articles);	
	}
}
