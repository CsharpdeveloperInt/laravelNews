@extends('layouts.main')
<div class="container">
<h1>{{$item['title']}}</h1>
@if(isset($item))
   <div class="col-md-12 newsblock">
   			<img src="{{asset('assets/site/assets/uploadImg/'.$item['img'])}}" height="300px" width="100%"></div>
   			<br /><br />
   			<hr />
   		<div class="col-md-12" style="margin-top: 10px;">
   			<span>Дата: {{$item['created_at']}}</span>
			   <p>{!!$item['fulltext']!!}</p>
   		</div>
   </div>
@endif

</div>