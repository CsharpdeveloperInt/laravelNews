<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;

use App\News;

class NewsController extends Controller
{
    //
    
    public function index(Request $request) {
		$allNews = News::all();
		return view('site.news',array('news'=>$allNews));
	}
    
    public function show(Request $request, $id){
		
		$news = News::find($id);
        return View('site.showNews',array('item'=>$news));
	}
}
