@extends('admin.template.index')

@push('styles')
@endpush

@section('index_content')
    <div class="table-responsive">
        <table class="table table-hover">
            <thead>
                <tr>
                    <th scope="col"> ID</th>

                    <th scope="col">Order by</th>
                    <th scope="col">Start Date</th>
                    <th scope="col">End Date </th>
                    <th scope="col">Cost </th>

                    {{-- <th>
                        Action
                    </th> --}}
                </tr>
            </thead>
            <tbody>
                @foreach ($orders as $item)
                    <tr>
                        <td> {{ $item->id }}</td>
                        <td>
                            @if ($item->user)
                                <a target="_blank"
                                    href="{{ route('admin.users.show', $item->user->id) }}">{{ $item->user->name }}</a>
                            @else
                                N/A
                            @endif
                        </td>
                        <td> {{ $item->start_date ?: 'N/A' }}</td>
                        <td> {{ $item->end_date ?: 'N/A' }}</td>
                        <td> {{ $item->total ?: 'N/A' }}</td>

                        {{-- @include('admin.template.index_action') --}}
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>
@endsection

@push('scripts')
@endpush
