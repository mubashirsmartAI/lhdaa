@extends('layouts.vertical', ['demo' => 'creative', 'title' => getNomenclatureName('beneficiary', true)])

@section('css')
    <link href="{{ asset('assets/libs/dropzone/dropzone.min.css') }}" rel="stylesheet" type="text/css" />
    <link href="{{ asset('assets/libs/dropify/dropify.min.css') }}" rel="stylesheet" type="text/css" />
    <link href="{{ asset('assets/libs/sweetalert2/sweetalert2.min.css') }}" rel="stylesheet" type="text/css" />
    <style type="text/css">
        @media(min-width: 1440px) {
            .content {
                min-height: calc(100vh - 100px);
            }
        }

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
                        $beneficiaries = getNomenclatureName('beneficiary', true);
                        $beneficiaries = $beneficiaries === 'beneficiary' ? __('beneficiary') : $beneficiaries;
                    @endphp
                    <h4 class="page-title">{{ $beneficiaries }}</h4>
                </div>
            </div>

                <div class="col-sm-6 text-sm-right">
                    <a href="{{ route('beneficiary.add', ['charity_id' => $charity->id]) }}" class="btn btn-primary">Add Beneficiary</a>
                </div>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-12">
            <div class="table-responsive">
                <table class="table table-centered table-nowrap table-striped" width="100%">
                    <thead>
                        <tr>
                            <th>{{ __('Name') }}</th>
                            <!-- <th>{{ __('Description') }}</th>
                            <th>{{ __('Address') }}</th> -->
                            <th>{{ __('Email') }}</th>
                            <!-- <th>{{ __('Website') }}</th> -->
                            <th>{{ __('Phone') }}</th>
                            <th>{{ __('Action') }}</th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse ($beneficiariesData as $beneficiary)
                            <tr>
                                <td>{{ $beneficiary->name }}</td>
                                <!-- <td>{{ $beneficiary->description }}</td>
                                <td>{{ $beneficiary->address }}</td> -->
                                <td>{{ $beneficiary->email }}</td>
                                <!-- <td>{{ $beneficiary->website }}</td> -->
                                <td>{{ $beneficiary->dial_code ? '+'.$beneficiary->dial_code : ''}}{{ $beneficiary->phone }}</td>
                                <td>
                                    <!-- Add action buttons as needed -->
                                    <a href="{{ route('beneficiary.edit', $beneficiary->id) }}"
                                        class="btn btn-sm btn-primary">{{ __('Edit') }}</a>
                                    <form action="{{ route('beneficiary.destroy', $beneficiary->id) }}" method="POST"
                                        style="display:inline;">
                                        @csrf
                                        @method('DELETE') <!-- This tells Laravel to treat this as a DELETE request -->
                                        <button type="submit" class="btn btn-sm btn-danger"
                                            onclick="confirmDelete(this)">{{ __('Delete') }}</button>
                                    </form>

                                </td>
                            </tr>
                        @empty
                            <tr>
                                <td colspan="9" class="text-center">{{ __('No beneficiary found') }}</td>
                            </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>
            {{ $beneficiariesData->links() }}
        </div>
    </div>
    @section('scripts')
        <script src="{{ asset('assets/libs/sweetalert2/sweetalert2.min.js') }}"></script>
        <script>
            function confirmDelete(button) {
                Swal.fire({
                    title: '{{ __('Are you sure?') }}',
                    text: '{{ __('This action cannot be undone.') }}',
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: '{{ __('Yes, delete it!') }}'
                }).then((result) => {
                    if (result.isConfirmed) {
                        // Find the closest form and submit it
                        button.closest('form').submit();
                    }
                });
            }
        </script>
    @endsection

@endsection
