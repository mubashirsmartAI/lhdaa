@extends('layouts.vertical', ['demo' => 'creative', 'title' => getNomenclatureName('vendors', true)])
@section('css')
<link rel="stylesheet" href="{{asset('assets/css/intlTelInput.css')}}">
    <link href="{{ asset('assets/libs/fullcalendar-list/fullcalendar-list.min.css') }}" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .pac-container,
        .pac-container .pac-item {
            z-index: 99999 !important;
        }

        .fc-v-event {
            border-color: #43bee1;
            background-color: #43bee1;
        }

        .dd-list .dd3-content {
            position: relative;
        }

        span.inner-div {
            top: 50%;
            -webkit-transform: translateY(-50%);
            -moz-transform: translateY(-50%);
            transform: translateY(-50%);
        }

        .button {
            position: relative;
            padding: 8px 16px;
            background: #009579;
            border: none;
            outline: none;
            border-radius: 50px;
            cursor: pointer;
        }

        .button:active {
            background: #007a63;
        }

        .button__text {
            font: bold 20px "Quicksand", san-serif;
            color: #ffffff;
            transition: all 0.2s;
        }

        .button--loading .button__text {
            visibility: hidden;
            opacity: 0;
        }

        .button--loading::after {
            content: "";
            position: absolute;
            width: 16px;
            height: 16px;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            margin: auto;
            border: 4px solid transparent;
            border-top-color: #ffffff;
            border-radius: 50%;
            animation: button-loading-spinner 1s ease infinite;
        }
        .iti{
            width: 100%;
        }

        @keyframes button-loading-spinner {
            from {
                transform: rotate(0turn);
            }

            to {
                transform: rotate(1turn);
            }
        }
        /* NO BORDER SPINNER */


    </style>
@endsection

@section('content')
<div class="container-fluid">
    <div class="row">
        <div class="col-12 d-md-flex align-items-center justify-content-between">
            <h4 class="page-title">{{ ucfirst($charity->name) }} {{ __('Profile') }}</h4>
        </div>
    </div>

    <!-- Charity Profile Information -->
    <div class="row">
        <div class="col-md-4">
            <!-- Display Charity Logo -->
            <div class="card">
                <img src="{{ $charity->logo ?? asset('default-logo.jpg') }}" class="card-img-top" alt="Charity Logo" style="width: 80%; height: 300px; object-fit: cover; border-radius: 5px;">
            </div>
        </div>

        <div class="col-md-8">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">{{ $charity->name }}</h5>
                    <p><strong>{{ __('Phone') }}:</strong> {{ $charity->phone }}</p>
                    <p><strong>{{ __('Email') }}:</strong> <a href="mailto:{{ $charity->email }}">{{ $charity->email }}</a></p>

                    @if($charity->address)
                        <p><strong>{{ __('Address') }}:</strong> {{ $charity->address }}</p>
                    @endif

                    @if($charity->website)
                        <p><strong>{{ __('Website') }}:</strong> <a href="{{ $charity->website }}" target="_blank">{{ $charity->website }}</a></p>
                    @endif
                </div>
            </div>
        </div>
    </div>
<hr>
    <!-- Beneficiaries Section -->
    <div class="row mt-4">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <!-- Add Beneficiary Button -->
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h4>Beneficiaries List</h5>
                        <a href="{{ route('beneficiary.add', ['charity_id' => $charity->id]) }}" class="btn btn-primary">Add Beneficiary</a>
                    </div>
                    
                    <!-- Beneficiaries Table -->
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse($charity->beneficiaries as $beneficiary)
                                <tr>
                                    <td>{{ $beneficiary->name ?? 'N/A'}}</td>
                                    <td>{{ $beneficiary->email ?? 'N/A'}}</td>
                                    <td>{{ $beneficiary->dial_code ? '+'.$beneficiary->dial_code : ''}} {{ $beneficiary->phone ?? 'N/A'}}</td>
                                    <td>
                                        <a href="{{ route('beneficiary.edit', $beneficiary->id) }}" class="btn btn-sm btn-warning">Edit</a>
                                        <form action="{{ route('beneficiary.destroy', $beneficiary->id) }}" method="POST" style="display:inline-block;" onsubmit="return confirm('Are you sure you want to delete this beneficiary?')">
                                            @csrf
                                            @method('DELETE')
                                            <button type="submit" class="btn btn-sm btn-danger">Delete</button>
                                        </form>
                                    </td>
                                </tr>
                                @empty
                            <tr>
                                <td colspan="4" class="text-center">Data not found</td>
                            </tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection