@extends('layouts.app')

@section('content')

<style>
    body{
        margin:0;
        background-color:#369;
        overflow:auto;
    }
</style>

<div style="width:100%; height:140px; overflow:hidden; margin: 0 auto; background-color:#369">

  <div style="width:1500px; height:120px; margin:0 auto; overflow:hidden; position:relative">

   <a onclick="FunctionLoading()" href="{!!url('/pos/penjualan')!!}"><div id="caption" style="cursor:pointer;height:100px; margin-top:50px;float:left; margin-left:80px; position:absolute"><img src="{{ url('assets/poscss/imgs/backbtn.png') }}" alt=""> Data Produk </div></a>
   <div id="pagecaption" style="height:44px; margin-top:0px;float:left; margin-left:12px; position:absolute"> Caption </div>

</div>

</div>

<input type="hidden" id="idnyaaa">
<button id="btnok" style="width:7%;height:5%;color:#FFF;;background:#3498db;border:none;margin-top:550px;position:absolute;text-align:center;font-size:18px;position:absolute;margin-left:79%">OK</button>
<a onclick="FunctionLoading()" href="{!! url('pos/penjualan') !!}"><button style="width:7%;height:5%;color:#FFF;background:#e74c3c;border:none;margin-top:550px;position:absolute;text-align:center;font-size:18px;position:absolute;margin-left:87%">Kembali</button></a>
<div style="margin-top:40%;margin-left:10%;font-size:30px;position:absolute;color:#FFF">No Ref   :</div>
<div id="Enoref" style="margin-top:40%;margin-left:20%;font-size:30px;position:absolute;color:#FFF"> - </div>
<!-- <input type="text" id="Enoref" style="position:absolute;margin-top:40%;margin-left:20%">
--><input type="hidden" id="Eid" style="position:absolute">
<div class="col-md-6 col-sm-6 col-xs-12" style="margin-top:100px; margin-left:50px; width:92.5%;height:60%;">

    <div class="x_panel" style="background:#369;margin-top:-40px">
        <div id="table-scrolll">
            <table  class="table table-hover" style="margin-top:0px; margin-left:0px;width:100%;position:relative;background:white;">
             <thead>
                <tr style="background:#3498db; color: white; font-size:20px;">
                    <td align="center">Barcode</td>
                    <td align="center">Nama Produk</td>
                    <td align="center">Harga Jual</td>
                    <td align="center">Stok</td>
                    <td width="200px" align="center"></td>
                </tr>
            </thead>
            <tbody style="height: 50px;">

                <tr style="background-color: white; font-size:18px; color:black;">
                    <td align="center" onclick="pilih('value->nama')"> value->barcode </td>
                    <td align="center" onclick="pilih('value->nama')"> value->nama </td>
                    <td align="center" onclick="pilih('value->nama')"> value->harga_jual </td>
                    <td align="center" onclick="pilih('value->nama')">Rp.  value->stok </td>
                    <td align="center">

                        <a href="{!! url('pos/penjualan/hod/value->id') !!}"><button style="width:50px;height:20px;background:red;font-size:10px;color:#FFF;border:none;">Hapus</button></td></a>
                    </tr>
                    
                </tbody>
            </table>
        </div>
    </div>
</div>
<div style="margin-left:6%;top:575px;position:absolute"> produk->links() </div>

<script>

    function pilih(noref, id)
    {

      $('#Enoref').html(noref);
      $('#Eid').val(noref);
      $('#idnyaaa').val(id);
  }

  $('#btnok').on('click', function () {
    //alert("{!! url('pos/holding/back') !!}/" + $("#Eid").val());
            // $.ajax({
            //     url: "{!! url('pos/holding/back') !!}/" + $("#Eid").val(),
            //     data: {},
            //     dataType: "json",
            //     type: "get",
            //     success:function(data)
            //     {

            //     }

            // });
            var idd = $("#Eid").val();
            var idnya = $('#idnyaaa').val();

 //alert("{!! url('pos/holding/back') !!}/" + idd );

 location.href = "{!! url('pos/holding/back') !!}/" + idd + "/" + idnya; 
});

</script>
@endsection