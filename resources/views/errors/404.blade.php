@extends('layouts.error')

@section('title', '404 - THE PAGE WAS NOT FOUND')
@section('content')
<div id="clouds">
	<div class="cloud x1"></div>
	<div class="cloud x1_5"></div>
	<div class="cloud x2"></div>
	<div class="cloud x3"></div>
	<div class="cloud x4"></div>
	<div class="cloud x5"></div>
</div>
<div class='c'>
	<div class='_404'>404</div>
	<hr>
	<div class='_1'>THE PAGE</div>
	<p></p>
	<div class='_2'>WAS NOT FOUND</div>
	<br>
	<a class='btn' href='{{ url('/') }}'>BACK TO HOME</a>	
</div>
@endsection