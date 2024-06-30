@extends('admin.template.show')

@push('styles')
@endpush

@section('form_content')
    <div class="form-group row">
        <div class="col-md-6 mb-3">
            <label for="inputEmail4">Name </label>
            <input type="text" class="form-control" id="input1" value="{{ $item->name }}" placeholder="Name" required
                name="name" disabled readonly>
        </div>
        <div class="col-md-6 mb-3">
            <label for="inputEmail4">Email </label>
            <input type="text" class="form-control" id="input1" value="{{ $item->email }}" placeholder="Name"
                required name="name" disabled readonly>
        </div>
        <div class="col-md-6 mb-3">
            <label for="inputEmail4">Phone Number </label>
            <input type="text" class="form-control" id="input1" value="{{ $item->phone_number }}" placeholder="Name"
                required name="name" disabled readonly>
        </div>
        <div class="col-md-6 mb-3">
            <label for="inputEmail4">Type </label>
            <input type="text" class="form-control" id="input1" value="{{ $item->type }}" placeholder="Name"
                required name="name" disabled readonly>
        </div>

        <div class="col-md-6 mb-3">
            <div class="input-group input-group-alternative mb-3">
                <label for="inputEmail4">Image </label>
            </div>
            <div>
                <img src="{{ $item->profile_image ? asset($item->profile_image) : asset('profile_placeholder.png') }}"
                    alt="avatar" class="rounded-circle img-fluid" style="width: 150px;">
            </div>


        </div>

    </div>
@endsection


@push('scripts')
@endpush
