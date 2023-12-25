import 'package:hooks_riverpod/hooks_riverpod.dart';


List<String> colors = [
  'grey',
  'blue',
  'red',
  'purple',
  'black',
  'white',
  'yellow'
];

final tickerProvider = StreamProvider((ref) {
  return Stream.periodic(Duration(seconds: 1), (i){
    return i+1;
  });
});

final colorProvider = StreamProvider((ref) {
  final x = ref.watch(tickerProvider.stream).map((count) =>
  colors.getRange(0, count));
  return x;
});