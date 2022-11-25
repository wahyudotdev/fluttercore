import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/transformers.dart';

/// To debounce bloc event, example case when
/// we need to delay search input
/// ```
/// // example usage
/// on<KeywordEnteredEvent>((event, emit) {
///    debugPrint(event.query);
///  }, transformer: debounceSequential(const Duration(seconds: 1)));
///
/// ```
EventTransformer<Event> debounceSequential<Event>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration).asyncExpand(mapper);
}