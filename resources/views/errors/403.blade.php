@extends('layouts.error')

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
	<div class='_404'>STOP</div>
	<hr>
	<div class='_1'>YOU CAN'T PASS</div>
	<p></p>
	<div class='_2'>DON'T HAVE AN ACCESS</div>
	<br>
	<a class='btn' href='{{ url('/') }}'>BACK TO HOME</a>	
</div>
@endsection