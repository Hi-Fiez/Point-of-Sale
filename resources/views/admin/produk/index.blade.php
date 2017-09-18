@extends('layouts.app')

@section('content')

<div style="height:100px;">

    <div> Caption </div>

    <a onclick="FunctionLoading()" href="{!!url('pembayaran')!!}">
        <div id="caption">
            <img src="{{ url('assets/poscss/imgs/backbtn.png') }}" alt=""> Data Produk <!-- kembali -->
        </div>
    </a>

</div>

<div class="col-md-10 col-md-offset-1 col-sm-10 col-sm-offset-1 col-xs-12">

    <div id="table-scrolll">
        <table  class="pure-table table table-hover">
         <thead>
            <tr>
                <td align="center">Barcode</td>
                <td align="center">Nama Produk</td>
                <td align="center">Harga Jual</td>
                <td align="center">Stok</td>
                <td align="center">Hapus</td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td align="center" onclick="pilih('value->nama')"> value->barcode </td>
                <td align="center" onclick="pilih('value->nama')"> value->nama </td>
                <td align="center" onclick="pilih('value->nama')"> value->harga_jual </td>
                <td align="center" onclick="pilih('value->nama')">Rp.  value->stok </td>
                <td align="center">

                    <a href="{!! url('pos/penjualan/hod/value->id') !!}">
                        <button class="button-error pure-button">
                            <i class="fa fa-trash"></i>
                        </button>
                    </a>

                </td>
            </tr>

        </tbody>
    </table>
</div>

</div>

<input type="hidden">

<div style="top:300px;position:absolute"> produk->links() </div>

<div style="margin-top:20%;">No Ref   :</div>
<div style="margin-top:20%;margin-left:20%;"> - </div>

<button class="button-primary pure-button" style="margin-left:79%">OK</button>
<a onclick="FunctionLoading()" href="{!! url('pos/penjualan') !!}">
    <button class="button-error pure-button">Kembali
    </button>
</a>

<input type="hidden" style="position:absolute">

<script>

    function pilih(noref, id)
    {

      $('#Enoref').html(noref);
      $('#Eid').val(noref);
      $('#idnyaaa').val(id);
  }

  $('#btnok').on('click', function () {    
    var idd = $("#Eid").val();
    var idnya = $('#idnyaaa').val();


    location.href = "{!! url('pos/holding/back') !!}/" + idd + "/" + idnya; 
});

</script>
@endsection