<?php

namespace App\Http\Controllers\Auth\Profil;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Auth;
use \App\Profile;
use Illuminate\Support\Facades\Input;

/*tai*/

class ProfileController extends Controller
{
	public function __construct()
    {
        $this->middleware('auth');
    }

    public function index($id)
    {
    	$data['profile'] = Profile::find($id);
    	return view('admin.profile.index')->with($data);
    }

    public function update()
    {
    	$profile = Profile::find(Input::get('id'));
    	$profile->nama = Input::get('nama');
    	$profile->kode = Input::get('kode');
    	$profile->telp = Input::get('telp');
    	$profile->alamat = Input::get('alamat');
    	$profile->kode_pos = Input::get('kode_pos'); 
    	if(Input::hasFile('logo')){
                $logo = date("YmdHis")
                .uniqid()
                ."."
                .Input::file('logo')->getClientOriginalExtension();
                Input::file('logo')->move(public_path('images'),$logo);
                $profile->logo = $logo;
            }
        $profile->save();
        return redirect(url('profile/1'));
    	 
    }

}
