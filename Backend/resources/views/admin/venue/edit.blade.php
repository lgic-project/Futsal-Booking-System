@extends('admin.template.edit')

@push('styles')
@endpush

@section('form_content')
    <div class="form-group row">
        <div class="col-md-6">
            <label for="inputEmail4">Name <span class="text-danger">*</span></label>
            <input type="text" class="form-control" id="input1" value="{{ $item->name }}" placeholder="Name" required
                name="name">
        </div>
        <div class="col-md-6">
            <label for="inputEmail4">Cost <span class="text-danger">*</span></label>
            <input type="text" class="form-control" id="input1" value="{{ $item->cost }}" placeholder="Name"
                required name="cost">
        </div>
        <div class="col-md-6">
            <label for="inputEmail4">Description <span class="text-danger">*</span></label>
            <input type="text" class="form-control" id="input1" value="{{ $item->description }}" placeholder="Name"
                required name="description">
        </div>
        <div class="col-md-6">
            <label for="inputEmail4">Rules <span class="text-danger">*</span></label>
            <input type="text" class="form-control" id="input1" value="{{ $item->rules }}" placeholder="Name"
                required name="rules">
        </div>
        {{-- <div class="col-md-6 mb-3">
            <label for="inputEmail4">Cost Per Hour</label>
            <input type="text" class="form-control" value={{ $item->cost }}>
        </div>
        <div class="col-md-6 mb-3">
            <label for="inputEmail4">Description</label>
            <input type="text" class="form-control" value={{ $item->description }}>
        </div>
        <div class="col-md-6 mb-3">
            <label for="inputEmail4">Rules</label>
            <input type="text" class="form-control" value={{ $item->rules }}>
        </div> --}}

        <div class="col-md-6">
            <label>Image</label>
            <input type="file" class="form-control" name="image" id="image">
            <div>
                <img style="width: 50px; height:40px" src="{{ asset($item->image) }}">
            </div>
        </div>

    </div>
@endsection


@push('scripts')
@endpush
