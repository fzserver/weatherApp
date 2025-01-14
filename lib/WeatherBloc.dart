
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import 'WeatherModel.dart';
import 'WeatherRepo.dart';


class WeatherEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class FetchWeather extends WeatherEvent{

  @override
  // TODO: implement props
  List<Object> get props => [ ];
}

class ResetWeather extends WeatherEvent{

}

class WeatherState extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];

}


class WeatherIsNotSearched extends WeatherState{
  late final String error;

  WeatherIsNotSearched(this.error);

}

class WeatherIsLoading extends WeatherState{

}

class WeatherIsLoaded extends WeatherState{
  final _weather;

  WeatherIsLoaded(this._weather);

  WeatherModel get getWeather => _weather;

  @override
  // TODO: implement props
  List<Object> get props => [_weather];
}

class WeatherIsNotLoaded extends WeatherState{

}

class WeatherBloc extends Bloc<WeatherEvent, WeatherState>{

  WeatherRepo weatherRepo;

  WeatherBloc(this.weatherRepo) : super(WeatherIsLoading()){
    on<FetchWeather>((event, emit) async{
      emit (WeatherIsLoading());

      try{
        final weather = await  weatherRepo.getWeather();
        emit (WeatherIsLoaded(weather));
      }catch(e){
        emit(WeatherIsNotSearched(e.toString()));
      }
    });

  }


// @override
//   // TODO: implement initialState
//   WeatherState get initialState => WeatherIsNotSearched(toString());
//
//   @override
//   Stream<WeatherState> mapEventToState(WeatherEvent event) async*{
//     // TODO: implement mapEventToState
//     if(event is FetchWeather){
//       yield WeatherIsLoading();
//
//       try{
//         WeatherModel weather = await weatherRepo.getWeather(event._city);
//         yield WeatherIsLoaded(weather);
//       }catch(_){
//         print(_);
//         yield WeatherIsNotLoaded();
//       }
//     }else if(event is ResetWeather){
//       yield WeatherIsNotSearched(toString());
//     }
//   }

}


