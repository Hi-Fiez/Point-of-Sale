@extends('layouts.app')

@section('content')
<ol class="breadcrumb">
    <li>
        <a href="javascript:;"><i class="fa fa-home"></i></a>
    </li>
    <li>
        <a href="javascript:;">Pengaturan</a>
    </li>
    <li class="active"><a href="{!! url('pengaturan/profil') !!}">Profil</a></li>
</ol>
<div class="row">

    <div class="col-md-12">
        <section class="panel no-b">
            <div class="panel-body">
                <form role="form" class="form-horizontal" method="POST" 
                enctype="multipart/form-data" action="{{url('profile/update')}}">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Nama Koperasi</label>
                                <div class="col-sm-9">
                                    <input name="nama" type="text" class="form-control" 
                                    id="nama_koperasi" placeholder="Nama" value="{{$profile->nama}}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Kode Koperasi</label>
                                <div class="col-sm-9">
                                    <input name="kode" type="text" class="form-control" id="kode_koperasi" placeholder="Kode" value="{{$profile->kode}}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="telepon" class="col-sm-3 control-label">Telepon</label>
                                <div class="col-sm-9">
                                    <input name="telp" type="text" class="form-control" id="telepon" placeholder="Telepon" value="{{$profile->telp}}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-sm-3 control-label">Alamat</label>
                                <div class="col-sm-9">
                                    <textarea name="alamat" class="form-control" id="alamat_koperasi" placeholder="Alamat" rows="5">{{$profile->alamat}}</textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="kode_pos" class="col-sm-3 control-label">Kode Pos</label>
                                <div class="col-sm-9">
                                    <input name="kode_pos" type="text" class="form-control" id="kode_pos" placeholder="Kode Pos" onkeyup="validAngka(this)" 
                                    value="{{$profile->kode_pos}}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="foto" class="col-sm-3 control-label">Logo</label>
                                <div class="col-sm-9">
                                    <input name="logo" type="file" id="foto" placeholder="Foto" onchange="readURL(this);">
                                </div>
                            </div>
<<<<<<< HEAD
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <div class="col-sm-5">

                                    <!-- at.if.kalo.foto.kosong -->
                                    <!-- <img id="imgfoto"  src="{!! asset('foto/profil/profil->foto') !!}" /> -->
                                    <img id="imgfoto" src="{{url('images/'.$profile->logo)}}">
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
=======
>>>>>>> 47e70724ae002ceb24bb2f25302587af32bcf48e
                            <div class="form-group">
                                <input type="hidden" name="_token" value="{{csrf_token()}}">
                                <input type="hidden" name="id" value="{{$profile->id}}">
                                <label for="tanggal_lahir" class="col-sm-3 control-label"></label>
                                <div class="col-sm-2">
                                    <input type="submit" onclick="FunctionLoading()" class="btn btn-primary btn-block" name="save" value="Save">
                                </div>
                                <div class="col-sm-2">
                                    <a href="{{url('profile')}}" class="btn btn-danger btn-block">Cancel</a>
                                </div>
                            </div>                            
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <!-- at.if.kalo.foto.kosong -->
                                <!-- <img id="imgfoto"  src="{!! asset('foto/profil/profil->foto') !!}" /> --><center>
                                <img class="pure-img" id="imgfoto" src="https://www.google.co.id/logos/doodles/2017/samuel-johnsons-308th-birthday-5999730113904640.2-law.gif">
                            </center>
                        </div>
                    </div>
                </div>                    
            </form>
        </div>
    </section>
</div>
</div>

<script>
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#imgfoto')
                .attr('src', e.target.result)
                .width(300)
                .height(300);
            };

            reader.readAsDataURL(input.files[0]);
        }
    }

    function validAngka(a)
    {
        if(!/^[0-9.]+$/.test(a.value))
        {
            a.value = a.value.substring(0,a.value.length-1000);
        }
    }
</script>
@endsection
