@extends('layouts.vertical', ['demo' => 'creative', 'title' => __('Add Beneficiary')])

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
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">{{ __('Add Beneficiary') }}</h4>
                    </div>
                    <div class="card-body">
                        <form method="POST" action="{{ route('beneficiary.store') }}" enctype="multipart/form-data">

                            @csrf
                            <input type="hidden" name="charity_id" value="{{ $charity->id }}">
                            <!-- Charity Name -->
                            <div class="form-group">
                                <label for="name">{{ __('Beneficiary Name') }}</label>
                                <input type="text" name="name" id="name" class="form-control @error('name') is-invalid @enderror"
                                    placeholder="{{ __('Enter Charity Name') }}" value="{{ old('name') }}">
                                @error('name')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>

                            <!-- Email -->
                            <div class="form-group">
                                <label for="email">{{ __('Email') }}</label>
                                <input type="email" name="email" id="email" class="form-control @error('email') is-invalid @enderror" 
                                    placeholder="{{ __('Enter Email') }}" value="{{ old('email') }}">
                                @error('email')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>

                            <!-- Phone Number -->
                            <div class="mb-3">
                                <label class="form-label">Phone Number</label>
                                <input type="tel" class="form-control @error('phone') is-invalid @enderror" id="phone" 
                                    placeholder="Your phone number" 
                                    value="{{ old('phone', $beneficiary->phone ?? '') }}">
                                
                                <input type="hidden" name="dial_code" id="dial_code" value="{{ old('dial_code') }}">
                                <input type="hidden" name="phone" id="phone_number" value="{{ old('phone_number') }}">

                                @error('phone')
                                    <div class="invalid-feedbackphone" style="color: red;">{{ $message }}</div>
                                @enderror
                            </div>

                            <!-- Description -->
                            <div class="form-group">
                                <label for="description">{{ __('Description') }}</label>
                                <textarea name="description" id="description" class="form-control @error('description') is-invalid @enderror" rows="4"
                                    placeholder="{{ __('Enter Description') }}">{{ old('description') }}</textarea>
                                @error('description')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>

                            <!-- Logo -->
                            <div class="col-md-3">
                                <label>{{ __('Upload Image') }} </label>
                                <input type="file" accept="image/*" data-plugins="dropify" name="image" class="dropify @error('image') is-invalid @enderror" data-default-file="" />
                                @error('image')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                                <label class="logo-size text-right w-100">{{ __('Image Size') }} 170x96</label>
                            </div>

                            <button type="submit" class="btn btn-info waves-effect waves-light">
                                {{ __('Save Beneficiary') }}
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
@endsection

@section('scripts')
    <script src="{{ asset('assets/libs/dropify/dropify.min.js') }}"></script>
    <script>
        $('.dropify').dropify();
    </script>
    
@endsection
