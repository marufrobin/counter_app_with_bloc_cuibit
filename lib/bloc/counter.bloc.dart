import 'package:flutter_bloc/flutter_bloc.dart';

part "counter.event.dart";

/// Both [CounterIncremented] and [CounterDecremented] are assigned as
/// `final` because if it is `final` it can not be extended and implemented
/// outside of this library
class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterIncremented>((event, emit) => emit(state + 1));
    on<CounterDecremented>((event, emit) => emit(state > 0 ? state - 1 : 0));
  }
}
