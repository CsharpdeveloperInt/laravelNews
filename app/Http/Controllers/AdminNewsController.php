<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;

use App\News;

class AdminNewsController  extends Controller
{
	
    public function index(Request $request) {
    	
    	return view('admin.news');
    
	}
	
	
	public function getall(Request $request){
			
		$allNews = News::all();
		//return view('admin.news',array('news'=>$allNews));
		$response = array(
		            'status' => 'success',
		            'msg' => 'Новость успешно cохранена',
			        );
			        return \Response::json($allNews);
			        
			        //dd($allNews);
			        //return view('admin.news',array('news'=>$allNews));
	}
	
	public function add(Request $request){
			$input = $request->all();	
			//return \Response::json(array('b'=>var_dump($_FILES)));
			
			$news = new News();
			
			if($request->hasFile('img')) 
			{
				$file = $request->file('img');
				$input['img'] = $file->getClientOriginalName();
				$request->file('img')->move(public_path().'/assets/site/assets/uploadImg/', $input['img']);
			}
			
			$news->fill($input);
			
			if($news->save()) 
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
		
			$News = News::find($id);
        	if($News->delete())
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
			$news = News::find($id);
			
			if($request->hasFile('img')) 
			{
				$file = $request->file('img');
				$input['img'] = $file->getClientOriginalName();
				$request->file('img')->move(public_path().'/assets/site/assets/uploadImg/', $input['img']);
			}
			
			$news->fill($input);
			  
			if($news->save()) 
			{
        	
				$response = array(
		            'status' => 'success',
		            'msg' => 'Новость успешно cохранена',
		            'title' => $request['title'],
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
		    
			$news = News::find($id);
			
			
        	
				$response = array(
		            'status' => 'success',
		            'msg' => 'Новость успешно cохранена',
			        );
			        return \Response::json($news);
		
			
	}
	
	
	public function search(string $searchString){
			$news = News::where('title','like','%'.$searchString.'%')->get();
		
			$response = array(
		            'status' => 'success',
		            'msg' => 'Новость успешно cохранена',
			);
		    
		    return \Response::json($news);	
	}
}
