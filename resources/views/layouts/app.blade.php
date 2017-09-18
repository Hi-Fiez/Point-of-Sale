<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Laravel') }}</title>

    <!-- Styles -->
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    <link rel="stylesheet" href="https://unpkg.com/purecss@1.0.0/build/pure-min.css" integrity="sha384-nn4HPE8lTHyVtfCBi5yW9d20FjT8BJwUXyWZT9InLYax14RDjBj46LmSztkmNP9w" crossorigin="anonymous">
    <style type="text/css">        
        * {
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

/*
 * -- BASE STYLES --
 * Most of these are inherited from Base, but I want to change a few.
 */
 body {
    line-height: 1.7em;
    color: #7f8c8d;
    font-size: 13px;
}

/*
 * -- MENU STYLES --
 * I want to customize how my .pure-menu looks at the top of the page
 */

 .home-menu {
    padding: 0.5em;
    text-align: center;
    box-shadow: 0 1px 1px rgba(0,0,0, 0.10);
}
.home-menu {
    background: rgb(66, 184, 221);
}
.pure-menu.pure-menu-fixed {
    /* Fixed menus normally have a border at the bottom. */
    border-bottom: none;
    /* I need a higher z-index here because of the scroll-over effect. */
    z-index: 4;
}

.home-menu .pure-menu-heading {
    color: white;
    font-weight: 400;
    font-size: 120%;
}

.home-menu .pure-menu-selected a {
    color: white;
}

.home-menu a {
    color: white;
}
.home-menu li a:hover,
.home-menu li a:focus {
    background: none;
    border: none;
    color: #AECFE5;
}

/*
 * -- TABLET (AND UP) MEDIA QUERIES --
 * On tablets and other medium-sized devices, we want to customize some
 * of the mobile styles.
 */
 @media (min-width: 48em) {

    /* We increase the body font size */
    body {
        font-size: 16px;
    }

    /* We can align the menu header to the left, but float the
    menu items to the right. */
    .home-menu {
        text-align: left;
    }
    .home-menu ul {
        float: right;
    }

    .button-success,
    .button-error,
    .button-warning,
    .button-secondary,
    .button-primary {
        color: white;
        border-radius: 4px;
        text-shadow: 0 1px 1px rgba(0, 0, 0, 0.2);
    }

    .button-success {
        background: rgb(28, 184, 65);
    }

    .button-error {
        background: rgb(202, 60, 60);
    }

    .button-warning {
        background: rgb(223, 117, 20);
    }

    .button-secondary {
        background: rgb(66, 184, 221);
    }

    .button-primary {
        background: #0078e7;
    }
</style>

<!-- Fonts -->        
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

</head>
<body>
    <div id="app">
        <!-- <nav class="navbar button-secondary navbar-static-top">
            <div class="container">
                <div class="navbar-header"> -->

                    <!-- Collapsed Hamburger -->
                    <!-- <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#app-navbar-collapse">
                        <span class="sr-only">Toggle Navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button> -->

                    <!-- Branding Image -->
                <!--     <a class="navbar-brand" href="{{ url('/') }}" style="color: white;">
                        {{ config('app.name', 'Laravel') }}
                    </a>
                </div>

                <div class="collapse navbar-collapse" id="app-navbar-collapse"> -->
                    <!-- Left Side Of Navbar -->
                    <!-- <ul class="nav navbar-nav">
                        &nbsp;
                    </ul> -->

                    <!-- Right Side Of Navbar -->
                    <!-- <ul class="nav navbar-nav navbar-right"> -->
                    <!-- Authentication Links -->
                        <!-- @guest
                        <li><a href="{{ route('login') }}" style="color: white;">Login</a></li>
                        <li><a href="{{ route('register') }}" style="color: white;">Register</a></li>
                        @else
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" style="color: white;">
                                Master <span class="caret"></span>
                            </a>

                            <ul class="dropdown-menu" role="menu">
                                <li>
                                    <a href="{{ route('logout') }}"
                                    onclick="event.preventDefault();
                                    document.getElementById('logout-form').submit();">
                                    Logout
                                </a>
                            </li>
                        </ul>
                    </li>

                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" style="color: white;">
                            Cabang <span class="caret"></span>
                        </a>

                        <ul class="dropdown-menu" role="menu">
                            <li>
                                <a href="{{ route('logout') }}"
                                onclick="event.preventDefault();
                                document.getElementById('logout-form').submit();">
                                Logout
                            </a>
                        </li>
                    </ul>
                </li>

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" style="color: white;">
                        Setting <span class="caret"></span>
                    </a>

                    <ul class="dropdown-menu" role="menu">
                        <li>
                            <a href="{{ route('logout') }}"
                            onclick="event.preventDefault();
                            document.getElementById('logout-form').submit();">
                            Logout
                        </a>
                    </li>
                </ul>
            </li>

            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" style="color: white;">
                    {{ Auth::user()->name }} <span class="caret"></span>
                </a>

                <ul class="dropdown-menu" role="menu">
                    <li>
                        <a href="{{ route('logout') }}"
                        onclick="event.preventDefault();
                        document.getElementById('logout-form').submit();">
                        Logout
                    </a>

                    <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                        {{ csrf_field() }}
                    </form>
                </li>
            </ul>
        </li>                            
        @endguest
    </ul>
</div>
</div>
</nav> -->

<div class="header" style="padding-bottom: 70px;">
    <div class="home-menu pure-menu pure-menu-horizontal pure-menu-fixed">
        <a class="pure-menu-heading" href="">Your Site</a>

        <ul class="pure-menu-list">
            <li class="dropdown pure-menu-item">
                <a href="#" class="dropdown-toggle pure-menu-link" data-toggle="dropdown" role="button" aria-expanded="false" style="text-decoration: none;">Master <span class="caret"></span></a>

                <ul class="dropdown-menu" role="menu">
                    <li>
                        <a href="{{url('produk')}}">
                            Produk
                        </a>
                    </li>
                    <li>
                        <a href="{{url('cabang')}}">
                            Cabang
                        </a>
                    </li>
                </ul>

            </li>
            <li class="pure-menu-item">
                <a href="#" class="pure-menu-link" style="text-decoration: none;">Laporan</a>
            </li>
            <li class="pure-menu-item">
                <a href="#" class="dropdown-toggle pure-menu-link" data-toggle="dropdown" role="button" aria-expanded="false" style="text-decoration: none;">User <span class="caret"></span></a>

                <ul class="dropdown-menu" role="menu">
                    <li>
                        <a href="{{ route('logout') }}">
                            Hak Akses
                        </a>
                    </li>
                    <li>
                        <a href="{{ route('logout') }}">
                            Daftar User
                        </a>
                    </li>
                </ul>

            </li>
            <li class="pure-menu-item">
                <a href="#" class="dropdown-toggle pure-menu-link" data-toggle="dropdown" role="button" aria-expanded="false" style="text-decoration: none;">Pengaturan <span class="caret"></span></a>

                <ul class="dropdown-menu" role="menu">
                    <li>
                        <a href="{{url('profile/1')}}">
                            Profile
                        </a>
                    </li>                    
                </ul>

            </li>
            <li class="dropdown pure-menu-item">
                <a class="dropdown-toggle pure-menu-link" data-toggle="dropdown" role="button" aria-expanded="false" style="color: white;text-decoration: none;">
                    {{ Auth::user()->name }} <span class="caret"></span>
                </a>

                <ul class="dropdown-menu" role="menu">
                    <li>
                        <a href="{{ route('logout') }}"
                        onclick="event.preventDefault();
                        document.getElementById('logout-form').submit();">
                        Logout
                    </a>

                    <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                        {{ csrf_field() }}
                    </form>
                </li>
            </ul>
        </li>
    </ul>
</div>
</div>

<div style="padding-left: 10px; padding-right: 10px;">
    @yield('content')
</div>

</div>

<!-- Scripts -->
<script src="{{ asset('js/app.js') }}"></script>
</body>
</html>