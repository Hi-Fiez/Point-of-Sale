@extends('layouts.guest')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <center>
                        <!-- CAKEP -->
                        <!-- <img class="pure-img" src="https://www.google.co.id/logos/doodles/2017/samuel-johnsons-308th-birthday-5999730113904640.2-law.gif"> -->                    
                        <!-- KECIL -->
                        <!-- <img class="pure-img" src="https://crocottrees.files.wordpress.com/2011/05/kucing-kecil-1.jpg"> -->
                        <!-- GEDE -->
                        <img class="pure-img" src="http://www.aseaniapulaubesar.com/img/Aseania-Pulau-Besar-Aerial-View.jpg">
                    </center>
                </div>

                <div class="panel-body">
                    <form class="pure-form pure-form-aligned" method="POST" action="{{ route('login') }}">
                        {{ csrf_field() }}
                        <fieldset>
                        <legend>Login</legend>

                            <div class="pure-control-group">
                                <label for="email">E-mail Address</label>
                                <input id="email" type="email" name="email" placeholder="E-Mail Address" value="{{ old('email') }}" required autofocus>
                            </div>

                            @if ($errors->has('email'))                            
                            <div class="pure-control-group">                                
                                <label></label>
                                <span class="pure-form-message-inline">{{ $errors->first('email') }}</span>
                            </div>
                            @endif

                            <div class="pure-control-group">
                                <label for="password">Password</label>
                                <input id="password" type="password" placeholder="Password" name="password" required>                                
                            </div>

                            @if ($errors->has('password'))                            
                            <div class="pure-control-group">                                
                                <label></label>
                                <span class="pure-form-message-inline">{{ $errors->first('password') }}</span>                                
                            </div>
                            @endif

                            <div class="pure-controls">
                                <!-- <label for="remember" class="pure-checkbox">
                                    <input id="remember" type="checkbox" name="remember" {{ old('remember') ? 'checked' : '' }}> Remember Me
                                </label> -->

                                <button type="submit" class="pure-button pure-button-primary">
                                    Login
                                </button>

                                <a class="pure-button" href="{{ route('password.request') }}">
                                    Forgot Your Password?
                                </a>
                            </div>
                        </fieldset>
                    </form>                    
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
