@extends('layouts.app')

@section('content')
<ol class="breadcrumb">
    <li>
        <a href="javascript:;"><i class="ti-home mr5"></i></a>
    </li>
    <li class="active">Pengaturan</li>
    <li class=""><a href="{!! url('pengaturan/user') !!}">Daftar User</a></li>
    <li class="active">Ubah User</li>
    <li class="active"> user->id </li>
</ol>
<section class="panel">
    <div class="panel-body">
        <form class="form-horizontal" role="form" method="post" action="{{ url('pengaturan/user/update') }}" enctype="multipart/form-data" id="fusered">
            <input type="hidden" name="urlnya" value="{!! url()->previous() !!}">
            {!! csrf_field() !!}
            <input type="hidden" name="id" value=" user->id ">
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="username" class="col-sm-3 control-label">Username</label>
                        <div class="col-sm-9">
                            <input name="username" type="text" class="form-control" id="username" placeholder="Username" value="user->username">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password" class="col-sm-3 control-label">Password</label>
                        <div class="col-sm-9">
                            <input name="password" type="password" class="form-control" id="password" placeholder="Isi jika akan diganti">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="role" class="col-sm-3 control-label">Hak Akses</label>
                        <div class="col-sm-9">
                            <select name="role_id" class="form-control" id="roleid">
                                
                                <option value="id" selected=""> role->role_name </option>
                                
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="status" class="col-sm-3 control-label">Status</label>
                        <div class="col-sm-9">
                            <select name="status" class="form-control">
                                <option value="1" selected="">AKTIF</option>
                                <option value="0" selected="">NON AKTIF</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group if.user->role->akses.samadengan.'koperasi'.spasi_tandatanya_spasi.''hide''.spasi_titikdua_spasi.''''" id="cb">
                        <label for="cabang" class="col-sm-3 control-label">Cabang</label>
                        <div class="col-sm-9">
                            <select name="cabang" id="cabang" class="form-control" style="width: 100%">
                                <option value="0" selected=""></option>
                                
                                <option value="id" selected=""> item->kode  - item->nama</option>
                                
                            </select>
                        </div>
                    </div>
                    <div class="form-group" id="postjr">
                        <label for="posting" class="col-sm-3 control-label">Posting Jurnal</label>
                        <div class="col-sm-9 icheck">
                            
                            <label><input name="posting" type="checkbox" value="1" id="posting" checked="">&nbsp;</label>
                            
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="tanggal_lahir" class="col-sm-3 control-label"></label>
                        <div class="col-sm-2">
                            <input type="button" id="btnsave" class="btn btn-primary btn-block" name="save" value="Save">
                        </div>
                        <div class="col-sm-2">
                            <a href="{{ url('pengaturan/user') }}" class="btn btn-danger btn-block">Cancel</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="foto" class="col-sm-3 control-label">Foto</label>
                        <div class="col-sm-9">
                            <!-- if.user.photo.kosong -->
                            <img id="imgfoto" src="{{asset('foto/default-avatar-user.png')}}" alt="your image" width="200" />
                            <!-- kecuali -->
                            <img id="imgfoto" src="{{asset('foto/user/user->photo')}}" alt="your image" width="200" />
                            <!-- selese -->
                            <input name="foto" type="file" id="foto" placeholder="Foto">
                            <input type="hidden" name="gambar" value="user->photo">
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</section>

<div class="modal fade" id="rejectModal" tabindex="-1" role="dialog" aria-labelledby="rejectModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg-danger">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="judul">Pilih nomor pinjaman</h4>
            </div>
            <div class="modal-body">
                <p id="mess">Anda TIDAK bisa melakukan PENARIKAN atau TRANSFER</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">Oke</button>
            </div>
        </div>
    </div>
</div>

<script>
    $('#roleid').on('change', function() {
        $.ajax({
            url: "{!! url('pengaturan/user/ajax') !!}/" + $(this).val(),
            data: {},
            dataType: "json",
            type: "get",
            success:function(data)
            {
                var tipe = data[0]["tipe"];
                if (tipe == "koperasi") {
                    $('#cb').val("0");
                    $('#cb').hide();
                    $('#postjr').removeClass('hide');
                    $('#postjr').show();
                } else {
                    $('#cb').removeClass('hide');
                    $('#cb').show();
                    $('#postjr').hide();
                }
            }

        });
    });

    $("#cabang").removeAttr('class');
    $("#cabang").select2();

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

    $('#btnsave').on('click', function() {
        if ($('#username').val() == "") {
            $('#judul').html('<h4 class="modal-title" id="judul">Username</h4>');
            $('#mess').html('<p id="mess">Username tidak boleh kosong.</p>');
            $('#rejectModal').modal();
        } else {
            $.ajax({
                url: "{!! url('pengaturan/user/ajax') !!}/" + $('#roleid').val(),
                data: {},
                dataType: "json",
                type: "get",
                success:function(data)
                {
                    var tipe = data[0]["tipe"];

                    if (tipe != "koperasi") {
                        if ($('#cabang').val() == "" || $('#cabang').val() == "0") {
                            $('#judul').html('<h4 class="modal-title" id="judul">Cabang</h4>');
                            $('#mess').html('<p id="mess">Cabang tidak boleh kosong.</p>');
                            $('#rejectModal').modal();
                        } else {
                            FunctionLoading();
                            $('#fusered').submit();
                        }
                    } else {
                        FunctionLoading();
                        $('#fusered').submit();
                    }
                }

            });
        }
    });
</script>
@endsection