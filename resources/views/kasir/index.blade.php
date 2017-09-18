@extends('layouts.guest')

@section('content')
<body>
    <style>
        .lightbox {

            border: 20px solid rgba(0, 0, 0, 0.2);
        }
        body{
            margin:0;
            background-color:#FFF;
        }
    </style>
</body>
<body id="">
    <div style="background: #369;width:100%;height:120px"></div>
    <div style="background: #E0E0E0;width:100%;height:648px"></div>
    <div class="lightbox" style="background: #ecf0f1;position: absolute;height:1000px;width:93%;margin-top:-50%;margin-left: 3.5%;">
        <div style="width:100%; height:100%; overflow:auto; margin: 0 auto; position:absolute; 
        margin-top:0px; margin-left:0px; background-color:#369">
        <input id="statusnya" type="hidden" value="status">
        <input id="rolenya" type="hidden" value="$rolenya">
        <img id="buttonnya" style="cursor:pointer;position:absolute;margin-left:2%;margin-top:7.5%" src="{{ url('assets/poscss/imgs/backbtn.png') }}" alt="">
        <div style="color:#FFF;font-size:40px;height:80px; margin-top:50px;float:left; 
        margin-left:5%;position:absolute"><img src="{{ asset('foto/logo-cabangrekening.png') }}" 
        style="width:50px;height:50px;padding-bottom: 5px;" alt="">&nbsp;Point Of Sale ( cabangnyo  )</div>
        <div style="margin-left: 100px">
            <div style="margin-left:75px; position:absolute; margin-top:200px;">
                @if(\Illuminate\Support\Facades\Auth::user()->photo == "ava")
                <img src="{{ asset('foto/default-avatar-user.png') }}" 
                style="width:135px;height:135px;" alt="">
                @else
                <img src="{{ asset('foto/user/'.\Illuminate\Support\Facades\Auth::user()->photo) }}" style="width:135px;height:135px;" alt="">
                @endif

            </div>
            <div id="labelkasir" style="margin-left:220px; float:left;"><b>Nama Kasir&nbsp;&nbsp;:</b></div>
            <div style="font-size:50px;position:absolute;margin-left:-20%">idkasir</div>
            <div id="labelkasir" style="margin-left:340px;">&nbsp;&nbsp;namakasir</div>
            <div id="labelnoref"style="margin-left:220px; float:left;">No. Ref&nbsp;&nbsp;:</div>
            <div id="labelnoref" style="margin-left:305px;">noref</div>
            <input type="hidden" value="noref" id="norefnya">
            <input type="hidden" id="norefnyaaa">
            <div id="labeltanggal1" class="labeltanggal1" style="margin-left:220px; float:left;">Tanggal&nbsp;:</div>
            <div id="labeltanggal2" class="labeltanggal2" style="margin-left:305px;"><?php echo date("Y-m-d");?></div>
            <div id="labeltotal" style="float:left; margin-left:60%"><b>Total Belanja</b></div>
            <div style="position:absolute;margin-left:-0.5%;width:83%">
                <div id="btntotal" class="btntotal" style="float:left; margin-top:15%; margin-left:72.6%;"><div style="margin-top:12px;margin-left:10px; font-size:400%; color:#fff;"><b>Rp.  number_format(dolar_total ,2,",",".")</b></div>
            </div>
        </div>
        <input id="input" type="hidden" value="dolar_total}">
        <input id="inputnoreff" name="inputnoref" type="hidden" value="noref">
        <div id="divinput" class="input-control text" style="font-size:20px; margin-left:59.6%;margin-top:21.5%;color:black;position:absolute;width:21.5%;height:40%">
            <select style="width:100%;font-size:20px;margin-left:0%;height:100%;position:absolute;color:black;margin-top:0%" id="barcode" name="Ecari">

                <option></option>
                <option value="values->barcode">
                    values->barcode - values->nama 
                </option>
                
            </select>
        </div>
        <button id="carikode" data-hotkey="ALT" class="btncaribarang" style="margin-top:21.4%;margin-left: 100px;">Alt | Cari Barang</button>

        <br>
        <br>
        @if(session('msg'))
        <div id ="produktdk" style="color:red;font-size:14px;position:absolute;margin-top:20%;margin-left:60%">{!! session('msgclass') !!}</div>
        {!! session('msg') !!}
        @endif

        <button id="ctklaporan" onclick="lightbox_open5()" style="width:13%;height:40px;border:none;background:#3498db;margin-left:5%;margin-top:51.5%;color:#fff;font-size:19px;position:absolute;cursor:pointer;padding-left:5px;padding-top:3px;padding-right:10px;text-align:center;">Cetak Laporan</button>

        <button id="btnesc" data-hotkey="ESC" class="btnesc" onclick="FunctionLoading()" data-hotkey="ESC" style="border:none; margin-left: 100px;">ESC</button>
        <div id="divesc" data-hotkey="ESC" style="margin-left:11%;margin-top:48.5%;color:#fff;font-size:22px;position:absolute;cursor:pointer;">Keluar</div>
        <button id="ceksaldo" onclick="lightbox_open2()" data-hotkey="F8" class="btnceksaldo" style="border:none;margin-top:48%; margin-left: 100px;">F8 | Cek Saldo</button>
        <div id="light2" class="lighte">
            <div id="divceksaldo" style="width:5975%; height:1680%; overflow:hidden; margin: 0 auto; position:absolute; margin-top:1300%; margin-left:-1100%; background-color:#59ABE3">
            </div>
        </div>

        <button id="btnretur" onclick="lightbox_open3()" data-hotkey="F10" style="width:13%;height:40px;border:none;background:#0e9558;margin-left:48.5%;margin-top:51.5%;color:#fff;font-size:19px;position:absolute;cursor:pointer;padding-left:5px;padding-top:3px;padding-right:10px;text-align:center;font-family:"Lucida Sans Unicode", "Lucida Grande", sans-serif;">F10 | Retur POS</button>

        <div id="light3" class="lighte">
            <div id="divretur" style="width:5975%; height:1680%; overflow:hidden; margin: 0 auto; position:absolute; margin-top:1400%; margin-left:-1055%; background-color:#59ABE3">
            </div>
        </div>


        <button id="hold" data-hotkey="F7" class="btnhold" style="border:none;margin-top:51.5%;margin-left: 100px;">
            F7 | Tahan</button>

            <button id="qtyio" data-hotkey="F7" class="btnhold" style="border:none;margin-top:51.5%;margin-left: 100px;">F7 | Tahan</button>
            <!--END HOLD-->

            <button data-hotkey="F9" onclick="" id="void" class="btnvoid" style="border:none;margin-top:48%;margin-left: 100px;">F9 | Batal</button>
            <!--PAYMENT-->
            <button id="payment" onclick="lightbox_open()" class="btnpayment" data-hotkey="F4" style="border:none;margin-top:51.5%;margin-left: 100px;">F4 | Pembayaran</button>

            <div id="light" class="lighte">

                <div id="divpayment" style="width:5975%; height:1980%; overflow:hidden; margin: 0 auto; position:absolute; margin-top:1200%; margin-left:-1100%; background-color:#59ABE3">
                </div>
            </div>
            <a href="javascript:void(0)"><button id="btngantiqty" data-hotkey="F2" class="btnenter" style="border:none;margin-top:48%;position:absolute;margin-left: 100px;text-align:center;display:block" onclick="button3Click()">F2 | Ganti Qty</button></a>

            <form action="{{ url('pos/ubah/qty/enter')  }}" method="get" id="formqty">
                <div id="1nya" style="width:90.3%;position:absolute;margin-left:4.1%;margin-top:3%">

                 <div class="x_panel" style="position:absolute;background:#369;margin-top:25%">
                    <div id="table-scroll">
                        <table  class="table" style="width:100%;position:relative;background:white;">
                           <thead>
                            <tr style="background:#3498db; color: white; font-size:20px;">
                                <td align="center">Produk</td>
                                <td align="center">Qty</td>
                                <td align="center">Harga</td>
                                <td align="center">Subtotal</td>
                                <td width="200px" align="center"></td>
                            </tr>
                        </thead>
                        <tbody style="height: 50px;">

                            <tr  style="background-color: white; font-size:18px; color:black;">
                                <td align="center" style="cursor:pointer" onclick="pilih(value->barcode , value->qty )">value->produk </td>
                                <td align="center" style="cursor:pointer">
                                    <button type="button" id="plus" onclick="buttonClick(value->id)" style="cursor:pointer;color:white;width:3%;height:30px;position:absolute;background:red;font-size:20px;text-align:center;margin-top:0%;margin-left:-30px;border:none"><b>+</b></button>
                                    <input id="Eqtyvalue->id" type="text" name="Eqtyvalue->id" value="value->qty" style="text-align:center;width:20%;margin-top:0%">
                                    <input id="TableManual"  name="cbpilih[value->id]" type="checkbox" style="display:none;cursor:pointer;" checked>
                                    <button id="minus" type="button" onclick="buttonClick2(value->id)" style="cursor:pointer;color:white;width:3%;height:30px;position:absolute;background:red;font-size:20px;text-align:center;margin-top:0%;margin-left:0%;border:none"><b>-</b></button>
                                </td>
                                <td align="center" style="cursor:pointer" onclick="pilih(value->barcode,$value->qty )">Rp.  number_format(value->harga ,2,",",".") </td>
                                <td align="center" style="cursor:pointer" onclick="pilih(value->barcode , value->qty)">Rp.  number_format(value->sub_total ,2,",",".") </td>
                                <td align="center">
                                   <button type="button" onclick="konfirm(value->id)" style="margin-top:0;width:50px;height:20px;background:red;font-size:15px;color:#FFF;border:none;" class="mif-bin"></button>
                               </td>
                           </tr>

                       </tbody>
                   </table>
               </div>
           </div>
       </div>
   </form>
