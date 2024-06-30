@extends('admin.template.index')

@push('styles')
@endpush

@section('index_content')
    <div class="table-responsive">
        <table class="table table-hover">
            <thead>
                <tr>
                    <th scope="col"> ID</th>
                    <th scope="col">Name</th>
                    <th scope="col">Image</th>

                    <th>
                        Action
                    </th>
                </tr>
            </thead>
            <tbody>
                @foreach ($venues as $item)
                    <tr>
                        <td> {{ $item->id }}</td>
                        <td> {{ $item->name }}</td>

                        <td>
                            <a target="_blank" href="{{ asset($item->image) }}"><img style="width: 50px; height:10%"
                                    src="{{ asset($item->image) }}"></a>
                        </td>

                        @include('admin.template.index_action')
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>

    @if ($venues->count() > 1)
        <div class="text-center mt-4">
            <a href="{{ route('create.venue') }}" class="btn btn-primary">Add Venue</a>
        </div>
    @endif
@endsection

@push('scripts')
@endpush
