@extends('layouts.vertical', ['demo' => 'creative', 'title' => __('Add Charity')])

@section('css')
<style>
    input[type="number"]::-webkit-inner-spin-button,
    input[type="number"]::-webkit-outer-spin-button {
        -webkit-appearance: none;
        margin: 0;
    }

    /* Hide the arrows in Firefox */
    input[type="number"] {
        -moz-appearance: textfield;
    }
</style>
    <!-- Include necessary styles for form elements -->
    <link href="{{ asset('assets/libs/dropzone/dropzone.min.css') }}" rel="stylesheet" type="text/css" />
    <link href="{{ asset('assets/libs/dropify/dropify.min.css') }}" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/css/intlTelInput.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/intlTelInput.min.js"></script>
    <style>
        .iti {
            width: 100%;
        }
    </style>
@endsection

@section('content')
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-8">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">{{ __('Add Charity') }}</h4>
                    </div>
                    <div class="card-body">
                        @if ($errors->any())
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                <strong>{{ __('Error!') }}</strong>
                                <ul class="mb-0">
                                    @foreach ($errors->all() as $error)
                                        <li>{{ $error }}</li>
                                    @endforeach
                                </ul>
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                        @endif

                        @if (session('error'))
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                {{ session('error') }}
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                        @endif

                        @if (session('success'))
                            <div class="alert alert-success alert-dismissible fade show" role="alert">
                                {{ session('success') }}
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                        @endif

                        <form method="POST" action="{{ route('charity.store') }}" enctype="multipart/form-data">

                            @csrf

                            <!-- Charity Name -->
                            <div class="form-group">
                                <label for="name">{{ __('Charity Name') }}</label>
                                <input type="text" name="name" id="name"
                                    class="form-control @error('name') is-invalid @enderror"
                                    placeholder="{{ __('Enter Charity Name') }}" value="{{ old('name') }}">
                                @error('name')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>

                            <!-- Description -->
                            <div class="form-group">
                                <label for="desc">{{ __('Description') }}</label>
                                <textarea name="desc" id="desc" class="form-control @error('desc') is-invalid @enderror" rows="4"
                                    placeholder="{{ __('Enter Description') }}">{{ old('desc') }}</textarea>
                                @error('desc')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>

                            <!-- Logo -->
                            <div class="col-md-3">
                                <label>{{ __('Upload Logo') }} </label>
                                <input type="file" accept="image/*" data-plugins="dropify" name="logo"
                                    class="dropify @error('logo') is-invalid @enderror" data-default-file="" />
                                @error('logo')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                                <label class="logo-size text-right w-100">{{ __('Logo Size') }} 170x96</label>
                            </div>

                            <!-- Address -->
                            <div class="form-group">
                                <label for="address">{{ __('Address') }}</label>
                                <input type="text" name="address" id="address"
                                    class="form-control @error('address') is-invalid @enderror"
                                    placeholder="{{ __('Enter Address') }}" value="{{ old('address') }}">
                                @error('address')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>

                            <!-- Email -->
                            <div class="form-group">
                                <label for="email">{{ __('Email') }}</label>
                                <input type="email" name="email" id="email"
                                    class="form-control @error('email') is-invalid @enderror"
                                    placeholder="{{ __('Enter Email') }}" value="{{ old('email') }}">
                                @error('email')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>

                            <!-- Website -->
                            <div class="form-group">
                                <label for="website">{{ __('Website') }}</label>
                                <input type="url" name="website" id="website"
                                    class="form-control @error('website') is-invalid @enderror"
                                    placeholder="{{ __('Enter Website URL') }}" value="{{ old('website') }}">
                                @error('website')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>

                            <!-- Phone Number -->
                            <div class="mb-3">
                                <label class="form-label">Phone Number</label>
                                <input type="tel" class="form-control @error('phone') is-invalid @enderror" id="phone" 
                                    placeholder="Your phone number" 
                                    value="{{ old('phone', isset($charity) ? $charity->phone : '') }}">
                                
                                <input type="hidden" name="dial_code" id="dial_code" value="{{ old('dial_code') }}">
                                <input type="hidden" name="phone" id="phone_hidden" value="{{ old('phone') }}">

                                @error('phone')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>

                            <!-- Latitude -->
                            <div class="form-group">
                                <label for="lat">{{ __('Latitude') }}</label>
                                <input type="text" name="lat" id="lat"
                                    class="form-control @error('lat') is-invalid @enderror"
                                    placeholder="{{ __('Enter Latitude') }}" value="{{ old('lat') }}">
                                @error('lat')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>

                            <!-- Longitude -->
                            <div class="form-group">
                                <label for="long">{{ __('Longitude') }}</label>
                                <input type="text" name="long" id="long"
                                    class="form-control @error('long') is-invalid @enderror"
                                    placeholder="{{ __('Enter Longitude') }}" value="{{ old('long') }}">
                                @error('long')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>

                            <div class="form-group">
                                <label for="password">{{ __('Password') }}</label>
                                <input type="password" name="password" id="password"
                                    class="form-control @error('password') is-invalid @enderror"
                                    placeholder="{{ __('Enter Password') }}" value="{{ old('password') }}">
                                @error('password')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>

                            <div class="form-group">
                                <label for="password_confirmation">{{ __('Confirm Password') }}</label>
                                <input type="password" name="password_confirmation" id="password_confirmation"
                                    class="form-control @error('password_confirmation') is-invalid @enderror"
                                    placeholder="{{ __('Enter Confirmed Password') }}"
                                    value="{{ old('password_confirmation') }}">
                                @error('password_confirmation')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>

                            <button type="submit" class="btn btn-info waves-effect waves-light">
                                {{ __('Save Charity') }}
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function () {
            const input = document.querySelector("#phone");
            const dialCodeInput = document.querySelector("#dial_code");
            const phoneHiddenInput = document.querySelector("#phone_hidden");

            const iti = window.intlTelInput(input, {
                initialCountry: "bh",
                separateDialCode: true,
                utilsScript: "https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/utils.js"
            });

            $("form").on("submit", function (event) {
                // Validate phone number
                if (!iti.isValidNumber()) {
                    event.preventDefault();
                    alert('Please enter a valid phone number.');
                    return false;
                }

                // Get dial code and phone number
                const dialCode = iti.getSelectedCountryData().dialCode;
                // Get the national number (digits only, without country code)
                const fullNumber = iti.getNumber();
                const phoneNumber = fullNumber.replace('+' + dialCode, '').replace(/\D/g, '');
                
                // Set hidden fields
                dialCodeInput.value = `+${dialCode}`;
                phoneHiddenInput.value = phoneNumber;
            });
        });
    </script>
@endsection

@section('scripts')
    <script src="{{ asset('assets/libs/dropify/dropify.min.js') }}"></script>
    <script>
        $('.dropify').dropify();
    </script>
@endsection