</div>

</div>

</div>



<script>

    $('#TableManual').click(function (e) {
        $(this).closest('table').find('td input:checkbox').prop('checked', this.checked);
    });

    $('#btngantiqty').click(function(){

        var total = $('#input').val();

        if(total=="")
        {
            sweetAlert("Oops...", "Tidak ada transaksi", "error");
        }
        else
        {
            $('#formqty').submit();
        }

    });


    $("#barcode").select2({
        placeholder: "",
        allowClear: true
    });

    var ini = $('#statusnya').val();
    var rolenya = $('#rolenya').val();

    if (rolenya==4)
    {
        $('#buttonnya').css('display','none');
        $('#ctklaporan').css('display','block');
    }
    else
    {
        $('#buttonnya').css('display','block');
        $('#ctklaporan').css('display','none');
    }

    if (ini==0) {

        $('#imagenya').css('display','none');
        $('#1nya').css('width','90.3%');
        $('#1nya').css('margin-left','4.1%');
        $('#1nya').css('margin-top','3%');
        $('#ceksaldo').css('left','77.7%');
        $('#payment').css('left','77.7%');
        $('#btngantiqty').css('left','63.1%');
        $('#void').css('left','49.5%');
//    $('#btnesc').css('left','51.6%');
//    $('#divesc').css('margin-left','57.1%');
$('#btnretur').css('margin-left','49.5%');
$('#labeltotal').css('margin-left','60%');
$('#btntotal').css('margin-left','72.6%');
$('#hold').css('left','64%');
$('#divinput').css('margin-left','59.6%');
$('#carikode').	css('left','81%');
//    $('#ctklaporan').	css('margin-left','37%');
$('#produktdk').css('margin-left','60%');


}
else
{
    $('#imagenya').css('display','block');
    $('#1nya').css('width','76.3%');
    $('#produktdk').css('margin-left','45.5%');
    $('#1nya').css('margin-left','4.1%');
    $('#1nya').css('margin-top','5.7%');
    $('#ceksaldo').css('left','63.7%');
    $('#payment').css('left','63.7%');
    $('#btngantiqty').css('left','50.1%');
    $('#void').css('left','37.5%');
//    $('#btnesc').css('left','37.5%');
$('#btnretur').css('margin-left','37.5%');
//    $('#ctklaporan').css('margin-left','23.5%');
//    $('#divesc').css('margin-left','43%');
$('#labeltotal').css('margin-left','46%');
$('#btntotal').css('margin-left','55.5%');
$('#hold').css('left','51%');
$('#divinput').css('margin-left','45.6%');
$('#carikode').css('left','67%');
}

