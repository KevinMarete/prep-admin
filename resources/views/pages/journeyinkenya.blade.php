@extends('layouts.app')
@section('content')
<div class = "container has-text-centered">
    <header></header>
    @foreach($data['misc'] as $misc)
        {!!$misc->content!!}
    @endforeach
</div>
@endsection