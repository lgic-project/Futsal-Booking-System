@extends('admin.template.create')

@push('styles')
@endpush

@section('form_content')
    <div class="form-group row">
        <div class="col-md-6">
            <label for="inputEmail4">Name <span class="text-danger">*</span></label>
            <input type="text" class="form-control" id="input1" placeholder="Name" required name="username">
        </div>

        <div class="col-md-6">
            <label for="inputEmail4">Email <span class="text-danger">*</span></label>
            <input type="email" class="form-control" id="input2" placeholder="Email" required name="email">
        </div>
        <div class="col-md-6 my-2">
            <label for="inputEmail4">Phone Number <span class="text-danger">*</span></label>
            <input type="big-number" class="form-control" id="input3" name="phone_number" required
                placeholder="Phone Number">
        </div>

        <div class="col-md-6 my-2">
            <label for="inputState">Type <span class="text-danger">*</span></label>
            <select id="inputState" class="form-control" required name="type">
                <option value="">Select Type</option>
                <option value="user">User</option>

            </select>
        </div>

        <div class="col-md-6 my-2">
            <label for="inputEmail4">Password <span class="text-danger">*</span></label>
            <input type="big-number" class="form-control" id="input4" placeholder="Password" name="password" required>
        </div>

    </div>
@endsection


@push('scripts')
@endpush
