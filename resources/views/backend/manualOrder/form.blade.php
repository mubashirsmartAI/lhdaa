@extends('layouts.vertical', ['demo' => 'creative', 'title' => __('Create Order')])

@section('css')
<link href="{{ asset('assets/libs/dropzone/dropzone.min.css') }}" rel="stylesheet" type="text/css" />
<link href="{{ asset('assets/libs/dropify/dropify.min.css') }}" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/css/intlTelInput.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/intlTelInput.min.js"></script>
<style>
    .iti {
        width: 100%;
    }

    .switch {
        position: relative;
        display: inline-block;
        width: 60px;
        height: 34px;
    }

    /* Hide default HTML checkbox */
    .switch input {
        opacity: 0;
        width: 0;
        height: 0;
    }

    .slider {
        position: absolute;
        cursor: pointer;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background-color: #ccc;
        -webkit-transition: .4s;
        transition: .4s;
    }

    .slider:before {
        position: absolute;
        content: "";
        height: 26px;
        width: 26px;
        left: 4px;
        bottom: 4px;
        background-color: white;
        -webkit-transition: .4s;
        transition: .4s;
    }

    input:checked+.slider {
        background-color: #1d4276;
    }

    input:focus+.slider {
        box-shadow: 0 0 1px #1d4276;
    }

    input:checked+.slider:before {
        -webkit-transform: translateX(26px);
        -ms-transform: translateX(26px);
        transform: translateX(26px);
    }

    /* Rounded sliders */
    .slider.round {
        border-radius: 34px;
    }

    .slider.round:before {
        border-radius: 50%;
    }
</style>
@endsection

@section('content')
@if (session('success'))
<div class="alert alert-success">
    <span>{!! session('success') !!}</span>
