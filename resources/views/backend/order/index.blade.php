@extends('layouts.vertical', ['title' => 'Orders'])
@section('content')
@php

    $clientData = \App\Models\Client::select('socket_url')->first();

@endphp
<style type="text/css">
.ellipsis {white-space: nowrap;overflow: hidden;text-overflow: ellipsis;}body {font-size: 0.75rem;}.order_data>div,.order_head h4 {padding: 0 !important;
}.order-page .card-box {padding: 20px 20px 5px !important;}.progress-order {width: calc(100% + 48px);margin: -24px 0 20px;background: #00000012;
color: var(--theme-deafult);position: relative;left: -24px;font-weight: 600;border-top-left-radius: 15px;border-top-right-radius: 15px;padding: 5px 0;
}
.error-msg {
    font-size: 20px;
    position: absolute;
    width: 100%;
    top: 50%;
    -webkit-transform: translate(0px, -50%);
    transform: translate(0px, -50%);
}
.accounting_upload .btn.btn-info{
    border-radius : 10px!important;
}
.alBtnsOnOrders{position: absolute;left: 10px;padding: 0;
    bottom: 10px;
    margin: 0;}
.alBtnsOnOrders li{list-style: none;margin-right: 3px;}
.alBtnsOnOrders .start_chat {
    color: #43bee1;
    height: 30px;
    width: 30px;
    display: inline-block;
    min-width: auto;
    line-height: 26px;
    z-index: 999;
    background-color: transparent;
    border: 1px solid;
}


.rental_filter_tab {
    position: absolute;
    left: 0;
    width: 100%;
}
.rental_filter_tab li.nav-item {
    width: auto;
    display: inline-block;
}
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/css/intlTelInput.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/intlTelInput.min.js"></script>
    <style>
        .iti {
            width: 100%;
        }
    </style>

<div class="container-fluid order-page">
    <div class="row ">
        <div class="col-md-12">
            <div class="page-title-box dashboard_order_title mt-2 d-md-flex align-items-center justify-content-between">
                @php
                    $ordermenu = getNomenclatureName('Orders', true);
                    $ordermenulabel = ($ordermenu=="Orders")?__('Orders'):__($ordermenu);
                @endphp
                <h4 class="page-title">{{ __($ordermenulabel) }}</h4>
                <div class="float-right">
                    <div class="row d-flex justify-content-between">
                        <div class="col-sm-4 mb-1">
                            <input type="text" id="range-datepicker" class="form-control flatpickr-input" placeholder="2018-10-03 to 2018-10-10" readonly="readonly" value="{{$setWeekDate}}">
                        </div>
                        <div class="col-sm-4 mb-1">
                            <select class="form-control" id="vendor_select_box">
                                <option value="">{{ __('Select Vendor') }}</option>
                                @forelse($vendors as $vendor)
                                    <option value="{{$vendor->id}}">{{$vendor->name}}</option>
                                @empty
                                @endforelse
                            </select>
                        </div>

                        {{-- <div class="col">
                            <select class="form-control" id="sort_order">
                                <option value="">{{ __('Change Sort') }}</option>
                                <option value="distance">{{ __('Distance') }}</option>
                                <option value="newest_slot">{{ __('Latest Slot') }}</option>
                            </select>
                        </div> --}}
                        <div class="col-sm-4 mb-1">
                            <div class="d-flex justify-content-between">
                                <button type="button" class="btn btn-danger waves-effect waves-light mr-3" id="clear_filter_btn_icon">
                                    <i class="mdi mdi-close"></i>
                                </button>
                                <input type="search" class="form-control" placeholder="{{ __('Search') }}..." id="search_via_keyword">
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        @if($client_preference_detail->third_party_accounting)
        @foreach($accounting as $accounting)
        <div class="pull-right accounting_upload">
        @if($accounting->code == 'xero')
        <a class="btn btn-info" href="{{route('xero_auth')}}">{{ __("Upload to Xero") }} ({{$del_order_count}})</a>
        @endif
        </div>
        @endforeach
        @endif


        <div class="col-sm-12 mb-2">
            <div class="row align-items-center ">
                <div class="col">

                </div>

            </div>
        </div>
        <!-- <div class="col-md-3 col-lg-2 mb-3">
            <input type="search" class="form-control form-control-sm" placeholder="{{ __('Search') }}..." id="search_via_keyword">
        </div> -->
    </div>
</div>
@php
        $ordersNom = getNomenclatureName('Orders', true);
        $ordersNom = ($ordersNom=="Orders")?__('Orders'):__($ordersNom);
@endphp
<script type="text/template" id="no_order_template">
    <div class="error-msg mt-3">
        <img class="mb-2" src="{{asset('images/no-order.svg')}}">
        <p>{{ __("You don't have ".$ordersNom." right now.") }}</p>
    </div>
    </script>

