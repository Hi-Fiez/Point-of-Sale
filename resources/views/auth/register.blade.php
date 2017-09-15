@extends('layouts.guest')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <div class="panel panel-default">
                <!-- <div class="panel-heading">Register</div> -->

                <div class="panel-body">
                    <!-- <form class="form-horizontal" method="POST" action="{{ route('register') }}">
                        {{ csrf_field() }}

                        <div class="form-group{{ $errors->has('name') ? ' has-error' : '' }}">
                            <label for="name" class="col-md-4 control-label">Name</label>

                            <div class="col-md-6">
                                <input id="name" type="text" class="form-control" name="name" value="{{ old('name') }}" required autofocus>

                                @if ($errors->has('name'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('name') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group{{ $errors->has('email') ? ' has-error' : '' }}">
                            <label for="email" class="col-md-4 control-label">E-Mail Address</label>

                            <div class="col-md-6">
                                <input id="email" type="email" class="form-control" name="email" value="{{ old('email') }}" required>

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
                            <label for="password-confirm" class="col-md-4 control-label">Confirm Password</label>

                            <div class="col-md-6">
                                <input id="password-confirm" type="password" class="form-control" name="password_confirmation" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-6 col-md-offset-4">
                                <button type="submit" class="btn btn-primary">
                                    Register
                                </button>
                            </div>
                        </div>
                    </form> -->

                    <form class="pure-form pure-form-aligned" method="POST" action="{{ route('register') }}">
                        {{ csrf_field() }}
                        <fieldset>
                            <legend>Register</legend>

                            <div class="pure-control-group">
                                <label for="name">Full Name</label>
                                <input id="name" type="text" placeholder="Full Name" name="name" value="{{ old('name') }}" required autofocus>                                
                            </div>

                            @if ($errors->has('name'))                            
                            <div class="pure-control-group">                                
                                <label></label>
                                <span class="pure-form-message-inline">{{ $errors->first('name') }}</span>                                
                            </div>
                            @endif

                            <div class="pure-control-group">
                                <label for="email">E-mail Address</label>
                                <input id="email" type="email" placeholder="E-mail Address"name="email" value="{{ old('email') }}" required>                                
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

                            <div class="pure-control-group">
                                <label for="password-confirm">Confirm Password</label>
                                <input placeholder="Enter something here..." id="password-confirm" type="password" name="password_confirmation" required>
                            </div>

                            <div class="pure-controls">
                                <label for="cb" class="pure-checkbox">
                                    <input id="cb" type="checkbox" required> I've read the terms and conditions
                                </label>

                                <button type="submit" class="pure-button pure-button-primary">Register</button>
                            </div>
                        </fieldset>
                    </form>

                </div>
            </div>
        </div>
    </div>
</div>
@endsection