$('#btngantiqty').trigger('clik');
$('#btnesc').trigger('clik');
$('#btnpayment').trigger('clik');
$('#btnvoid').trigger('clik');
$('#btnhold').trigger('clik');
$('#btnceksaldo').trigger('clik');
$('#btnretur').trigger('clik');
$('#carikode').trigger('clik');


function konfirm(id) {
    swal({
        title: "Apakah Anda Yakin?",
        text: "Anda akan menghapus Produk ini .",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: '#3085d6',   cancelButtonColor: '#d33',
        confirmButtonText: "Yes!",
        closeOnConfirm: false
    }).then(function() {
        location.href =  "{{ url('pos/dete') }}/" + id;
    })

}

function button3Click() {


    var f = $('#Eqty').val();
    var id = $('#Eqtyy').val();
    $.ajax({
        url: "{!! url('pos/ubah/qty/enter') !!}" + "/" + f + "/" + id,
        data: {},
        dataType: "json",
        type: "get",
        success: function (data) {
            location.reload();

        }
    });

}

$("#ctklaporan").click(function(){

    location.href="{{ url('pos/laporan')  }}";

});


$("#barcode").keyup(function (e) {



    if (e.keyCode == 18) {
        location.href =  "{{ url('pos/penjualan') }}" + "/" + $('#barcode').val();



    }

    else if (e.keyCode == 27) {

        var rolenya = $('#rolenya').val();
        if (rolenya==4) {


            location.href="{!! url('logout') !!}";
        }
        else
        {
            location.href="{!! url('pos/index') !!}";
        }


    }
    else if (e.keyCode == 121) {

        var total = $('#input').val();

        if (total=="") {
            $("#divretur").load("{!! URL::to('/pos/cekretur') !!}/");
        }
        else
        {
            sweetAlert("Oops...", "Transaksi harus kosong", "error");
            $("#divretur").hide();
            document.getElementById('fade3').style.display='none';
        }

    }

    else if (e.keyCode == 113) {

        var total = $('#input').val();

        if(total=="")
        {
            sweetAlert("Oops...", "Tidak ada transaksi", "error");
        }
        else
        {
            $('#formqty').submit();
        }


    }


    else if (e.keyCode == 118) {

        var total =  $('#input').val();
        var norefff = $('#norefnya').val();

        if (total==0)
        {

            location.href="{{url('pos/tahan')}}";

        }
        else
        {

            swal({
                title: "Apa anda yakin ingin menahan transaksi ? ",
                text: "Transaksi akan ditahan bila di klik",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: '#3085d6',   cancelButtonColor: '#d33',
                confirmButtonText: "Yes",
                closeOnConfirm: true
            }).then(function() {
                swal("", "Transaksi berhasil ditahan", "success");
                location.href =  "{{ url('pos/penjual/hod') }}" + "/" + norefff;
            });


        }
    }

    else if (e.keyCode == 120) {

        var rolenya = $('#rolenya').val();

        if (rolenya==4)
        {
            $('#divvoid').load("{!! URL::to('/pos/supervisor/permission') !!}/");
        }
        else
        {

            $("#divvoid").hide();
            document.getElementById('fade4').style.display='none';

            swal({
                title: "Apa anda yakin ingin membatalkan transaksi ? ",
                text: "Transaksi akan dibatalkan bila di klik",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: '#3085d6',   cancelButtonColor: '#d33',
                confirmButtonText: "Yes",
                closeOnConfirm: false
            }).then(function() {
                swal("", "Transaksi berhasil dibatalkan", "success");
                location.href =  "{{ url('pos/void') }}";
            });

        }


    }



    else if (e.keyCode == 115) {

        var total = $('#input').val();

        if (total == 0) {
            sweetAlert("Oops...", "Tidak ada transaksi", "error");
            $("#divpayment").hide();
            document.getElementById('fade').style.display = 'none';
        }
        else {

                    // $("#divpayment").load("{!! URL::to('/pos/payment') !!}/"+$("#input").val());
                    $.ajax({
                        url: "{!! url('pos/getpayment') !!}/" + $('#norefnya').val(),
                        data: {},
                        dataType: "json",
                        type: "get",
                        success: function (data) {

                            $('#jenis1').val(data[0]["ck1"]);
                            $('#jenis2').val(data[0]["ck2"]);
//                $('#jenis3').val(data[0]["ck3"]);
$('#norefnyaaa').val(data[0]["norefnya"]);
$('#divpayment').load("{!! URL::to('/pos/payment') !!}/" + $('#input').val() + "/" + $('#jenis1').val() + "/" + $('#jenis2').val() + "/" + $('#norefnyaaa').val());
}
});
                }


            }

        });

