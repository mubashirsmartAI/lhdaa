@extends('layouts.store', ['title' => __('Beneficiary User')])

@section('css')
    <link href="{{ asset('assets/css/azul.css') }}" rel="stylesheet" type="text/css" />
@endsection

@section('content')
@php
    $timezone = Auth::user()->timezone;
@endphp

<section class="section-b-space order-page">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="text-sm-left" id="wallet_response">
                    @if (session('success'))
                        <div class="alert alert-success">
                            <span>{!! session('success') !!}</span>
                        </div>
                    @endif
                    @if (session('error'))
                        <div class="alert alert-danger">
                            <span>{!! session('error') !!}</span>
                        </div>
                    @endif
                    <div class="message d-none">
                        <div class="alert p-0"></div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row my-md-3">
            <div class="col-lg-3">
                <div class="account-sidebar"><a class="popup-btn">{{ __('Beneficiary User') }}</a></div>
                <div class="dashboard-left mb-3">
                    <div class="collection-mobile-back">
                        <span class="filter-back d-lg-none d-inline-block">
                            <i class="fa fa-angle-left" aria-hidden="true"></i>{{ __('Back') }}
                        </span>
                    </div>
                    @include('layouts.store/profile-sidebar')
                </div>
            </div>

            <div class="col-lg-9">
                <div class="dashboard-right">
                    <div class="dashboard">
                        <div class="page-title">
                            <h2>{{ __('Beneficiary User') }}</h2>
                        </div>

                        <div class="order_response mt-3 mb-3 d-none">
                            <div class="alert p-0" role="alert"></div>
                        </div>

                        <div class="col-md-12">
                            <div class="row" id="orders_wrapper">
                                <div class="col-sm-12 col-lg-12 tab-product al_custom_ordertabs mt-md-3 p-0">
                                    <div class="tab-content nav-material al" id="top-tabContent">
                                        <div class="tab-pane fade {{ Request::query('pageType') === null || Request::query('pageType') == 'all' ? 'active show' : '' }}"
                                            id="all-orders" role="tabpanel" aria-labelledby="all-orders-tab">
                                            <div class="table-responsive">
                                                <table class="table">
                                                    <thead>
                                                        <tr>
                                                            <th>{{ __('Image') }}</th>
                                                            <th>{{ __('Name') }}</th>
                                                            <th>{{ __('Email') }}</th>
                                                            <th>{{ __('Phone') }}</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        @forelse ($beneficiaries as $beneficiary)
                                                            <tr>
                                                                <td>
                                                                    @if($beneficiary->image)
                                                                        <img src="{{ $beneficiary->image }}" alt="Beneficiary Image" width="50" height="50">
                                                                    @else
                                                                        {{ __('No Image') }}
                                                                    @endif
                                                                </td>
                                                                <td>{{ $beneficiary->name }}</td>
                                                                <td>{{ $beneficiary->email }}</td>
                                                                <td>
                                                                    @if ($beneficiary->dial_code)
                                                                        +{{ $beneficiary->dial_code .' ' ?? '' }}
                                                                    @endif
                                                                    {{ $beneficiary->phone }}
                                                                </td>
                                                            </tr>
                                                        @empty
                                                            <tr>
                                                                <td colspan="3" class="text-center">{{ __('No Beneficiary Found') }}</td>
                                                            </tr>
                                                        @endforelse
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

        </div>
    </div>
</section>
@endsection
