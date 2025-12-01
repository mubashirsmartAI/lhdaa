@extends('layouts.vertical', ['demo' => 'creative', 'title' => getNomenclatureName('donations', true)])

@section('css')
    <link href="{{ asset('assets/libs/dropzone/dropzone.min.css') }}" rel="stylesheet" type="text/css" />
    <link href="{{ asset('assets/libs/dropify/dropify.min.css') }}" rel="stylesheet" type="text/css" />
    <link href="{{ asset('assets/libs/sweetalert2/sweetalert2.min.css') }}" rel="stylesheet" type="text/css" />
    <style type="text/css">

        .pac-container,
        .pac-container .pac-item {
            z-index: 99999 !important;
        }

        .fc-v-event {
            border-color: #43bee1;
            background-color: #43bee1;
        }
    </style>
@endsection

@section('content')
    <div class="container-fluid charity-page">
        <div class="row align-items-center">
            <div class="col-sm-6">
                <div class="page-title-box">
                    @php
                        $charities = getNomenclatureName('donations', true);
                        $newCharities = $charities === 'donations' ? __('donations') : $charities;
                    @endphp
                    <h4 class="page-title">{{ $newCharities }}</h4>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-12">
            <div class="table-responsive">
                <table class="table table-centered table-nowrap table-striped" width="100%">
                    <thead>
                        <tr>
                            <td class="text-center" style="width: 5%;">{{ __('ID') }}</td>
                            <th class="text-center">{{ __('User Name') }}</th>
                            <th class="text-center">{{ __('Date') }}</th>
                            <th class="text-center">{{ __('Amount') }}</th>
                            <th class="text-center">{{ __('Transaction ID') }}</th>
                            <th class="text-center">{{ __('Craeted At') }}</th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse ($payments as $key => $payment)
                            <tr>
                                <td class="text-center">{{ $key + 1 }}</td>
                                <td class="text-center">{{ $payment->user->name }}</td>
                                <td class="text-center">{{ date("d-m-Y", strtotime($payment->date)) }}</td>
                                <td class="text-center">{{ $payment->amount }}</td>
                                <td class="text-center">{{ $payment->transaction_id }}</td>
                                <td class="text-center">{{ date("d-m-Y H:i", strtotime($payment->created_at)) }}</td>
                            </tr>
                        @empty
                            <tr>
                                <td colspan="6" class="text-center">{{ __('No donations found') }}</td>
                            </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>
            {{ $payments->links() }}
        </div>
    </div>
@endsection
