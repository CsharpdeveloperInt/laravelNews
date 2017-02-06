@extends('layouts.main')


<div class="container">
<h1>Статьи</h1>
@if(isset($articles))
@foreach($articles as $itemarticles)
   <div class="col-md-12 newsblock">
   		
   		<div class="col-md-12" style="border:1px solid black;">
   			<span>{{$itemarticles['title']}}</span>
			<p>{{$itemarticles['short_desc']}}</p>
			<span><a href="{{ URL::route('articleshow', $itemarticles['id']) }}">Читать далее...</a></span>
   		</div>
   		
   </div>

@endforeach

<!--</table>-->
@endif



</div>
