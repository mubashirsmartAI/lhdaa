@extends('layouts.vertical', ['demo' => 'creative', 'title' => getNomenclatureName('charity donation', true)])

@section('css')
    <link href="{{ asset('assets/libs/dropzone/dropzone.min.css') }}" rel="stylesheet" type="text/css" />
    <link href="{{ asset('assets/libs/dropify/dropify.min.css') }}" rel="stylesheet" type="text/css" />
    <link href="{{ asset('assets/libs/sweetalert2/sweetalert2.min.css') }}" rel="stylesheet" type="text/css" />
    <style>
        @media(min-width: 1440px) {
            .content {
                min-height: calc(100vh - 100px);
            }
        }
        .switch {
            position: relative;
            display: inline-block;
            width: 60px;
            height: 34px;
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

        /* The slider */
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

        input:checked + .slider {
            background-color: #1d4276;
        }

        input:focus + .slider {
            box-shadow: 0 0 1px #1d4276;
        }

        input:checked + .slider:before {
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
        .col-sm-6.text-sm-left {
            margin-top: 20px;
            padding-left: 0px;
        }
    </style>
@endsection

@section('content')
    <div class="container-fluid charity-page">
        <div class="row align-items-center">
            <div class="col-sm-6">
                <div class="page-title-box">
                    @php
                        $charities = getNomenclatureName('charity-donation', true);
                        $newCharities = $charities === 'charity donation' ? __('charity donation') : $charities;
                    @endphp
                    <h4 class="page-title">{{ $newCharities }}</h4>
                </div>
            </div>
            <div class="row col-sm-12 d-flex flex-column">
                <label for="acceptDonationToggle" class="mb-2"><b>Accept Donations</b></label>
                <label class="switch">
                    <input type="checkbox" id="acceptDonationToggle" value="1" 
                        {{ $charity->accept_donations ? 'checked' : '' }}>
                    <span class="slider round"></span>
                </label>
            </div>
            <div class="col-sm-6 text-sm-left">
                <!-- Add Button (Only visible if Accept Donations is ON) -->
                <button class="btn btn-info waves-effect waves-light openAddModal" 
                        style="display: {{ $charity->accept_donations ? 'inline-block' : 'none' }};">
                    <i class="mdi mdi-plus-circle mr-1"></i> {{ __('Add') }}
                </button>
            </div>
        </div>
    </div>

    <!-- Modal for Adding Donation Amount -->
    <div class="modal fade" id="addDonationModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">{{ __('Add Donation Amount') }}</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="donationForm">
                        @csrf
                        <div class="form-group">
                            <label>{{ __('Amount') }}</label>
                            <input type="number" name="amount" class="form-control" required>
                        </div>
                        <button type="submit" class="btn btn-primary" style="margin-bottom: 20px;">{{ __('Save') }}</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Donation Amount Table -->
    <div class="row">
        <div class="col-sm-8">
            <div class="table-responsive mt-4">
                <table class="table table-centered table-nowrap table-striped" width="100%">
                    <thead>
                        <tr>
                            <th>{{ __('ID') }}</th>
                            <th>{{ __('Amount') }}</th>
                            <th>{{ __('Action') }}</th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse($charityDonations as $key => $donation)
                            <tr>
                                <td>{{ $key + 1 }}</td>
                                <td>{{@$clientCurrency->currency->symbol}}{{ number_format($donation->amount, 2) }}</td>
                                <td>
                                    <button class="btn btn-sm btn-danger delete-donation" 
                                            data-id="{{ $donation->id }}">{{ __('Delete') }}</button>
                                </td>
                            </tr>
                        @empty
                            <tr>
                                <td colspan="3" class="text-center">{{ __('No donation amount found') }}</td>
                            </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>
            {{ $charityDonations->links() }}
        </div>
    </div>
@endsection

@section('script')
<script>
    $(document).ready(function () {
        // Toggle Accept Donations
        $('#acceptDonationToggle').change(function () {
            let isChecked = $(this).prop('checked');
            $.ajax({
                url: "{{ route('charity-donation.toggle') }}",
                method: "POST",
                data: {
                    _token: "{{ csrf_token() }}",
                    accept_donations: isChecked ? 1 : 0
                },
                success: function (response) {
                    if (response.status === 'success') {
                        $('.openAddModal').toggle(isChecked);
                        Swal.fire('Updated!', response.message, 'success');
                    }
                }
            });
        });

        // Open Modal on Button Click
        $('.openAddModal').click(function () {
            $('#addDonationModal').modal('show');
        });

        // Handle Form Submission (Save Donation)
        $('#donationForm').submit(function (e) {
            e.preventDefault();
            let formData = $(this).serialize();
            $.post("{{ route('charity-donation.addDonation') }}", formData, function (response) {
                if (response.status === 'success') {
                    Swal.fire('Saved!', response.message, 'success').then(() => {
                        location.reload();
                    });
                }
            });
        });

        // Handle Delete Donation
        $('.delete-donation').click(function () {
            let donationId = $(this).data('id');
            Swal.fire({
                title: "Are you sure?",
                text: "This action cannot be undone!",
                icon: "warning",
                showCancelButton: true,
                confirmButtonText: "Yes, delete it!",
            }).then((result) => {
                if (result.value) {
                    $.post("{{ route('charity-donation.deleteDonation') }}", {
                        _token: "{{ csrf_token() }}",
                        id: donationId
                    }, function (response) {
                        if (response.status === 'success') {
                            Swal.fire('Deleted!', response.message, 'success').then(() => {
                                location.reload();
                            });
                        }
                    });
                }
            });
        });
    });
</script>
@endsection
