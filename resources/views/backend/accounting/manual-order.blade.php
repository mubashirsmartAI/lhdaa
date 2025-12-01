@extends('layouts.vertical', ['demo' => 'Orders', 'title' => 'Accounting - ManualOrders'])
@section('content')
<div class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="page-title-box">
                    <h4 class="page-title">{{ __('Manual Orders') }}</h4>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container-fluid">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body position-relative">
                    <div class="table-responsive">
                        <table class="table table-centered table-nowrap table-striped" id="manual_order_datatable" width="100%">
                            <thead>
                                <tr>
                                    <th>{{ __('Order Number') }}</th>
                                    <th>{{ __('Date & Time') }}</th>
                                    <th>{{ __('Customer Name') }}</th>
                                    <th>{{ __('Vendor') }}</th>
                                    <th>{{ __('Vendor Earning') }}</th>
                                    <th>{{ __('Subtotal Amount') }}</th>
                                    <th>{{ __('Final Amount') }}</th>
                                    <!-- <th>{{ __('Payment Method') }}</th> -->
                                    <th>{{ __('Order Status') }}</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($manualOrders as $order)
                                <tr>
                                    <td>#{{ $order->order_number }}</td>
                                    <td>{{ dateTimeInUserTimeZone($order->created_at, auth()->user()->timezone) }}</td>
                                    <td>{{ $order->user->name ?? 'N/A' }}</td>
                                    <td>{{ $order->vendors->first()->vendor->name ?? 'N/A' }}</td>
                                    <td>{{ decimal_format($order->vendors->first()->vendor_amount ?? 0) }}</td>
                                    <td>{{ decimal_format($order->ordervendor->subtotal_amount ?? 0) }}</td>
                                    <td>{{ decimal_format($order->ordervendor->payable_amount ?? 0) }}</td>
                                    <!-- <td>{{ $order->paymentOption->title ?? 'N/A' }}</td> -->
                                    <td>
                                        @php
                                            $status = $order->ordervendor->OrderStatusOption->title ?? 'N/A';
                                            $statusClass = '';
                                            switch($status) {
                                                case 'Placed': $statusClass = 'secondary'; break;
                                                case 'Accepted': $statusClass = 'warning'; break;
                                                case 'Processing': $statusClass = 'info'; break;
                                                case 'Rejected': $statusClass = 'danger'; break;
                                                case 'Delivered': $statusClass = 'success'; break;
                                                default: $statusClass = 'secondary';
                                            }
                                        @endphp
                                        <span class="badge badge-{{ $statusClass }}">{{ $status }}</span>
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

