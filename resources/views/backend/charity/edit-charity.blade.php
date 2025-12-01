@extends('layouts.vertical', ['demo' => 'creative', 'title' => __('Edit Charity')])
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
                        <h4 class="card-title">{{ __('Edit Charity') }}</h4>
                    </div>
                    <div class="card-body">
                        <form method="POST" action="{{ route('charity.update', $charity->id) }}"
                            enctype="multipart/form-data">
                            @csrf
                            {{-- @method('PUT') <!-- Specify PUT method for updating --> --}}

                            <!-- Charity Name -->
                            <div class="form-group">
                                <label for="name">{{ __('Charity Name') }}</label>
                                <input type="text" name="name" id="name"
                                    class="form-control @error('name') is-invalid @enderror"
                                    value="{{ old('name', $charity->name) }}">
                                @error('name')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>

                            <!-- Description -->
                            <div class="form-group">
                                <label for="desc">{{ __('Description') }}</label>
                                <textarea name="desc" id="desc" class="form-control @error('desc') is-invalid @enderror" rows="4">{{ old('desc', $charity->desc) }}</textarea>
                                @error('desc')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>

                            <!-- Logo -->
                            <div class="col-md-3">
                                <label>{{ __('Upload Logo') }}</label>
                                <input type="file" accept="image/*" data-plugins="dropify" name="logo"
                                    class="dropify @error('logo') is-invalid @enderror"
                                    data-default-file="{{ $charity->logo }}" />
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
                                    value="{{ old('address', $charity->address) }}">
                                @error('address')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>

                            <!-- Email -->
                            <div class="form-group">
                                <label for="email">{{ __('Email') }}</label>
                                <input type="email" name="email" id="email"
                                    class="form-control @error('email') is-invalid @enderror"
                                    value="{{ old('email', $charity->email) }}">
                                @error('email')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>

                            <!-- Website -->
                            <div class="form-group">
                                <label for="website">{{ __('Website') }}</label>
                                <input type="url" name="website" id="website"
                                    class="form-control @error('website') is-invalid @enderror"
                                    value="{{ old('website', $charity->website) }}">
                                @error('website')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>

                            <!-- Phone Number -->
                            <div class="mb-3">
                                <label class="form-label">Phone Number</label>
                                <input type="tel" class="form-control @error('phone') is-invalid @enderror" id="phone"
                                    placeholder="Your phone number" value="{{ old('phone', $charity->phone ?? '') }}">

                                <input type="hidden" name="dial_code" id="dial_code" value="{{ old('dial_code', $charity->dial_code ?? '') }}">
                                <input type="hidden" name="phone" id="phone_number" value="{{ old('phone', $charity->phone ?? '') }}">

                                @error('phone')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>

                            <!-- Latitude -->
                            <div class="form-group">
                                <label for="lat">{{ __('Latitude') }}</label>
                                <input type="text" name="lat" id="lat"
                                    class="form-control @error('lat') is-invalid @enderror"
                                    value="{{ old('lat', $charity->latitude) }}">
                                @error('lat')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>

                            <!-- Longitude -->
                            <div class="form-group">
                                <label for="long">{{ __('Longitude') }}</label>
                                <input type="text" name="long" id="long"
                                    class="form-control @error('long') is-invalid @enderror"
                                    value="{{ old('long', $charity->longitude) }}">
                                @error('long')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>

                            <button type="submit" class="btn btn-info waves-effect waves-light">
                                {{ __('Save Changes') }}
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

        // Get saved values from Laravel
        let savedDialCode = "{{ old('dial_code', $charity->dial_code ?? '') }}".replace('+', '');
        let savedPhone = "{{ old('phone', $charity->phone ?? '') }}";

        // Function to get country ISO2 code from dial code
        function getCountryIso2(dialCode) {
            const countryData = window.intlTelInputGlobals.getCountryData();
            const country = countryData.find(c => c.dialCode == dialCode);
            return country ? country.iso2 : "in"; // Default to India if not found
        }

        // Initialize intlTelInput with correct initial country
        const iti = window.intlTelInput(input, {
            separateDialCode: true,
            preferredCountries: ["us", "gb", "in", "ae"],
            initialCountry: savedDialCode ? getCountryIso2(savedDialCode) : "bh",
            utilsScript: "https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/utils.js"
        });

        // Pre-fill phone number on edit
        if (savedPhone) {
            iti.setNumber(`+${savedDialCode} ${savedPhone}`);
        }

        // Update values on form submission
        $("form").on("submit", function () {
            const countryData = iti.getSelectedCountryData();
            dialCodeInput.value = `+${countryData.dialCode}`;
            phoneNumberInput.value = input.value.replace(/^(\+\d+\s*)/, ''); // Remove dial code from input field
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