<div class="col-12">
    <div class="row order-list-spinner">
        <div class="tab-product pl-2 pr-2 flex-grow-1">
            <div class="item">
            <ul class="nav nav-tabs nav-material" id="top-tab" role="tablist">
                <li class="nav-item">
                    @if ($user->role_id == 4)
                        <a class="nav-link active" id="pending_order-tab" data-toggle="tab" href="#pending_orders" role="tab" aria-selected="false" data-rel="pending_orders">
                            <i class="icofont icofont-man-in-glasses"></i>{{ __('Unassign '. $ordersNom) }} <sup class="total-items" id="pending-orders" data-count="{{$pending_order_count}}">({{$pending_order_count}})</sup>
                        </a>
                        <div class="material-border"></div> 
                    @else
                        <a class="nav-link active" id="pending_order-tab" data-toggle="tab" href="#pending_orders" role="tab" aria-selected="false" data-rel="pending_orders">
                            <i class="icofont icofont-man-in-glasses"></i>{{ __('Pending '. $ordersNom) }} <sup class="total-items" id="pending-orders" data-count="{{$pending_order_count}}">({{$pending_order_count}})</sup>
                        </a>
                        <div class="material-border"></div>
                    @endif
                </li>


                @if ($client_preferences->business_type == 'rental')
                    <li class="nav-item">
                        <a class="nav-link" id="rental_pending_delivery-tab" data-toggle="tab" href="#rental_pending_delivery" role="tab" aria-selected="true" data-rel="rental_pending_delivery">
                            <i class="icofont icofont-ui-home"></i>{{ __('Active '. $ordersNom) }} <sup class="total-items" id="active-orders" data-count="{{$active_order_count}}">({{$active_order_count}})</sup>
                        </a>
                        <div class="material-border"></div>
                        <ul class="nav nav-tabs nav-material rental_filter_tab" id="top-tab" role="tablist" style="display:none;">
                            <li class="nav-item">
                                <a class="nav-link active" id="rental_pending_delivery-tab" data-toggle="tab" href="#rental_pending_delivery" role="tab" aria-selected="false" data-rel="rental_pending_delivery">
                                    <i class="icofont icofont-man-in-glasses"></i>{{ __('Rental Pending Delivery') }} <sup class="total-items" id="rental-pending-delivery"></sup>
                                </a>
                                <div class="material-border"></div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="rental_running_product-tab" data-toggle="tab" href="#rental_running_product" role="tab" aria-selected="false" data-rel="rental_running_product">
                                    <i class="icofont icofont-man-in-glasses"></i>{{ __('Running Product') }} <sup class="total-items" id="rental-running-product"></sup>
                                </a>
                                <div class="material-border"></div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="rental_pending_return-tab" data-toggle="tab" href="#rental_pending_return" role="tab" aria-selected="true" data-rel="rental_pending_return">
                                    <i class="icofont icofont-ui-home"></i>{{ __('Rental Pending Returns') }} <sup class="total-items" id="rental-pending-return"></sup>
                                </a>
                                <div class="material-border"></div>
                            </li>
                        </ul>
                    </li>
                @else
                    @if ($user->role_id == 4)
                        <li class="nav-item">
                            <a class="nav-link" id="active_orders_tab" data-toggle="tab" href="#active_orders" role="tab" aria-selected="true" data-rel="active_orders">
                                <i class="icofont icofont-ui-home"></i>{{ __('Assign '. $ordersNom) }} <sup class="total-items" id="active-orders" data-count="{{$active_order_count}}">({{$active_order_count}})</sup>
                            </a>
                            <div class="material-border"></div>
                        </li>
                    @else
                        <li class="nav-item">
                            <a class="nav-link" id="active_orders_tab" data-toggle="tab" href="#active_orders" role="tab" aria-selected="true" data-rel="active_orders">
                                <i class="icofont icofont-ui-home"></i>{{ __('Active '. $ordersNom) }} <sup class="total-items" id="active-orders" data-count="{{$active_order_count}}">({{$active_order_count}})</sup>
                            </a>
                            <div class="material-border"></div>
                        </li>
                    @endif
                @endif
                @if ($user->role_id == 4)
                    <li class="nav-item">
                        <a class="nav-link" id="orders_history_tab" data-toggle="tab" href="#orders_history" role="tab" aria-selected="false" data-rel="orders_history">
                            <i class="icofont icofont-man-in-glasses"></i>{{ __($ordersNom.' Completed') }} <sup class="total-items" id="history-orders" data-count="{{$past_order_count}}">({{$past_order_count}})</sup>
                        </a>
                        <div class="material-border"></div>
                    </li>
                @else
                    <li class="nav-item">
                        <a class="nav-link" id="orders_history_tab" data-toggle="tab" href="#orders_history" role="tab" aria-selected="false" data-rel="orders_history">
                            <i class="icofont icofont-man-in-glasses"></i>{{ __($ordersNom.' History') }} <sup class="total-items" id="history-orders" data-count="{{$past_order_count}}">({{$past_order_count}})</sup>
                        </a>
                        <div class="material-border"></div>
                    </li>
                @endif
                @if ($user->role_id != 4)
                <li class="nav-item">
                    <a class="nav-link" id="cancel_order-tab" data-toggle="tab" href="#cancel_orders" role="tab" aria-selected="false" data-rel="cancel_orders">
                        <i class="icofont icofont-man-in-glasses"></i>{{ __('Cancel '. $ordersNom) }} <sup class="total-items" id="cancel-orders" data-count="{{$cancel_order_count}}">({{$cancel_order_count}})</sup>
                    </a>
                    <div class="material-border"></div>
                </li>
                @endif
                

            </ul>
            <div class="page-title-box page-title-box text-left ">
                <a class="return-btn mr-1" href="{{route('backend.order.returns',['Pending'])}}">
                    <b>{{ __("Return Request") }}
                        <span class="total-items">({{$return_requests}})</span>
                        {{-- <i class="fa fa-arrow-circle-right" aria-hidden="true"></i> --}}
                    </b>
                </a>
                <a class="mr-2" href="{{route('cancel-order.requests')}}">
                    <b>{{ __("Cancel ".$ordersNom." Request") }}
                        <span class="total-items">({{$cancel_order_requests}})</span>
                        {{-- <i class="fa fa-arrow-circle-right" aria-hidden="true"></i> --}}
                    </b>
                </a>
                @if ($client_preferences->business_type == 'laundry')
                <a class="return-btn" href="{{route('rescheduled.orders')}}">
                    <b>{{ __("Rescheduled Orders") }}
                        <span class="total-items">({{$rescheduleOrderCount}})</span>
                        {{-- <i class="fa fa-arrow-circle-right ml-1" aria-hidden="true"></i> --}}
                    </b>
                </a>
                @endif
                @if ($client_preferences->business_type == 'rental' || $client_preferences->business_type == 'super_app')
                <a class="return-btn" href="{{route('return.dispatcher.form')}}">
                    <b>{{ __("Rental Return Order Form") }}
                        <span class="total-items">({{$returnFormRequestCount}})</span>
                        {{-- <i class="fa fa-arrow-circle-right ml-1" aria-hidden="true"></i> --}}
                    </b>
                </a>
                @endif
            </div>
        </div>
        </div>

        <div class="col-12 pl-2 pr-2">
            <div class="tabs_radio_controls">
                @php
                    $index = 1;
                @endphp
                <input type="radio" class="tabs_radio" id="all_tab" name="select" value="" checked>
                <label class="tabs_label" for="all_tab">
                    <h5 class="m-0">{{ __('All') }}</h5>
                </label>
                @foreach(config('constants.VendorTypes') as $vendor_typ_key => $vendor_typ_value)
                    @php
                        $clientVendorTypes = $vendor_typ_key.'_check';
                        $VendorTypesName = $vendor_typ_key == "dinein" ? 'dine_in' : $vendor_typ_key ;
                        $NomenclatureName = getNomenclatureName($vendor_typ_value, true);
                        $vendorTypeOrders = $VendorTypesName.'_orders';
                    @endphp

                    @if($client_preference_detail->$clientVendorTypes == 1)
                        <input type="radio" class="tabs_radio" id="{{$VendorTypesName}}_tab" name="select" value="{{$VendorTypesName}}">
                        <label class="tabs_label" for="{{$VendorTypesName}}_tab">
                            <h5 class="m-0">{{$NomenclatureName}}</h5>
                            {{-- <p class="m-0">5%</p> --}}
                            <span class="ml-1" id="{{$VendorTypesName}}-orders">({{ $OrderFilterData[$vendorTypeOrders] ?? 0 }})</span>
                        </label>
                    @endif
                    @php
                        $index++;
                    @endphp
                @endforeach
            </div>
        </div>

    </div>
    <div class="tab-content nav-material  order_data_box scroll-style" id="top-tabContent">
          <div class="spinner-order-loader">
            <div class="nb-spinner-order"></div>
    </div>
        <div class="tab-pane fade past-order show active position-relative h-100" id="pending_orders" role="tabpanel" aria-labelledby="pending_order-tab">
            <div id="pending_orders_row" class="row">
                {!! $OrderFilterData['html'] !!}
            </div>
            <div class="row mt-4 mb-4" id="pending_orders_pagination">
                {!! $OrderFilterData['pagination'] !!}
            </div>
        </div>
        <div class="tab-pane fade position-relative h-100" id="active_orders" role="tabpanel" aria-labelledby="active_orders_tab">
            <div id="active_orders_row" class="row"></div>
            <div class="row mt-4 mb-4" id="active_orders_pagination"></div>
        </div>
        <div class="tab-pane fade past-order position-relative h-100" id="orders_history" role="tabpanel" aria-labelledby="orders_history_tab">
            <div id="orders_history_row" class="row"></div>
            <div class="row mt-4 mb-4" id="orders_history_pagination"></div>

        </div>
        <div class="tab-pane fade past-order position-relative h-100" id="cancel_orders" role="tabpanel" aria-labelledby="cancel_order-tab">
            <div id="cancel_orders_row" class="row"></div>
            <div class="row mt-4 mb-4" id="cancel_orders_pagination"></div>

        </div>
        @foreach(config('constants.VendorTypes') as $vendor_typ_key => $vendor_typ_value)
            @php
                $clientVendorTypes = $vendor_typ_key.'_check';
                $VendorTypesName = $vendor_typ_key == "dinein" ? 'dine_in' : $vendor_typ_key ;
                $NomenclatureName = getNomenclatureName($vendor_typ_value, true);
            @endphp

            @if($client_preference_detail->$clientVendorTypes == 1)
                <div class="tab-pane fade past-order position-relative h-100" id="{{$VendorTypesName}}_orders" role="tabpanel" aria-labelledby="{{$VendorTypesName}}_tab">
                    <div class="error-msg mt-3">
                        <img class="mb-2" src="{{asset('images/no-order.svg')}}">
                        <p>{{ __("You don't have ".$ordersNom." right now.") }}</p>
                    </div>
                </div>
            @endif
        @endforeach
    </div>
