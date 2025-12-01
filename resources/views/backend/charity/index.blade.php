@extends('layouts.vertical', ['demo' => 'creative', 'title' => getNomenclatureName('charity', true)])

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
                        $charities = getNomenclatureName('charity', true);
                        $newCharities = $charities === 'charity' ? __('charity') : $charities;
                    @endphp
                    <h4 class="page-title">{{ $newCharities }}</h4>
                </div>
            </div>

            @if (auth()->user()->can('charity-add') || auth()->user()->is_superadmin)
                <div class="col-sm-6 text-sm-right">
                    <button class="btn btn-info waves-effect waves-light openAddModal">
                        <i class="mdi mdi-plus-circle mr-1"></i> {{ __('Add') }}
                    </button>
                    <script>
                        document.querySelector('.openAddModal').addEventListener('click', function() {
                            window.location.href = '{{ route('charity.add') }}'; // Redirect to add charity page
                        });
                    </script>
                </div>
            @endif
        </div>
    </div>

    <div class="row">
        <div class="col-sm-12">
            <div class="table-responsive">
                <table class="table table-centered table-nowrap table-striped" width="100%">
                    <thead>
                        <tr>
                            <th>{{ __('Logo') }}</th>
                            <th>{{ __('Name') }}</th>
                            <th>{{ __('Description') }}</th>
                            <th>{{ __('Address') }}</th>
                            <th>{{ __('Email') }}</th>
                            <th>{{ __('Phone') }}</th>
                            <th>{{ __('Action') }}</th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse ($data as $charity)
                            <tr>
                                <td><img src="{{ $charity->logo }}" alt="Logo" width="80" height="70"></td>
                                <td>
                                    <a href="{{ route('charity.view', ['id' => $charity->id]) }}">
                                        {{ $charity->name }}
                                    </a>
                                </td>
                                <td>{{ $charity->desc }}</td>
                                <td>{{ $charity->address }}</td>
                                <td>{{ $charity->email }}</td>
                                <td>
                                    @if(!empty($charity->dial_code))
                                        {{ $charity->dial_code }}
                                    @endif
                                    {{ $charity->phone ?? '' }}
                                </td>
                                <td>
                                    <!-- Add action buttons as needed -->
                                    <a href="{{ route('charity.edit', $charity->id) }}"
                                        class="btn btn-sm btn-primary">{{ __('Edit') }}</a>
                                    <form action="{{ route('charity.destroy', $charity->id) }}" method="POST"
                                        style="display:inline;"
                                        onsubmit="return confirm('Are you sure want to delete this Charity?')">
                                        @csrf
                                        @method('DELETE') <!-- This tells Laravel to treat this as a DELETE request -->
                                        <button type="submit" class="btn btn-sm btn-danger"
                                            onclick="confirmDelete(this)">{{ __('Delete') }}</button>
                                    </form>

                                </td>
                            </tr>
                        @empty
                            <tr>
                                <td colspan="9" class="text-center">{{ __('No charities found') }}</td>
                            </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>
            {{ $data->links() }}
        </div>
    </div>
@endsection
