@extends('layouts.app')

@section('content')
<ol class="breadcrumb">
    <li>
        <a href="javascript:;"><i class="ti-home mr5"></i></a>
    </li>
    <li>
        <a href="javascript:;">Master</a>
    </li>
    <li class="active"><a href="{!! url('master/cabang') !!} ">Daftar Cabang</a></li>
</ol>
<div class="row">
    <div class="col-md-12">
        <section class="panel">
           <!-- <header class="panel-heading">Test Panel</header>-->
           <div class="panel-body">
            <div class="row">
                <div class="col-md-12">
                    <div class="pull-left">
                        <a href="{!! url('master/cabang/create') !!}" class="btn btn-primary mb15"><i class="ti ti-plus"></i> Tambah</a>
                        <a href="{!! url('master/cabang/import') !!}" class="btn btn-success mb15"><i class="ti ti-import"></i> Import</a>
                        <a href="{!! url('master/cabang/export') !!}" class="btn btn-warning mb15"><i class="ti ti-export"></i> Export</a>
                    </div>
                    <form class="form-inline" role="form" method="get" action="{{ url('master/cabang/search') }}">
                        <div class="form-group mr5">
                            <label class="control-label" for="cari">&nbsp;&nbsp;&nbsp;</label>
                            <input name="query" type="text" class="form-control" placeholder="Cari cabang" id="cari">
                        </div>
                        <input type="hidden" name="search" value="1">
                        <button type="submit" class="btn btn-sm btn-primary"><i class="ti ti-search"> Cari</i></button>
                    </form>
                </div>
            </div>

            <div class="pull-right">
                Total data ditemukan : 0
            </div>
            @if(session('alert'))
            <br/><br/>
            {!! session('alert') !!}
            @endif
            <div class="row">
                <div class="col-md-12">
                    <div class="table-responsive no-border">
                        <table class="table table-bordered table-striped mg-t editable-datatable">
                            <thead>
                                <tr class="bg-color">
                                    <th class="text-center">No</th>
                                    <th class="text-center">Kode</th>
                                    <th class="text-center">Nama Cabang</th>
                                    <th class="text-center">Alamat Cabang</th>
                                    <th class="text-center">No. Telepon</th>
                                    <th class="text-center">No. Rekening</th>
                                    {{--<th class="text-center">ID</th>--}}
                                    <th class="text-center">Option</th>
                                </tr>
                            </thead>
                            <tbody>                                
                                <tr>
                                    <td class="text-center">1</td>
                                    <td>1</td>
                                    <td>Nama</td>
                                    <td>Alamat</td>
                                    <td>0987654321</td>
                                    <td>1234567890</td>
                                    {{--<td class="text-center" style="background-color: rgba(34, 138, 255, 0.11)">{!! $value->id !!}</td>--}}
                                    <td align="center" class="fa-hover">
                                        <a data-toggle="tooltip" data-placement="left" title="Ubah"><i class="ti-pencil mr5" style="color: blue; font-size: medium"></i></a>
                                        <a href="javascript:void(0)" onclick="konfirm(id)" data-toggle="tooltip" data-placement="right" title="Hapus"><i class="ti-trash mr5" style="color: red; font-size: medium"></i></a>
                                    </td>
                                </tr>                                
                            </tbody>
                        </table>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="pull-right">
                                <!-- paginate -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
</div>

<script>
    function konfirm(id) {
        swal({
            title: "Apakah Anda Yakin?",
            text: "Data Barang dan Data Customer yg ada dalam Cabang ini juga akan Terhapus !",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: '#3085d6',   cancelButtonColor: '#d33',
            confirmButtonText: "Yes, delete it!",
            closeOnConfirm: false
        }).then(function() {
            swal("Deleted!", "Your imaginary file has been deleted.", "success");
            location.href =  "{{ url('master/cabang') }}/" + id + "/destroy";
        })

    }
</script>
@endsection