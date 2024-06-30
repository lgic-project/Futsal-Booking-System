@extends('admin.template.index')

@push('styles')
    <style>
        /* Additional inline styles can be added here */
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
            color: #333;
        }

        .avatar {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            border: 5px solid #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            background-color: #fff;
        }

        .card-body {
            padding: 20px;
        }

        .card-title {
            font-size: 1.5rem;
            margin-bottom: 15px;
            color: #333;
        }

        .text-muted {
            color: #888;
        }

        hr {
            margin-top: 15px;
            margin-bottom: 15px;
            border: 0;
            border-top: 1px solid #eee;
        }
    </style>
@endpush

@section('index_content')
    <section>
        <div class="container py-5">
            <div class="row">
                <div class="col-lg-4">
                    <div class="card mb-4">
                        <div class="card-body text-center">
                            <img src="https://cdn.vectorstock.com/i/preview-1x/08/19/gray-photo-placeholder-icon-design-ui-vector-35850819.jpg"
                                alt="avatar" class="avatar">
                            <strong>
                                <p class="text-muted mb-1">Admin of Leo Futsal</p>
                            </strong>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="card mb-4">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Full Name</p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0">{{ auth()->user()->name }}</p>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Email</p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0">{{ auth()->user()->email }}</p>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Phone</p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0">{{ auth()->user()->phone_number }}</p>
                                </div>
                            </div>
                            <hr>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection

@push('scripts')
    <!-- Additional scripts can be added here if needed -->
@endpush
