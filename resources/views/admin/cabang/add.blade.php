@extends('layouts.app')

@section('content')
<ol class="breadcrumb">
    <li>
        <a href="javascript:;"><i class="fa fa-home"></i></a>
    </li>
    <li>
        <a href="javascript:;">Master</a>
    </li>
    <li class="active"><a href="{!! url('cabang') !!}">Daftar Cabang</a></li>
    <li class="active">Tambah</li>
</ol>
<div class="row">
    <div class="col-md-12">
        <section class="panel no-b">
            <div class="panel-body">
                <form role="form" class="form-horizontal" method="post" action="{!! url('master/cabang') !!}" id="fcab">
                    <div class="box-tab">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#umum" data-toggle="tab">Umum</a>
                            </li>                            
                            <li><a href="#approve" data-toggle="tab">Hak Akses Approve</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane fade active in" id="umum">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <br>
                                            <label for="Kode" class="col-sm-3 control-label">Kode</label>
                                            <div class="col-sm-9">
                                                <input name="kode" type="text" class="form-control" id="kode" placeholder="Kode" required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="namaunit" class="col-sm-3 control-label">Nama Cabang</label>
                                            <div class="col-sm-9">
                                                <input name="nama" type="text" class="form-control" id="nama" placeholder="Nama Cabang" required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="alamat" class="col-sm-3 control-label">Alamat</label>
                                            <div class="col-sm-9">
                                                <textarea name="alamat" type="text" class="form-control" id="alamat" placeholder="Alamat" required></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="kota" class="col-sm-3 control-label">Kota</label>
                                            <div class="col-sm-9">
                                                <input name="kota" type="text" class="form-control" id="kota" placeholder="Kota" required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="provinsi" class="col-sm-3 control-label">Provinsi</label>
                                            <div class="col-sm-9">
                                                <input name="provinsi" type="text" class="form-control" id="provinsi" placeholder="Provinsi" required>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">                                        
                                        <div class="form-group">
                                            <br>
                                            <label for="kode_pos" class="col-sm-3 control-label">Kode Pos</label>
                                            <div class="col-sm-9">
                                                <input name="kode_pos" type="text" class="form-control" id="kode_pos" placeholder="Kode Pos" required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="telepon" class="col-sm-3 control-label">Telepon</label>
                                            <div class="col-sm-9">
                                                <input name="telepon" type="text" class="form-control" id="telepon" placeholder="Telepon" required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="fax" class="col-sm-3 control-label">Fax</label>
                                            <div class="col-sm-9">
                                                <input name="fax" type="text" class="form-control" id="fax" placeholder="Fax" required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="fax" class="col-sm-3 control-label">Bank</label>
                                            <div class="col-sm-9">
                                                <select required>
                                                    <option disabled="true" selected>Pilih Satu
                                                    </option>
                                                    @foreach($bank as $key)
                                                    <option>{{$key->nama_bank}}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="norekening" class="col-sm-3 control-label">No. Rekening</label>
                                            <div class="col-sm-9">
                                                <input name="nomor_rekening" type="text" class="form-control" id="norekening" placeholder="No. Rekening" onkeyup="validAngka(this)" required>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>                            
                            <div class="tab-pane fade" id="approve">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <br>
                                                <div class="pull-left">
                                                    <a href="javascript:void(0)" id="add_row" class="btn btn-sm btn-primary"><i class="fa fa-plus"> Tambah</i></a>
                                                </div>
                                            </div>
                                        </div>
                                        <br>
                                        <div class="table-responsive">
                                            <table class="table table-striped table-bordered responsive no-m" id="input-jurnal">
                                                <thead>
                                                    <tr class="bg-color">
                                                        <th width="5%" class="text-center">No</th>
                                                        <th width="30%" class="text-center">Level</th>
                                                        <th width="60%" class="text-center">User</th>
                                                        <th width="5%">&nbsp;</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr id="f0">
                                                        <td class="text-center">1</td>
                                                        <td>
                                                            <select name="levels[]" style="width:100%" required>
                                                                {{--<option>Pilih Level</option>--}}
                                                                <option value="1">Level 1</option>
                                                                <option value="2">Level 2</option>
                                                                <option value="3">Level 3</option>
                                                                <option value="4">Release</option>
                                                            </select>
                                                        </td>
                                                        <td>
                                                            <select name="users[]" style="width:100%" required>
                                                                {{--<option>Pilih User</option>--}}
                                                                
                                                                <option value="id">username - role name</option>
                                                                
                                                            </select>
                                                        </td>
                                                        <td class="text-center">
                                                            <a href="#" class="btn btn-sm btn-danger btn-del"><i class="ti-trash"></i></a>
                                                        </td>
                                                    </tr>
                                                    <tr></tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <input type="hidden" name="_token" value="{{csrf_token()}}">
                                <label for="tanggal_lahir" class="col-sm-3 control-label"></label>
                                <div class="col-sm-2">
                                    <button id="btnsave" type="button" class="btn btn-primary btn-block" name="save">Save</button>
                                </div>
                                <div class="col-sm-2">
                                    <a href="{!! url('master/cabang') !!}" class="btn btn-danger btn-block">Cancel</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </section>
    </div>
