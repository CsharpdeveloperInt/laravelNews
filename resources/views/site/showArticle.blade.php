@extends('layouts.main')
<div class="container">
<h1>{{$item['title']}}</h1>
@if(isset($item))



   <div class="col-md-12 newsblock">
   	
   			
   		<div class="col-md-12" style="border:1px solid black;    margin-top: 10px;">
   			<span>{{$item['title']}}</span>
			<p>{!!$item['fulltext']!!}</p>
   	
   			</div>


</div>
@endif

</div>