function lightbox_open(){
    document.getElementById('light').style.display='block';
    document.getElementById('fade').style.display='block';
}
function lightbox_open1(){
    document.getElementById('light1').style.display='block';
    document.getElementById('fade1').style.display='block';
}
function lightbox_open2(){
    document.getElementById('light2').style.display='block';
    document.getElementById('fade2').style.display='block';
}
function lightbox_open3(){
    document.getElementById('light3').style.display='block';
    document.getElementById('fade3').style.display='block';
}
function lightbox_open4(){
    document.getElementById('light4').style.display='block';
    document.getElementById('fade4').style.display='block';
}
function lightbox_open5(){
    document.getElementById('light5').style.display='block';
    document.getElementById('fade5').style.display='block';
}
function lightbox_close(){
    document.getElementById('light').style.display='none';
    document.getElementById('fade').style.display='none';
}
function lightbox_close2(){
    document.getElementById('light2').style.display='none';
    document.getElementById('fade2').style.display='none';
}
function lightbox_close3(){
    document.getElementById('light3').style.display='none';
    document.getElementById('fade3').style.display='none';
}

$("#payment").click(function(){

    var total = $('#input').val();

    if(total == 0)
    {
        sweetAlert("Oops...", "Tidak ada transaksi", "error");
        document.getElementById('fade').style.display = 'none';
        $("#divpayment").hide();

    }
    else
    {

                // $("#divpayment").load("{!! URL::to('/pos/payment') !!}/"+$("#input").val());
                $.ajax({
                    url: "{!! url('pos/getpayment') !!}/" + $('#norefnya').val(),
                    data: {},
                    dataType: "json",
                    type: "get",
                    success:function(data)
                    {

                        $('#jenis1').val(data[0]["ck1"]);
                        $('#jenis2').val(data[0]["ck2"]);
//                $('#jenis3').val(data[0]["ck3"]);
$('#norefnyaaa').val(data[0]["norefnya"]);
$('#divpayment').load("{!! URL::to('/pos/payment') !!}/" + $('#input').val() + "/" + $('#jenis1').val() + "/" + $('#jenis2').val() + "/" + $('#norefnyaaa').val());
}
});
            }

        });