</div>


<div id="addRejectmodal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <div class="modal-header border-bottom">
                <h4 class="modal-title">{{ __("Reject Reason") }}</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <form id="addRejectForm" method="post" enctype="multipart/form-data">
                @csrf
                <div class="modal-body" id="AddRejectBox">
                    <p id="error-case" style="color:red;"></p>
                    <label style="font-size:medium;">{{ __("Enter reason for rejecting the order.") }}</label>
                    <textarea class="reject_reason w-100" data-name="reject_reason" name="reject_reason" id="" cols="107" rows="10"></textarea>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-info waves-effect waves-light addrejectSubmit">{{ __("Submit") }}</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Assign Beneficiaries Modal -->
<div class="modal fade" id="assignModal" tabindex="-1" aria-labelledby="assignModalLabel" aria-hidden="true" class="modal fade" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Select or Add Beneficiary</h5>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body">
                <input type="hidden" id="order_id">
                <input type="hidden" id="vendor_id">
                <input type="hidden" id="charity_id">
                
                <!-- Tabs for switching between select and add -->
                <ul class="nav nav-tabs mb-3" id="beneficiaryTabs" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" id="select-tab" data-toggle="tab" href="#selectBeneficiary" role="tab">Select Existing</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="add-tab" data-toggle="tab" href="#addBeneficiary" role="tab">Add New</a>
                    </li>
                </ul>

                <!-- Tab Content -->
                <div class="tab-content" id="beneficiaryTabContent">
                    <!-- Select Existing Beneficiary Tab -->
                    <div class="tab-pane fade show active" id="selectBeneficiary" role="tabpanel">
                        <div class="mb-3">
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="mdi mdi-magnify"></i></span>
                                </div>
                                <input type="text" class="form-control" id="searchBeneficiary" placeholder="Search beneficiaries by name, email or phone...">
                            </div>
                            <small class="form-text text-muted">Select any beneficiary to assign to this order.</small>
                        </div>
                        
                        <div class="beneficiary-list">
                            <div class="text-center py-3">
                                <div class="spinner-border text-primary" role="status">
                                    <span class="sr-only">Loading...</span>
                                </div>
                                <p class="mt-2">Loading beneficiaries...</p>
                            </div>
                        </div>
                    </div>

                    <!-- Add New Beneficiary Tab -->
                    <div class="tab-pane fade" id="addBeneficiary" role="tabpanel">
                        <form id="addBeneficiaryForm">
                            <div class="form-group">
                                <label>Name <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" name="name" required>
                            </div>
                            <div class="form-group">
                                <label>Email <span class="text-danger"></span></label>
                                <input type="email" class="form-control" name="email">
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Phone Number</label>
                                <input type="tel" class="form-control @error('phone') is-invalid @enderror" id="phone" 
                                    placeholder="Your phone number">
                                
                                <input type="hidden" name="dial_code" id="dial_code" value="{{ old('dial_code') }}">
                                <input type="hidden" name="phone" id="phone_number" value="{{ old('phone_number') }}">

                                @error('phone')
                                    <div class="invalid-feedbackphone" style="color: red;">{{ $message }}</div>
                                @enderror
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <textarea class="form-control" name="description" rows="3"></textarea>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="saveAndAssignBtn" style="display: none;">Save & Assign</button>
            </div>
        </div>
    </div>
