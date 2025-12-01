@extends('layouts.vertical', ['demo' => 'creative', 'title' => getNomenclatureName('Manual Orders', True)])
@section('css')
<link href="{{asset('assets/libs/dropzone/dropzone.min.css')}}" rel="stylesheet" type="text/css" />
<link href="{{asset('assets/libs/dropify/dropify.min.css')}}" rel="stylesheet" type="text/css" />
<link href="{{asset('assets/libs/mohithg-switchery/mohithg-switchery.min.css')}}" rel="stylesheet" type="text/css" />
<link href="{{asset('assets/libs/multiselect/multiselect.min.css')}}" rel="stylesheet" type="text/css" />
<link href="{{asset('assets/libs/select2/select2.min.css')}}" rel="stylesheet" type="text/css" />
<link href="{{asset('assets/libs/selectize/selectize.min.css')}}" rel="stylesheet" type="text/css" />
<link href="{{asset('assets/libs/bootstrap-selectroyoorders/bootstrap-select.min.css')}}" rel="stylesheet" type="text/css" />
<link href="{{asset('assets/libs/bootstrap-touchspin/bootstrap-touchspin.min.css')}}" rel="stylesheet" type="text/css" />
<link href="{{asset('assets/libs/nestable2/nestable2.min.css')}}" rel="stylesheet" type="text/css" />
<style>.error{color: red;}</style>
@endsection
@section('content')
<div class="container-fluid">
    <div class="row">
        <div class="col-12">
            <div class="page-title-box">
                <h4 class="page-title">{{getNomenclatureName( __('Manual Orders'), true)}}</h4>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 mb-3">
            <div class="card mb-0">
                <div class="card-body">
                    <div class="row mb-2">
                        <div class="col-sm-12 text-right">
                            <button class="btn btn-info waves-effect waves-light openAddModal">
                            <i class="mdi mdi-plus-circle mr-1"></i> {{ __('Add') }}
                        </button>
                        <script>
                            document.querySelector('.openAddModal').addEventListener('click', function() {
                                window.location.href = '{{ route('vendor.add.manual.order') }}'; // Redirect to add charity page
                            });
                        </script>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-centered table-nowrap table-striped" id="banner-datatable">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>{{ __('Name') }}</th>
                                    <th>{{ __('Description') }}</th>
                                    <th>{{ __('Minimum Points') }}</th>
                                    <th>{{ __('Earnings Per Order') }}</th>
                                    <th>{{ __('Status') }}</th>
                                    <th>{{ __('Action') }}</th>
                                </tr>
                            </thead>
                            <tbody id="post_list">
                                @foreach($manualOrders as $manualOrder)
                                <tr data-row-id="{{$manualOrder->id}}">
                                    <td class="draggableTd">
                                        <span class="dragula-handle"></span>
                                    </td>
                                    <td><a class="openEditModal" loyaltyID="{{$manualOrder->id}}" href="#"> {{ $manualOrder->name }} </a></td>
                                    <td> {{ Str::limit($manualOrder->description, 50, ' ...') }} </td>
                                    <td> {{ $manualOrder->minimum_points }} </td>
                                    <td> {{ $manualOrder->per_order_points }} </td>
                                    <td>
                                        <input type="checkbox" bid="{{$manualOrder->id}}" id="activeCheck" data-plugin="switchery" name="validity_index" class="chk_box" data-color="#43bee1" {{($manualOrder->status == '0') ? 'checked' : ''}} >
                                     </td>
                                    <td>
                                        <div class="form-ul" style="width: 60px;">
                                            <div class="inner-div" style="float: left;">
                                                <a class="action-icon openEditModal" loyaltyID="{{$manualOrder->id}}" href="#"><i class="mdi mdi-square-edit-outline"></i></a>
                                            </div>
                                            <div class="inner-div">
                                                <form method="POST" action="{{ route('loyalty.destroy', $manualOrder->id) }}" id="deleteLoyality{{$manualOrder->id}}">
                                                    @csrf
                                                    @method('DELETE')
                                                    <div class="form-group">
                                                       <button type="button" class="btn btn-primary-outline action-icon" id="deleteLoyalityButton" onclick="deleteloyality('{{$manualOrder->id}}')"><i class="mdi mdi-delete"></i></button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                               @endforeach
                            </tbody>
                        </table>
                    </div>
                    <div class="pagination pagination-rounded justify-content-end mb-0">
                        {{-- $manualOrders->links() --}}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@include('backend.loyality.modals')
@endsection
@section('script')
<script type="text/javascript">
    function deleteloyality(id)
    {
        Swal.fire({
            title: "{{__('Are you sure?')}}",
            text:"You want to delete the {{getNomenclatureName('Loyalty Cards', false)}}.",
                // icon: 'info',
            showCancelButton: true,
            confirmButtonText: 'Ok',
        }).then((result) => {
            if(result.value)
            {
                $("#deleteLoyality"+id).off("submit").submit();
            }else{
                return false;
            }
        });
    }
</script>
@include('backend.loyality.pagescript')
@endsection