</div>
@endif
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">{{ __('Create Order') }}</h4>
                </div>
                <div class="card-body">
                    <form method="POST" action="{{ route('vendor.post.manual.order') }}">
                        @csrf

                        <!-- Customer Name -->
                        <div class="form-group">
                            <label for="customer_name">{{ __('Customer Name') }}</label>
                            <input type="text" name="customer_name" id="customer_name"
                                class="form-control @error('customer_name') is-invalid @enderror"
                                placeholder="{{ __('Enter Customer Name') }}" value="{{ old('customer_name') }}" required>
                            @error('customer_name')
                            <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        <!-- Customer Contact -->
                        <div class="form-group">
                            <label for="customer_contact">{{ __('Contact Information') }}</label>
                            <input type="text" name="customer_contact" id="customer_contact"
                                class="form-control @error('customer_contact') is-invalid @enderror"
                                placeholder="{{ __('Enter Contact Information') }}" value="{{ old('customer_contact') }}" required>
                            @error('customer_contact')
                            <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        <!-- Customer Email -->
                        <div class="form-group">
                            <label for="customer_email">{{ __('Email (Optional)') }}</label>
                            <input type="email" name="customer_email" id="customer_email"
                                class="form-control @error('customer_email') is-invalid @enderror"
                                placeholder="{{ __('Enter Email') }}" value="{{ old('customer_email') }}">
                            @error('customer_email')
                            <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        <!-- Products -->
                        <div class="form-group">
                            <label for="product_select">{{ __('Products') }}</label>
                            <div class="d-flex align-items-center mb-2">
                                <select id="product_select" class="form-control w-75">
                                    <option value="">{{ __('Select a Product') }}</option>
                                    @foreach ($products as $product)
                                    <option value="{{ $product->id }}" data-price="{{ $product->variant[0]->price }}">
                                        {{ $product->title }} - {{ $product->variant[0]->price ?? ''}}
                                    </option>
                                    @endforeach
                                </select>
                                <input type="number" id="product_quantity" class="form-control w-25 ml-2" min="1" placeholder="{{ __('Quantity') }}">
                                <button type="button" id="add_product" class="btn btn-primary ml-2">{{ __('Add') }}</button>
                            </div>
                        </div>

                        <!-- Selected Products List -->
                        <div id="product_list" class="mb-3"></div>

                        <!-- Total Amount -->
                        <div class="form-group">
                            <label for="total_amount">{{ __('Total Amount') }}</label>
                            <input type="text" name="total_amount" id="total_amount" class="form-control" value="0" readonly>
                        </div>

                        <!-- Classification -->
                        <div class="form-group">
                            <label for="classification">{{ __('Classification') }}</label>
                            <select name="classification" id="classification" class="form-control" onchange="handleClassificationChange(this.value)">
                                <option value="">{{ __('Select Classification') }}</option>
                                <option value="gift">{{ __('Gift') }}</option>
                                <option value="donation">{{ __('Donation') }}</option>
                            </select>
                        </div>


                        <!-- Phone Number -->
                        <div class="mb-3" id="gift-fields" style="display: none;">
                            <div class="row">
                                <div class="col-md-6">
                                    <label class="form-label">Receiver Name</label>
                                    <input type="text" class="form-control @error('receiver_name') is-invalid @enderror" name="receiver_name" id="receiver_name" placeholder="Receiver Name">
                                    @error('receiver_name')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                    @enderror
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Phone Number</label>
                                    <input type="tel" class="form-control @error('phone') is-invalid @enderror" id="phone" placeholder="Your phone number">

                                    <input type="hidden" name="receiver_dial_code" id="receiver_dial_code" value="{{ old('dial_code') }}">
                                    <input type="hidden" name="receiver_contact" id="receiver_contact" value="{{ old('phone_number') }}">
                                    @error('phone')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
                        </div>
                        <div id="randomOption" class="mb-3">
                            <div class="anonymous-wrapper">
                                <label for="randomCharity">Random</label>
                            </div>
                            <label class="switch">
                                <input type="checkbox" id="randomCharity">
                                <span class="slider round"></span>
                            </label>
                        </div>
                        <input type="hidden" name="is_random" id="is_random" value="0">
                        <!-- Donation Fields -->
                        <div class="form-group" id="donation-fields" style="display: none;">
                            <label for="donation-fields">{{ __('Charity') }}</label>
                            <select name="charity_id" class="form-control mt-2">
                                @foreach ($charities as $charity)
                                <option value="{{ $charity->id }}">{{ $charity->name }}</option>
                                @endforeach
                            </select>
                        </div>

                        <button type="submit" class="btn btn-info waves-effect waves-light">
                            {{ __('Create Order') }}
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@section('script')
<script>
    function handleClassificationChange(value) {
        const giftFields = document.getElementById('gift-fields');
        const donationFields = document.getElementById('donation-fields');
        const randomOption = document.getElementById('randomOption');
        const receiverName = document.getElementById("receiver_name");
        const phoneInput = document.getElementById("phone");

        if (value === 'gift') {
            giftFields.style.display = 'block';
            donationFields.style.display = 'none';
            randomOption.style.display = 'none';
            receiverName.required = true;
            phoneInput.required = true;
        } else if (value === 'donation') {
            giftFields.style.display = 'none';
            donationFields.style.display = 'block';
            randomOption.style.display = 'block';
            receiverName.required = false;
            phoneInput.required = false;
        } else {
            giftFields.style.display = 'none';
            donationFields.style.display = 'none';
            randomOption.style.display = 'none';
            receiverName.required = false;
            phoneInput.required = false;
        }
    }

    // Add event listener for random toggle
    document.addEventListener('DOMContentLoaded', function() {
        const randomCheckbox = document.getElementById('randomCharity');
        const donationFields = document.getElementById('donation-fields');
        const isRandomInput = document.getElementById('is_random');

        randomCheckbox.addEventListener('change', function() {
            if (this.checked) {
                donationFields.style.display = 'none';
                isRandomInput.value = '1';
            } else {
                donationFields.style.display = 'block';
                isRandomInput.value = '0';
            }
        });

        document.getElementById('randomOption').style.display = 'none';
    });

    document.getElementById('add_product').addEventListener('click', function() {
        const productSelect = document.getElementById('product_select');
        const quantityInput = document.getElementById('product_quantity');
        const productId = productSelect.value;
        const productName = productSelect.options[productSelect.selectedIndex].text;
        const productPrice = parseFloat(productSelect.options[productSelect.selectedIndex].getAttribute('data-price'));
        const quantity = parseInt(quantityInput.value);

        if (!productId || !quantity || quantity <= 0) {
            alert("{{ __('Please select a product and enter a valid quantity.') }}");
            return;
        }

        if (document.getElementById(`product_${productId}`)) {
            alert("{{ __('This product is already added.') }}");
            return;
        }

        const totalAmountField = document.getElementById('total_amount');
        let totalAmount = parseFloat(totalAmountField.value);

        // Calculate product total
        const productTotal = productPrice * quantity;
        totalAmount += productTotal;
        totalAmountField.value = totalAmount.toFixed(2);

        // Add product to list
        const productContainer = document.createElement('div');
        productContainer.id = `product_${productId}`;
        productContainer.classList.add('d-flex', 'align-items-center', 'mb-2');

        productContainer.innerHTML = `
            <span class="w-50">${productName}</span>
            <span class="w-25">${quantity} x ${productPrice.toFixed(2)}</span>
            <span class="w-25">${productTotal.toFixed(2)}</span>
            <button type="button" class="btn btn-danger btn-sm ml-3" onclick="removeProduct(${productId}, ${productTotal.toFixed(2)})">{{ __('Remove') }}</button>
            <input type="hidden" name="products[${productId}][quantity]" value="${quantity}">
        `;

        document.getElementById('product_list').appendChild(productContainer);

        // Reset inputs
        productSelect.value = '';
        quantityInput.value = '';
    });

    function removeProduct(productId, productTotal) {
        const productContainer = document.getElementById(`product_${productId}`);
        if (productContainer) {
            productContainer.remove();

            const totalAmountField = document.getElementById('total_amount');
            let totalAmount = parseFloat(totalAmountField.value);
            totalAmount -= productTotal;
            totalAmountField.value = totalAmount.toFixed(2);
        }
    }
</script>
<script>
    $(document).ready(function() {
        const input = document.querySelector("#phone");
        const dialCodeInput = document.querySelector("#receiver_dial_code");
        const phoneNumberInput = document.querySelector("#receiver_contact");

        const iti = window.intlTelInput(input, {
            initialCountry: "bh",
            separateDialCode: true,
            utilsScript: "https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/utils.js"
        });

        $("form").on("submit", function(event) {
            const dialCode = iti.getSelectedCountryData().dialCode;
            const phoneNumber = input.value.trim();

            dialCodeInput.value = `+${dialCode}`;
            phoneNumberInput.value = phoneNumber;
        });
    });

    $(document).ready(function () {
    $('form').on('submit', function (e) {
        const productList = $('#product_list');
        const addedProducts = productList.find('input[name^="products"]');

        const productId = $('#product_select').val();
        const quantity = $('#product_quantity').val();

        if ((productId && quantity) && addedProducts.length === 0) {
            e.preventDefault();
            Swal.fire({
                icon: 'warning',
                title: '{{ __("Add Product") }}',
                text: '{{ __("Please click the Add button to include the product.") }}',
            });
            return false;
        }

        if (addedProducts.length === 0) {
            e.preventDefault();
            Swal.fire({
                icon: 'warning',
                title: '{{ __("No Products Added") }}',
                text: '{{ __("Please add at least one product before submitting.") }}',
            });
            return false;
        }
    });
});
</script>
@endsection