</div>
<!-- <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script> -->

<!-- <script src="https://cdn.socket.io/4.1.2/socket.io.min.js" integrity="sha384-toS6mmwu70G0fw54EGlWWeA4z3dyJ+dlXBtSURSKN4vyRFOcxd3Bzjj/AoOwY+Rg" crossorigin="anonymous"></script> -->

@endsection

@section('script-bottom')
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="{{asset('assets/js/chat/vendor_chat.js')}}"></script>
@endsection
@section('script')
<script type="text/javascript">
    var ajaxCall = 'ToCancelPrevReq';
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('input[name="_token"]').val()
        }
    });
    $("#range-datepicker").flatpickr({
        mode: "range",
        dateFormat: "d M Y", //change format also

        onClose: function(selectedDates, dateStr, instance) {
            //initDataTable();
            var typ=  $("a.nav-link.active").data('rel');
            init(typ, "{{ route('orders.filter') }}", '', false);
        }
    });
    $("#vendor_select_box").change(function() {
      var typ=  $("a.nav-link.active").data('rel');
     //   alert(typ);

        init(typ, "{{ route('orders.filter') }}", '', false);
    });
    $("#sort_order, .tabs_radio").change(function() {
        var typ=  $("a.nav-link.active").data('rel');
        init(typ, "{{ route('orders.filter') }}", '', false);
    });
    $("#clear_filter_btn_icon").click(function() {
        $('#range-datepicker').val('');
        $('#vendor_select_box').val('');
        init("pending_orders", "{{ route('orders.filter') }}", '', false);
    });

    function autoloaddashboad(){
        //console.log('dasd');
        var type =  $("a.nav-link.active").data('rel');
        var search = $("#search_via_keyword").val();

        init(type, "{{ route('orders.filter') }}", search, false);
    }

    function init(filter_order_status, url, search_keyword = "", isOnload = false,type=0) {
    var date_filter = $('#range-datepicker').val();
    var vendor_id = $('#vendor_select_box option:selected').val();
    // var sort_order = $('#sort_order option:selected').val();
    var order_type = $('.tabs_radio:checked').val();

        ajaxCall = $.ajax({
            url: url,
            type: "POST",
            dataType: "JSON",
            // async: false,
            beforeSend: function(){
                spinnerJS.showSpinner();
                if(ajaxCall !=  'ToCancelPrevReq' && ajaxCall.readyState < 4){
                    ajaxCall.abort();
                    spinnerJS.hideSpinner();
                }
            },
            data: {
                filter_order_status: filter_order_status,
                search_keyword: search_keyword,
                order_type : order_type,
                vendor_id: vendor_id,
                date_filter: date_filter,
                // sort_order: sort_order
            },
            success: async function(response) {
                // reload after 10 sec
                 $('.order_data_box').removeClass('show-nb-spinner-main');
                //$('#order_list_order').hide();
                //$('.order_data').html(response);
               // console.log(filter_order_status);
               $("#active-orders").html("(" + response.data.active_orders + ")");
                    $("#pending-orders").html("(" + response.data.pending_orders + ")");
                    $("#history-orders").html("(" + response.data.orders_history + ")");
                    $("#cancel-orders").html("(" + response.data.cancel_orders + ")");
                    if(response.data.delivery_orders !== undefined){
                        $("#delivery-orders").html("(" + response.data.delivery_orders + ")");
                    }
                    if(response.data.dine_in_orders !== undefined){
                        $("#dine_in-orders").html("(" + response.data.dine_in_orders + ")");
                    }
                    if(response.data.takeaway_orders !== undefined){
                        $("#takeaway-orders").html("(" + response.data.takeaway_orders + ")");
                    }
                    if(response.data.rental_orders !== undefined){
                        $("#rental-orders").html("(" + response.data.rental_orders + ")");
                    }
                    if(response.data.pick_drop_orders !== undefined){
                        $("#pick_drop-orders").html("(" + response.data.pick_drop_orders + ")");
                    }
                    if(response.data.on_demand_orders !== undefined){
                        $("#on_demand-orders").html("(" + response.data.on_demand_orders + ")");
                    }
                    if(response.data.laundry_orders !== undefined){
                        $("#laundry-orders").html("(" + response.data.laundry_orders + ")");
                    }
                    if(response.data.appointment_orders !== undefined){
                        $("#appointment-orders").html("(" + response.data.appointment_orders + ")");
                    }
                    (response.data.p2p_orders != undefined) ? $("#p2p-orders").html("(" + response.data.p2p_orders + ")") : '';

                    if(response.data.count_resp == 0)
                    {
                        $(`#${filter_order_status}_row`).html('');
                        // $(`#${filter_order_status}_pagination`).html('');
                    }
                //await $(`#${filter_order_status}_row`).html('');
                await $(`#${filter_order_status}_pagination`).html('');
                if (response.status == 'Success') {
                    if(type==1){
                         await $(`#${filter_order_status}_row`).append(response.data.html);
                    }else{
                        await $(`#${filter_order_status}_row`).html(response.data.html);
                    }
                        if(response.data.pagination!=null && response.data.pagination != ''){
                            await $(`#${filter_order_status}_pagination`).html('');

                            await $(`#${filter_order_status}_pagination`).html(response.data.pagination);
                        } else{
                            await $(`#${filter_order_status}_pagination`).html('');
                        }



                }
                await spinnerJS.hideSpinner();

            },
            error: function(data) {
                console.log(data);
            },
        });
    }
    $(document).ready(function() {

        // setTimeout(function() {
        //     $("#pending_order-tab").trigger('click');
        // }, 1500);

        setInterval(function() {
            // autoloaddashboad();
        }, 17000);

        $(document).on("click", ".load-more-btn", function() {
            $('#order_list_order').show();
            var url = $(this).data('url');
            var rel = $(this).data('rel');
            $("#search_via_keyword").val("");
            init(rel, url, '', true,1);
            $(this).remove();
        });
        $(".nav-link").click(function() {
            $('#order_list_order').show();
            var rel = $(this).data('rel');
            var url = "{{ route('orders.filter') }}";
            $("#search_via_keyword").val("");
            // $(".tab-pane").html('');
            init(rel, url, '', false);

        });
        // $(function() {
        //     var url = window.location.href;
        //     var arr = url.split("/");
        //     var result = arr[2];
        //     let ip_address = result;
        //     let socket_port = "3100";
        //     let socket = io(ip_address + ':' + socket_port);
        //     socket.on('sendChatToClient', (message) => {
        //         $('#order_list_order').show();
        //         var rel = "pending_orders";
        //         var url = "{{ route('orders.filter') }}";
        //         // $(".tab-pane").html('');
        //         init(rel, url, '',false);
        //     });
        // });

        $(document).on("input", "#search_via_keyword", function(e) {
            $('#order_list_order').show();
            var rel = $("#top-tab li a.active").data('rel');
            var url = "{{ route('orders.filter') }}";
            var search_keyword = $(this).val();
            // $(".tab-pane").html('');
            init(rel, url, search_keyword, false);
        })


        function openRejectModal(order_id, vendor_id, status_option_id, order_vendor_id, order_luxury_option_id) {
            var cancelled_by = "{{Auth::user()->id}}";
            // var that = document.getElementById('reject');
            //     var count = that.data("count");
            //     var full_div = that.data("full_div");
            //     var single_div =that.data("single_div");
            //     var status_option_id = that.data("status_option_id");
            //     var status_option_id_next = status_option_id + 1;
            //     var order_vendor_id = that.data("order_vendor_id");
            //     var order_id = that.data("order_id");
            //     var vendor_id = that.data("vendor_id");

            //     var count = that.data("count");
            $('#addRejectmodal').modal({
                backdrop: 'static',
                keyboard: false,

            });
            $('.addrejectSubmit').on('click', function(e) {
                e.preventDefault();
                var reject_reason = $('#addRejectForm #AddRejectBox .reject_reason').val();

                // var that = document.getElementById('reject');
                var count = $("#reject").data("count");
                var full_div = $("#reject").data("full_div");
                var single_div =$("#reject").data("single_div");
                $.ajax({
                    url: "{{ route('order.changeStatus') }}",
                    type: "POST",
                    data: {
                        order_id: order_id,
                        vendor_id: vendor_id,
                        reject_reason: reject_reason,
                        "_token": "{{ csrf_token() }}",
                        status_option_id: status_option_id,
                        order_vendor_id: order_vendor_id,
                        cancelled_by: cancelled_by,
                        order_luxury_option_id: order_luxury_option_id,
                    },

                    success: function(response) {
                        if (response.status == 'success') {
                            $(".modal .close").click();
                            $.NotificationApp.send('{{__("Success")}}', response.message, "top-right", "#5ba035", "success");
                            //location.reload();
                        } else if (response.status == 'error') {
                            $('#error-case').empty();
                            $('#error-case').append(response.message);
                        }
                        if (count == 0) {
                            $(full_div).slideUp(1000, function() {
                                $(this).remove();
                            });
                            if (response.status == 'success') {
                                // $(".modal .close").click();
                                location.reload();
                            }
                        } else {
                            $(single_div).slideUp(1000, function() {
                                $(this).remove();
                            });
                            if (response.status == 'success') {
                                //   $(".modal .close").click();
                                location.reload();
                            }
                        }
                    },
                    error: function(response) {
                        if (response.status == 'error') {
                            $('#error-case').empty();
                            $('#error-case').append(response.message);
                        }
                    }

                });


            });


        }

        // update status
        $(document).on("click", ".update-status-ar", function() {

            let that = $(this);
            that.prop("disabled",true);
            var count = that.data("count");
            var full_div = that.data("full_div");
            var single_div = that.data("single_div");
            var status_option_id = that.data("status_option_id");
            var luxury_option = that.data("order_luxury_option");
            var status_option_id_next = status_option_id + 1;
            var order_vendor_id = that.data("order_vendor_id");
            var order_id = that.data("order_id");
            var vendor_id = that.data("vendor_id");
            var count = that.data("count");
            var order_luxury_option_id = that.data("order_luxury_option");
            var alertMessage = "";
            var productIds = [];
            var title = "";
            var totalCount = $(full_div + ' [data-count]').length;
            if(status_option_id == 2){
                 title = "{{__('Proceed with Accepting Order')}}";
            }else if(status_option_id == 4){
                 title = "{{__('Processing Order')}}";
            }else if(status_option_id == 5){
                 title = "{{__('Delivered')}}";
            }else{
                 title = "{{__('Complete the delivery?')}}";
            }

            $('.productIdsCheck_'+order_id+':checked').each(function(i){
                productIds[i] = $(this).val();
            });
            order_vendor_product_id = [];
            $('.productIdsCheck_'+order_id+':checked').each(function(i){
                order_vendor_product_id[i] = $(this).data('order_vendor_product_id');
            });
            if(status_option_id == 2 && that.data('is_alert'))
            {
                alertMessage = that.data('alert_message');
            }
            if (status_option_id == 3) {
                return openRejectModal(order_id, vendor_id, status_option_id, order_vendor_id, order_luxury_option_id);
            } else {
                if(productIds.length === 0 && order_luxury_option_id == 4 && status_option_id == 2){
                    Swal.fire({
                    title: "{{__('Error')}}",
                    icon: 'warning',
                    text: "Please select atleast one product",
                    showCancelButton: true,
                    confirmButtonText: 'Ok',
                    });
                    that.prop("disabled",false);
                }else{
                    Swal.fire({
                    title: title,
                    // icon: 'info',
                    text: alertMessage,
                    showCancelButton: true,
                    confirmButtonText: 'Yes',
                    }).then((result) => {
                        if (result.value) {
                            $.ajax({
                                url: "{{ route('order.changeStatus') }}",
                                type: "POST",
                                data: {
                                    order_id: order_id,
                                    vendor_id: vendor_id,
                                    "_token": "{{ csrf_token() }}",
                                    status_option_id: status_option_id,
                                    order_vendor_id: order_vendor_id,
                                    productIds: productIds,
                                    order_vendor_product_id: order_vendor_product_id,
                                    order_luxury_option_id: order_luxury_option_id
                                },
                                success: function(response) {
                                    if($('#received_new_orders').hasClass('show')){
                                        $("#received_new_orders").modal('hide');
                                    }
                                    if(response.status=='error'){
                                        if (count == 0) {
                                            $(full_div).slideUp(1000, function() {
                                                $(this).remove();
                                            });

                                        } else {
                                            $(single_div).slideUp(1000, function() {
                                                $(this).remove();
                                            });

                                        }
                                        that.prop("disabled",false);
                                        $.NotificationApp.send('{{__("Error")}}', response.message, "top-right", "#ff0808", "error");
                                        return 0;
                                    }

                                    if (status_option_id == 4 || status_option_id == 5) {
                                        if (status_option_id == 4){
                                            if((luxury_option == 2) || (luxury_option == 3)){
                                                var next_status = "{{ __('Order Prepared') }}";
                                            }else{
                                                var next_status = "{{ __('Delivered') }}";
                                                status_option_id_next = 6;
                                            }
                                        }else{
                                            var next_status = "{{ __('Delivered') }}";
                                        }
                                        that.prop("disabled",false);
                                        that.replaceWith("<button class='update-status-ar btn-warning' data-full_div='" + full_div + "' data-single_div='" + single_div + "'  data-count='" + count + "'  data-order_id='" + order_id + "'  data-vendor_id='" + vendor_id + "'  data-status_option_id='" + status_option_id_next + "' data-order_vendor_id=" + order_vendor_id + ">" + next_status + "</button>");
                                        return false;
                                    } else {

                                        if (count == 0) {
                                            if(totalCount>2){

                                                $(single_div).slideUp(1000, function() {
                                                $(this).remove();
                                            });
                                            }else{

                                            $(full_div).slideUp(1000, function() {
                                                $(this).remove();
                                            });
                                        }

                                        } else {
                                            if(totalCount>2){
                                                $(single_div).slideUp(1000, function() {
                                                $(this).remove();
                                            });
                                            }else{
                                            $(full_div).slideUp(1000, function() {
                                                $(this).remove();
                                            });
                                        }

                                        }
                                        that.prop("disabled",false);
                                    }
                                    if (status_option_id == 2){
                                        that.prop("disabled",false);
                                    	getOrderCount("pending-orders","active-orders");
                                        $.NotificationApp.send('{{__("Success")}}', response.message, "top-right", "#5ba035", "success");
                                    }
                                    if (status_option_id == 6){
                                        that.prop("disabled",false);
                                    	getOrderCount("active-orders","history-orders");
                                    	$.NotificationApp.send('{{__("Success")}}', response.message, "top-right", "#5ba035", "success");
                                        location.reload();
                                    }
                                },
                            });
                        }else{
                        	that.prop("disabled",false);
                        }
                    });
                }
            }
        });

		function getOrderCount(id_1,id_2){
			var pending_count = parseInt($("#"+id_1).attr("data-count"));
        	var active_count = parseInt($("#"+id_2).attr("data-count"));
        	pending_count = pending_count-1;
        	$("#"+id_1).attr("data-count",pending_count);
        	$("#"+id_1).html("("+pending_count+")");
        	active_count = active_count+1;
        	$("#"+id_2).attr("data-count",active_count)
        	$("#"+id_2).html("("+active_count+")");
		}

        // update vendor Product status
        $(document).on("click", ".updateVendorProdStatus", function(e) {
            e.preventDefault()
            let that = $(this);
            var count = that.data("count");
            var status_option_id = that.data("status_option_id");
            var luxury_option = that.data("order_luxury_option");
            var order_vendor_id = that.data("order_vendor_id");
            var order_id = that.data("order_id");
            var vendor_id = that.data("vendor_id");
            var count = that.data("count");
            var order_product_id = that.data("vendor_product_id");
            var order_vendor_product_id = that.data("order_vendor_product_id");
            var alertMessage = "";

            Swal.fire({
                title: "{{__('Proceed with Accepting Order')}}",
                // icon: 'info',
                text: alertMessage,
                showCancelButton: true,
                confirmButtonText: 'Yes',
            }).then((result) => {
                if (result.value) {
                    $.ajax({
                        url: "{{ route('order.changeVendorProductStatus') }}",
                        type: "POST",
                        data: {
                            order_id: order_id,
                            vendor_id: vendor_id,
                            vendor_id: vendor_id,
                            "_token": "{{ csrf_token() }}",
                            status_option_id: status_option_id,
                            order_vendor_id: order_vendor_id,
                            order_product_id: order_product_id,
                            order_vendor_product_id: order_vendor_product_id,
                        },
                        success: function(response) {
                            if(response.status=='error'){
                                Swal.fire({
                                    icon: 'warning',
                                    text: response.message,
                                    showCancelButton: false,
                                    confirmButtonText: 'Ok',
                                })
                            }else if(response.status=='success'){
                                Swal.fire({
                                    icon: 'success',
                                    text: response.message,
                                    showCancelButton: false,
                                    confirmButtonText: 'Ok',
                                })
                            }
                        },
                    });
                }
            });
        });
    });
    $(document).on('click', '.assign-btn', function () {
        let order_id = $(this).data('order_id');
        let vendor_id = $(this).data('vendor_id');
        let charity_id = $(this).data('charity_id');

        $('#order_id').val(order_id);
        $('#vendor_id').val(vendor_id);
        $('#charity_id').val(charity_id);

        // Load beneficiaries list
        loadBeneficiaries(charity_id);

        // Show the modal
        $('#assignModal').modal('show');
    });

    // Function to load beneficiaries
    function loadBeneficiaries(charity_id) {
        $.ajax({
            url: "/client/get-beneficiaries/" + charity_id,
            type: 'GET',
            success: function(data) {
                if (data.beneficiaries && data.beneficiaries.length > 0) {
                    let beneficiariesHtml = '<div class="list-group">';
                    
                    data.beneficiaries.forEach(function(beneficiary) {
                        beneficiariesHtml += `
                            <a href="javascript:void(0)" class="list-group-item list-group-item-action beneficiary-item" 
                               data-id="${beneficiary.id}" data-name="${beneficiary.name}" 
                               data-email="${beneficiary.email || ''}" data-phone="${beneficiary.phone || ''}">
                                <div class="d-flex w-100 justify-content-between">
                                    <h5 class="mb-1">${beneficiary.name}</h5>
                                </div>
                                <p class="mb-1">Email: ${beneficiary.email || 'N/A'}</p>
                                <p class="mb-1">Phone: ${beneficiary.phone || 'N/A'}</p>
                            </a>
                        `;
                    });
                    
                    beneficiariesHtml += '</div>';
                    $('.beneficiary-list').html(beneficiariesHtml);
                } else {
                    $('.beneficiary-list').html('<div class="alert alert-info">No beneficiaries found for this charity.</div>');
                }
            },
            error: function() {
                $('.beneficiary-list').html('<div class="alert alert-danger">Failed to load beneficiaries. Please try again.</div>');
            }
        });
    }

    // Filter beneficiaries based on search input
    $(document).on('input', '#searchBeneficiary', function() {
        let searchText = $(this).val().toLowerCase();
        
        if(searchText.trim() === '') {
            // If search is empty, show all items
            $('.beneficiary-item').show();
            return;
        }
        
        $('.beneficiary-item').each(function() {
            let name = $(this).data('name').toString().toLowerCase();
            let email = $(this).data('email').toString().toLowerCase();
            let phone = $(this).data('phone').toString().toLowerCase();
            
            if (name.includes(searchText) || 
                email.includes(searchText) || 
                phone.includes(searchText)) {
                $(this).show();
            } else {
                $(this).hide();
            }
        });
        
        // Show a message if no results are found
        if($('.beneficiary-item:visible').length === 0) {
            if($('.no-results-message').length === 0) {
                $('.beneficiary-list .list-group').append(
                    '<div class="no-results-message alert alert-info mt-2">No beneficiaries match your search.</div>'
                );
            }
        } else {
            $('.no-results-message').remove();
        }
    });

    // Handle beneficiary selection
    $(document).on('click', '.beneficiary-item', function() {
        let beneficiaryId = $(this).data('id');
        let orderId = $('#order_id').val();
        let vendorId = $('#vendor_id').val();
        let charityId = $('#charity_id').val();
        
        // Show confirmation
        Swal.fire({
            title: 'Confirm Assignment',
            text: 'Are you sure you want to assign this beneficiary to the order?',
            icon: 'question',
            showCancelButton: true,
            confirmButtonText: 'Yes, assign',
            cancelButtonText: 'No, cancel'
        }).then((result) => {
            if (result.value) {
                // Make AJAX call to assign beneficiary using existing route
                $.ajax({
                    url: "{{ route('assign.beneficiary.to.order') }}",
                    type: 'POST',
                    data: {
                        _token: $('meta[name="csrf-token"]').attr('content'),
                        order_id: orderId,
                        vendor_id: vendorId,
                        charity_id: charityId,
                        beneficiary_id: beneficiaryId
                    },
                    success: function(response) {
                        if (response.status === 'success') {
                            Swal.fire({
                                title: 'Success!',
                                text: response.message,
                                icon: 'success',
                                confirmButtonText: 'OK'
                            }).then(() => {
                                $('#assignModal').modal('hide');
                                location.reload();
                            });
                        } else {
                            Swal.fire({
                                title: 'Error!',
                                text: response.message,
                                icon: 'error',
                                confirmButtonText: 'OK'
                            });
                        }
                    },
                    error: function(xhr) {
                        Swal.fire({
                            title: 'Failed!',
                            text: xhr.responseJSON?.message || 'Something went wrong. Please try again.',
                            icon: 'error',
                            confirmButtonText: 'OK'
                        });
                    }
                });
            }
        });
    });

    $(document).on('click', '.complete-btn', function () {
        let orderId = $(this).data("order_id");
        let charityId = $(this).data("charity_id");
        let beneficiaryId = $(this).data("beneficiary_id");
        Swal.fire({
            title: "Are you sure?",
            text: "Do you want to mark this order as completed?",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#28a745",
            cancelButtonColor: "#d33",
            confirmButtonText: "Yes, Complete it!"
        }).then((result) => {
            if (result.value) {
                $.ajax({
                    url: "{{ route('order.markComplete') }}",
                    type: "POST",
                    data: {
                        _token: "{{ csrf_token() }}",
                        order_id: orderId,
                        charity_id: charityId,
                        beneficiary_id: beneficiaryId
                    },
                    success: function (response) {
                        if (response.success) {
                            Swal.fire({
                                title: "Completed!",
                                text: "The order has been marked as complete.",
                                icon: "success",
                                confirmButtonColor: "#28a745"
                            }).then(() => {
                                location.reload(); // Reload page to reflect changes
                            });
                        } else {
                            Swal.fire("Error!", response.message, "error");
                        }
                    },
                    error: function () {
                        Swal.fire("Error!", "Could not complete the request.", "error");
                    }
                });
            }
        });
    });

    $(document).ready(function() {
        // Handle tab switching
        $('#beneficiaryTabs a').on('click', function (e) {
            e.preventDefault();
            $(this).tab('show');
            if ($(this).attr('href') === '#addBeneficiary') {
                $('#saveAndAssignBtn').show();
            } else {
                $('#saveAndAssignBtn').hide();
            }
        });

        // Save and Assign New Beneficiary
        $('#saveAndAssignBtn').click(function() {
            // Update phone number and dial code before form submission
            const input = document.querySelector("#phone");
            const dialCodeInput = document.querySelector("#dial_code");
            const phoneNumberInput = document.querySelector("#phone_number");
            const iti = window.intlTelInput(input, {
                initialCountry: "bh",
                separateDialCode: true,
                utilsScript: "https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/utils.js"
            });

            // Get the phone number and dial code
            const dialCode = iti.getSelectedCountryData().dialCode;
            const phoneNumber = input.value.trim();
            
            // Update hidden inputs
            dialCodeInput.value = `+${dialCode}`;
            phoneNumberInput.value = phoneNumber;

            // Get form data
            var formData = $('#addBeneficiaryForm').serialize();
            var charityId = $('#charity_id').val();
            var orderId = $('#order_id').val();
            var vendorId = $('#vendor_id').val();

            $.ajax({
                url: "{{ route('beneficiary.store') }}",
                type: 'POST',
                data: formData + '&charity_id=' + charityId,
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                success: function(response) {
                    if(response.success) {
                        // Assign the newly created beneficiary using existing route
                        $.ajax({
                            url: "{{ route('assign.beneficiary.to.order') }}",
                            type: 'POST',
                            data: {
                                _token: $('meta[name="csrf-token"]').attr('content'),
                                order_id: orderId,
                                vendor_id: vendorId,
                                charity_id: charityId,
                                beneficiary_id: response.beneficiary.id
                            },
                            success: function(assignResponse) {
                                if(assignResponse.status === 'success') {
                                    Swal.fire({
                                        title: 'Success!',
                                        text: assignResponse.message,
                                        icon: 'success',
                                        confirmButtonText: 'OK'
                                    }).then(() => {
                                        $('#assignModal').modal('hide');
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire({
                                        title: 'Error!',
                                        text: assignResponse.message,
                                        icon: 'error',
                                        confirmButtonText: 'OK'
                                    });
                                }
                            },
                            error: function(xhr) {
                                Swal.fire({
                                    title: 'Failed!',
                                    text: xhr.responseJSON?.message || 'Something went wrong. Please try again.',
                                    icon: 'error',
                                    confirmButtonText: 'OK'
                                });
                            }
                        });
                    } else {
                        Swal.fire({
                            title: 'Error!',
                            text: response.message || 'Error adding beneficiary',
                            icon: 'error',
                            confirmButtonText: 'OK'
                        });
                    }
                },
                error: function(xhr) {
                    Swal.fire({
                        title: 'Failed!',
                        text: xhr.responseJSON?.message || 'Something went wrong. Please try again.',
                        icon: 'error',
                        confirmButtonText: 'OK'
                    });
                }
            });
        });

        // Initialize phone input when modal is shown
        $('#assignModal').on('shown.bs.modal', function () {
            const input = document.querySelector("#phone");
            if (input) {
                const iti = window.intlTelInput(input, {
                    initialCountry: "bh",
                    separateDialCode: true,
                    utilsScript: "https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/utils.js"
                });
            }
        });
    });
    $(document).ready(function () {
        const input = document.querySelector("#phone");
        const dialCodeInput = document.querySelector("#dial_code");
        const phoneNumberInput = document.querySelector("#phone_number");
        const iti = window.intlTelInput(input, {
            initialCountry: "bh",
            separateDialCode: true,
            utilsScript: "https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/utils.js"
        });
        $("form").on("submit", function (event) {
            const dialCode = iti.getSelectedCountryData().dialCode;
            const phoneNumber = input.value.trim();
            dialCodeInput.value = `+${dialCode}`;
            phoneNumberInput.value = phoneNumber;
        });
    });
</script>

<style>
.beneficiary-item {
    cursor: pointer;
    transition: background-color 0.2s;
}

.beneficiary-item:hover {
    background-color: #f8f9fa;
}

.beneficiary-item.selected {
    background-color: #e9ecef;
    border-left: 4px solid #007bff;
}

.nav-tabs .nav-link {
    color: #495057;
}

.nav-tabs .nav-link.active {
    color: #007bff;
    font-weight: 500;
}
</style>

@endsection
