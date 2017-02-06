@extends('layouts.main')
<div class="container">
<h1>Новости</h1>
@if(isset($news))
@foreach($news as $itemnews)
   <div class="col-md-12 newsblock">
   		<div class="col-md-4"><img src="{{asset('assets/site/assets/uploadImg/'.$itemnews['img'])}}" height="150px" width="300px"></div>
   		<div class="col-md-8" style="border:1px solid black;height:150px;">
   			<span>{{$itemnews['title']}}</span>
			<p>{{$itemnews['short_desc']}}</p>
			<span><a href="{{ URL::route('newshow', $itemnews['id']) }}">Читать далее...</a></span>
   		</div>
   </div>
@endforeach
@endif
</div>
