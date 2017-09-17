<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', 'HomeController@index');

Auth::routes();

Route::get('logout',function ()
{
	Auth::logout();
	return redirect(url('/'));
});

Route::get('/home', 'HomeController@home')->name('home');



Route::group(['prefix' => 'cabang'] , function () {
Route::group(['middleware' => 'admin'], function()
{
	Route::get('', function () {
		return view('admin.cabang.index');
		});
	Route::get('add' , 'Auth\Cabang\BranchController@add');

	Route::get('edit', function () {
		return view('admin.cabang.edit');
		});

	});

});

Route::group(['prefix' => 'produk'] , function () {
Route::group(['middleware' => 'admin'], function()
{
	Route::get('', function () {
		return view('admin.produk.index');
	});

	Route::get('add', function () {
		return view('admin.produk.add');
	});

	Route::get('edit', function () {
		return view('admin.produk.edit');
	});
	});

});

Route::group(['prefix' => 'user'] , function () {
Route::group(['middleware' => 'admin'], function()
{
	Route::get('', function () {
		return view('admin.user.index');
	});

	Route::get('add', function () {
		return view('admin.user.add');
	});

	Route::get('edit', function () {
		return view('admin.user.edit');
	});
	});

});

