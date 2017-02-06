<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;

use App\Articles;

class ArticlesController extends Controller
{
    //
    
    public function index(Request $request) {
		$allArticles = Articles::all();
		return view('site.articles',array('articles'=>$allArticles));
	}
	
	   public function show(Request $request, $id){
		
		$article = Articles::find($id);
        return View('site.showArticle',array('item'=>$article));
	}
    
}