$("#ceksaldo").click(function(){


    $("#divceksaldo").load("{!! URL::to('/pos/ceksaldo') !!}/");


});

$("#btnretur").click(function(){

    var total = $('#input').val();

    if (total==0) {
        $("#divretur").load("{!! URL::to('/pos/cekretur') !!}/");
    }
    else
    {
        sweetAlert("Oops...", "Transaksi harus kosong", "error");
        $("#divretur").hide();
        document.getElementById('fade3').style.display='none';
        document.getElementById('light3').style.display='none';
    }


});





$("#btnesc").click(function(){
    var rolenya = $('#rolenya').val();

    if (rolenya==4) {


        location.href="{!! url('logout') !!}";
    }
    else
    {
        location.href="{!! url('pos/index') !!}";
    }

});
$("#buttonnya").click(function(){


    location.href="{!! url('pos/index') !!}";

});

$("#divesc").click(function(){

    var rolenya = $('#rolenya').val();

    if (rolenya==4) {


        location.href="{!! url('logout') !!}";
    }
    else
    {
        location.href="{!! url('pos/index') !!}";
    }

});


var i = 0;


function buttonClick(id) {

    $.ajax({
        url: "{!! url('pos/edit/qty/tambah') !!}/" + id,
        data: {},
        dataType: "json",
        type: "get",
        success:function(data)
        {
            location.reload();
        }

    });

}
function buttonClick2(id)
{
    if(document.getElementById('Eqty').value < 2)
    {

    }
    else
    {
        $.ajax({
            url: "{!! url('pos/edit/qty/kurang') !!}/" + id,
            data: {},
            dataType: "json",
            type: "get",
            success:function(data)
            {

                location.reload();
            }

        });
    }


}

