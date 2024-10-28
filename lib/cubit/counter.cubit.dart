import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(5);

  void increment() {
    log(name: "Before: ", state.toString());
    emit(state + 1);
    log(name: "After: ", state.toString());
  }

  void decrement() {
    log(name: "Before: ", state.toString());
    emit(state > 0 ? state - 1 : state);
    log(name: "After: ", state.toString());
  }
}
