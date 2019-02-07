<div class = "container">
    <div class = "level">
        @foreach($homenumbers as $number)
            @if($number->title !='Active Clients on PrEP')
                <div class = "level-item" >
                    <p class ="title"><b>{{number_format($number->number)}}</b></p>
                    <p class ="subtitle">{{$number->title.'('.$number->subtitle.')'}}</p>    
                </div>
            @else
            <div class = "level-item" >
            @if(!empty($patient_numbers))
                    <p class ="title"><b>{{number_format($patient_numbers[0]->patients)}}</b></p>
                    <p class ="subtitle">{{$number->title.' ('.$patient_numbers[0]->data_year.')'}}</p>
            @endif    
            </div>
            @endif
        @endforeach
    </div>
</div>