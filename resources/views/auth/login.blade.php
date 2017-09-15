@extends('layouts.guest')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <div class="panel panel-default">
                <!-- <div class="panel-heading">Login</div> -->

                <div class="panel-body">

                    <!-- <form class="form-horizontal" method="POST" action="{{ route('login') }}">
                        {{ csrf_field() }}

                        <div class="form-group{{ $errors->has('email') ? ' has-error' : '' }}">
                            <label for="email" class="col-md-4 control-label">E-Mail Address</label>

                            <div class="col-md-6">
                                <input id="email" type="email" class="form-control" name="email" value="{{ old('email') }}" required autofocus>

                                @if ($errors->has('email'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('email') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group{{ $errors->has('password') ? ' has-error' : '' }}">
                            <label for="password" class="col-md-4 control-label">Password</label>

                            <div class="col-md-6">
                                <input id="password" type="password" class="form-control" name="password" required>

                                @if ($errors->has('password'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('password') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-6 col-md-offset-4">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="remember" {{ old('remember') ? 'checked' : '' }}> Remember Me
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-8 col-md-offset-4">
                                <button type="submit" class="btn btn-primary">
                                    Login
                                </button>

                                <a class="btn btn-link" href="{{ route('password.request') }}">
                                    Forgot Your Password?
                                </a>
                            </div>
                        </div>
                    </form> -->

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
