@extends('layouts.app')

@section('content')
<ol class="breadcrumb">
    <li>
        <a href="javascript:;"><i class="fa fa-home"></i></a>
    </li>
    <li>
        <a href="javascript:;">Master</a>
    </li>
    <li class="active">Daftar Cabang</li>
</ol>
<div class="row">
    <div class="col-md-12">
        <section class="panel">
         <!-- <header class="panel-heading">Test Panel</header>-->
         <div class="panel-body">
            <div class="row">
                <div class="col-md-12">
                    <div class="pull-left">
                        <a href="{!! url('cabang/add') !!}">
                            <button class="button-primary pure-button">
                                <i class="fa fa-plus"></i>
                                &nbsp;Tambah
                            </button>
                        </a>
                        <a href="{!! url('cabang/import') !!}">
                            <button class="button-success pure-button">
                                <i class="fa fa-download"></i>
                                &nbsp;Import
                            </button>
                        </a>
                        <a href="{!! url('cabang/export') !!}">
                            <button class="button-warning pure-button">
                                <i class="fa fa-upload"></i>
                                &nbsp;Export
                            </button></a>
                        </div>
                        <div class="pull-right" style="padding-right: 10px;">
                            <b>
                                <p></p>
                                <i class="fa fa-table"></i>
                                Total data ditemukan : 0                        
                            </b>
                        </div>                        
                        <form class="pure-form" role="form" method="get" action="{{ url('cabang') }}">
                            &nbsp;&nbsp;&nbsp;
                            <input class="pure-input-rounded" name="query" type="text" placeholder="Cari cabang" id="cari">
                            <input type="hidden" name="search" value="1">
                            <button type="submit" class="pure-button pure-button-primary pure-input-rounded">
                                <i class="fa fa-search">
                                </i>
                            </button>
                        </form>
                    </div>
                </div>                
                <div class="row">
                    <p></p>
                    <div class="col-md-12">
                        <div class="table-responsive no-border">
                            <table class="pure-table pure-table-horizontal table-striped" style="width: 100%">
                                <thead>
                                    <tr bgcolor="#42b8dd" style="color: white">
                                        <th class="text-center">No</th>
                                        <th>Kode</th>
                                        <th>Nama Cabang</th>
                                        <th>Alamat Cabang</th>
                                        <th>No. Telepon</th>
                                        <th>No. Rekening</th>
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
                                        <td align="center">
                                            <a data-toggle="tooltip" data-placement="left" title="Ubah">
                                                <button class="button-secondary pure-button">
                                                    <i class="fa fa-pencil"></i>
                                                </button>
                                            </a>
                                            <a href="javascript:void(0)" onclick="konfirm(id)" data-toggle="tooltip" data-placement="right" title="Hapus">
                                                <button class="button-error pure-button">
                                                    <i class="fa fa-trash"></i>
                                                </button>
                                            </a>
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
@endsection
