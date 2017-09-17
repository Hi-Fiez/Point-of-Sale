<?php

namespace App\Http\Controllers\Auth\Cabang;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use \App\Bank;

class BranchController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function add(Request $req)
    {
    	$data['bank'] = Bank::get();
    	return view('admin.cabang.add')->with($data);
    }

}
