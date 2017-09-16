@extends('layouts.app')

@section('content')
<ol class="breadcrumb">
    <li>
        <a href="javascript:;"><i class="ti-home mr5"></i></a>
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
                <form role="form" class="form-horizontal" method="post" enctype="multipart/form-data" action="{!! url('pengaturan/profil') !!}">
                    <input type="hidden" name="id" value=" profil->id ">
                    <input type="hidden" name="gambar" value=" profil->foto ">
                    @if(session('alert'))
                    <br/><br/>
                    {!! session('alert') !!}
                    @endif
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="nama_koperasi" class="col-sm-3 control-label">Nama Koperasi</label>
                                <div class="col-sm-9">
                                <input name="nama_koperasi" type="text" class="form-control" id="nama_koperasi" placeholder="Nama koperasi" value=" profil->nama_koperasi ">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="kode_koperasi" class="col-sm-3 control-label">Kode Koperasi</label>
                                <div class="col-sm-9">
                                    <input name="kode_koperasi" type="text" class="form-control" id="kode_koperasi" placeholder="Kode Koperasi" value=" profil->kode ">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="norekening" class="col-sm-3 control-label">Nomor Rekening</label>
                                <div class="col-sm-9">
                                    <input name="nomor_rekening" type="text" class="form-control" id="norekening" placeholder="Nomor Rekening" onkeyup="validAngka(this)" value=" profil->nomor_rekening ">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="telepon" class="col-sm-3 control-label">Telepon</label>
                                <div class="col-sm-9">
                                    <input name="telepon" type="text" class="form-control" id="telepon" placeholder="Telepon" value=" profil->telepon ">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="alamat_koperasi" class="col-sm-3 control-label">Alamat</label>
                                <div class="col-sm-9">
                                    <textarea name="alamat_koperasi" class="form-control" id="alamat_koperasi" placeholder="Alamat" rows="5"> profil->alamat_koperasi </textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="kode_pos" class="col-sm-3 control-label">Kode Pos</label>
                                <div class="col-sm-9">
                                    <input name="kode_pos" type="text" class="form-control" id="kode_pos" placeholder="Kode Pos" value=" profil->kode_pos " onkeyup="validAngka(this)">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="foto" class="col-sm-3 control-label">Logo</label>
                                <div class="col-sm-9">
                                    <input name="foto" type="file" id="foto" placeholder="Foto">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <div class="col-sm-5">
                                    
                                    <!-- at.if.kalo.foto.kosong -->
                                    <img id="imgfoto"  src="{!! asset('foto/profil/profil->foto') !!}" />
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <input type="hidden" name="_token" value="{{csrf_token()}}">
                                <label for="tanggal_lahir" class="col-sm-3 control-label"></label>
                                <div class="col-sm-2">
                                    <input type="submit" onclick="FunctionLoading()" class="btn btn-primary btn-block" name="save" value="Save">
                                </div>
                                <div class="col-sm-2">
                                    <a href="{!! url('pengaturan/profil') !!}" class="btn btn-danger btn-block">Cancel</a>
                                </div>
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
                $('#imgfoto').attr('src', e.target.result);
            }

            reader.readAsDataURL(input.files[0]);
        }
    }

    $("#foto").change(function(){
        readURL(this);
    });

    function validAngka(a)
    {
        if(!/^[0-9.]+$/.test(a.value))
        {
            a.value = a.value.substring(0,a.value.length-1000);
        }
    }
</script>
@endsection