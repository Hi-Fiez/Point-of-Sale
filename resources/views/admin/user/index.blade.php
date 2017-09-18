@extends('layouts.app')

@section('content')
<ol class="breadcrumb">
    <li>
        <a href="javascript:;"><i class="fa fa-home"></i></a>
    </li>
    <li class="active">Pengaturan</li>
    <li class="active"><a href="{!! url('user') !!}">Daftar User</a></li>
</ol>
<div class="row">
    <div class="col-md-12">
        <section class="panel no-b">
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="pull-left">
                            <a href="{{ url('user/add') }}" class="btn btn-sm btn-primary mb15"><i class="ti ti-plus"></i> Tambah</a>
                        </div>
                        <form class="form-inline" role="form" method="get" action="{{ url('pengaturan/user/search') }}">
                            <div class="form-group mr5">
                                &nbsp;&nbsp;&nbsp;<input name="query" type="text" class="form-control" placeholder="Cari" id="cari" value="">
                            </div>
                            <input type="hidden" name="search" value="1">
                            <button type="submit" class="btn btn-sm btn-primary"><i class="ti ti-search"> Cari</i></button>
                        </form>
                    </div>
                </div>

                <div class="pull-right">
                    Total data ditemukan : 0
                </div>
                <div class="table-responsive">
                    <table class="table table-striped table-bordered responsive no-m">
                        <thead>
                            <tr class="bg-color">
                                <th class="text-center" >No</th>
                                <th class="text-center">Username</th>
                                <th class="te,xt-center">Hak Akses</th>
                                <th class="text-center">Status</th>
                                <th class="text-center">&nbsp;</th>
                            </tr>
                        </thead>
                        <tbody>

                            <tr>
                                <td class="text-center">1</td>
                                <td> user->username </td>
                                <td> role->role_name </td>
                                <!-- jika.user.status.samadenganduakali.1 -->
                                <td>Aktif</td>
                                <!-- selain -->
                                <td>Non aktif</td>
                                <!-- selese -->
                                <td align="center" class="fa-hover">
                                    <a href="{{ url('pengaturan/user/data'.'/user->id') }}"data-toggle="tooltip" data-placement="left" title="Ubah"><i class="ti-pencil mr5" style="color: blue; font-size: medium"></i></a>
                                    <a href="javascript:void(0)" onclick="konfirm(user->id)" data-toggle="tooltip" data-placement="right" title="Hapus"><i class="ti-trash mr5" style="color: red; font-size: medium"></i></a>
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
        </section>
    </div>
</div>

<script>
    function konfirm(id) {
        swal({
            title: "Are you sure?",
            text: "You will not be able to recover this imaginary file!",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: '#3085d6',   cancelButtonColor: '#d33',
            confirmButtonText: "Yes, delete it!",
            closeOnConfirm: false
        }).then(function() {
            swal("Deleted!", "Your imaginary file has been deleted.", "success");
            location.href =  "{{ url('pengaturan/user/delete') }}/" + id;
        })

    }
</script>
@endsection
