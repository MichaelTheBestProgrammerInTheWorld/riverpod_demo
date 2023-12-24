import 'package:hooks_riverpod/hooks_riverpod.dart';

enum City {
  Cairo,
  Tunis,
  Algres
}

final currentCityProvider = StateProvider<City?>((ref) {
  return null;
});

Future<String> getWeather(City city){

  final cityMap = {
    City.Cairo : 'Summer',
    City.Algres : 'Cold',
    City.Tunis : 'Hot',
  };
  return Future.delayed(Duration(seconds: 1), (){
    return cityMap[city]!!;
  });
}

final weatherProvider = FutureProvider<String>((ref) async {
  final city = ref.watch(currentCityProvider);
  if(city != null){
    return getWeather(city);
  } else {
    return 'please enter a city';
  }
});