</div>
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
    $("select").removeAttr('class');
    $("select").select2();

    $('#btnsave').on('click', function() {
        if ($('#kode').val() == "") {
            $('#judul').html('<h4 class="modal-title" id="judul">Kode Cabang</h4>');
            $('#mess').html('<p id="mess">Kode Cabang tidak boleh kosong.</p>');
            $('#rejectModal').modal();
        } else if($('#nama').val() == "") {
            $('#judul').html('<h4 class="modal-title" id="judul">Nama Cabang</h4>');
            $('#mess').html('<p id="mess">Nama Cabang tidak boleh kosong.</p>');
            $('#rejectModal').modal();
        } else if($('#norekening').val() == "") {
            $('#judul').html('<h4 class="modal-title" id="judul">Nomor Rekening</h4>');
            $('#mess').html('<p id="mess">Nomor Rekening Cabang tidak boleh kosong.</p>');
            $('#rejectModal').modal();
//            } else if($('#shu').val() == "") {
//                $('#judul').html('<h4 class="modal-title" id="judul">SHU POS</h4>');
//                $('#mess').html('<p id="mess">SHU POS tidak boleh kosong.</p>');
//                $('#rejectModal').modal();
} else {
    FunctionLoading();
    $('#fcab').submit();
}

});

    function validAngka(a)
    {
        if(!/^[0-9.]+$/.test(a.value))
        {
            a.value = a.value.substring(0,a.value.length-1000);
        }
    }

    $("#add_row").click(function () {
        var current_row = $("#input-jurnal > tbody > tr").length - 1;
        var tr_tag = "<tr id=\"f"+current_row+"\">" +
        "<td class=\"text-center\">"+ (current_row + 1) +"</td>" +
        "<td>" +
        "<select name=\"levels[]\" style=\"width:100%\" required>" +
        "<option>Pilih Level</option>" +
        "<option value=\"1\">Level 1</option>" +
        "<option value=\"2\">Level 2</option>" +
        "<option value=\"3\">Level 3</option>" +
        "<option value=\"4\">Release</option>" +
        "</select>" +
        "</td>" +
        "<td>" +
        "<select name=\"users[]\" style=\"width:100%\" required>" +
        "<option>Pilih User</option>" +
        "foreach($user as $item)" +
        "<option value=\" item->id \"> item->username  -  item->roleid->role_name </option>"  +
        "endforeach" +
        "</select>" +
        "</td>" +
        "<td class=\"text-center\">" +
        "<a href=\"#\" class=\"btn btn-sm btn-danger btn-del\"><i class=\"ti-trash\"></i></a>" +
        "</td>" +
        "</tr>";
        $("#input-jurnal > tbody > tr:last-child").before(tr_tag);
        $("select").select2();

        $(".btn-del").each(function (key) {
            del_row($(this));
        });

    });

    $(".btn-del").each(function (key) {
        del_row($(this));
    });

    $("select").select2();

    function del_row(el) {
        el.click(function(){
            el.parent().parent().remove();
        })
    }
</script>
@endsection