$("#void").click(function(){

    var rolenya = $('#rolenya').val();

    if (rolenya==4)
    {
        $('#divvoid').load("{!! URL::to('/pos/supervisor/permission') !!}/");
    }
    else
    {
        var total = $('#input').val();

        if (total == 0) {
            sweetAlert("Oops...", "Tidak ada transaksi", "error");
            $("#divpayment").hide();
            document.getElementById('fade').style.display = 'none';
        }
        else{
            $("#divvoid").hide();
            document.getElementById('fade4').style.display='none';

            swal({
                title: "Apa anda yakin ingin membatalkan transaksi ? ",
                text: "Transaksi akan dibatalkan bila di klik",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: '#3085d6',   cancelButtonColor: '#d33',
                confirmButtonText: "Yes",
                closeOnConfirm: false
            }).then(function() {
                swal("", "Transaksi berhasil dibatalkan", "success");
                location.href =  "{{ url('pos/void') }}";
            });

        }

    }






});


$("#hold").click(function()
{

    var total = $('#input').val();
    var norefff = $('#norefnya').val();

    if (total==0)
    {

        location.href="{{url('pos/tahan')}}";

    }
    else
    {

        swal({
            title: "Apa anda yakin ingin menahan transaksi ? ",
            text: "Transaksi akan ditahan bila di klik",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: '#3085d6',   cancelButtonColor: '#d33',
            confirmButtonText: "Yes",
            closeOnConfirm: true
        }).then(function() {
            swal("", "Transaksi berhasil ditahan", "success");
            location.href =  "{{ url('pos/penjual/hod') }}" + "/" + norefff;
        });


    }

});

$("#carikode").click(function()

{

    var norefff = $('#barcode').val();

    if (norefff=="")
    {

        location.href=" {{ url('pos/penjual/dataproduk') }}";

    }
    else
    {
        location.href =  "{{ url('pos/penjualan') }}" + "/" + norefff;
    }

});
$(function(){
    $("#Eqtyvalue->id").keyup(function (e) {
        if (e.keyCode == 13) {
            location.href =  "{{ url('pos/penjualan') }}" + "/" + $('#barcode').val();
        }
        else if (e.keyCode == 27) {
            var rolenya = $('#rolenya').val();
            if (rolenya==4) {


                location.href="{!! url('logout') !!}";
            }
            else
            {
                location.href="{!! url('pos/index') !!}";
            }
        }
    });
});
</script>
@endsection