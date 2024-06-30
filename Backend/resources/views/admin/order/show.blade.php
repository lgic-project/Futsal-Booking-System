@extends('admin.template.show')

@push('styles')
@endpush

@section('form_content')
    <div class="form-group row">
        <div class="col-md-6 mb-3">
            <label>Order Id </label>
            <input type="text" class="form-control" id="input1" value="{{ $item->id }}" placeholder="Name" required
                name="name" disabled readonly>
        </div>

        <div class="col-md-6 mb-3">
            <label>Order By </label>
            <input type="text" class="form-control" id="input1" value="{{ $item->user ? $item->user->name : 'N/A' }}"
                placeholder="Name" required name="name" disabled readonly>
        </div>

        <div class="col-md-6 mb-3">
            <label>Start Time </label>
            <input type="text" class="form-control" id="input1" value="{{ $item->start_date }}" placeholder="Name"
                required name="name" disabled readonly>
        </div>
        <div class="col-md-6 mb-3">
            <label>End Time </label>
            <input type="text" class="form-control" id="input1" value="{{ $item->end_date }}" placeholder="Name"
                required name="name" disabled readonly>
        </div>
        <div class="col-md-6 mb-3">
            <label>Cost </label>
            <input type="text" class="form-control" id="input1" value="{{ $item->total }}" placeholder="Name"
                required name="name" disabled readonly>
        </div>
        <div class="col-md-6 mb-3">
            <label>Payment Type </label>
            <input type="text" class="form-control" id="input1" value="{{ $item->payment_method }}" placeholder="Name"
                required name="name" disabled readonly>
        </div>
    </div>
@endsection


@push('scripts')
@endpush
