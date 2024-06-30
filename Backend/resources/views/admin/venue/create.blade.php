@extends('admin.template.create')

@push('styles')
@endpush

@section('form_content')
    <div class="form-group column">
        <div class="col-md-6">
            <label for="inputEmail4">Name <span class="text-danger">*</span></label>
            <input type="text" class="form-control" id="input1" placeholder="Name" required name="name">
        </div>
        <div class="col-md-6 my-2">
            <label for="inputState"> Image<span class="text-danger">*</span></label>
            <input type="file" class="form-control" name="image" id="image" style="width:540px; height:45px;"
                required>

        </div>
        <div class="col-md-6">
            <label for="inputEmail4">Cost <span class="text-danger">*</span></label>
            <input type="text" class="form-control" id="input1" placeholder="Cost" required name="cost">
        </div>
        <div class="col-md-6 my-2">
            <label for="inputEmail4">Description<span class="text-danger">*</span></label>

            <textarea type="text" class="form-control" id="input1" placeholder="Description" required name="description"></textarea>
        </div>
        <div class="col-md-6 my-2">
            <label for="inputEmail4">Rules<span class="text-danger">*</span></label>

            <textarea type="text" class="form-control" id="input1" placeholder="Rules" required name="rules"></textarea>
        </div>
    </div @endsection @push('scripts') @endpush
