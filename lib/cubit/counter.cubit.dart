import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() {
    log(name: "Before", "${state}");

    /// Todo: increment the counter emit the new state
    emit(state + 1);
    log(name: "After", "${state}");
  }

  void decrement() {
    /// Todo: decrement the counter emit the new state
    if (state > 0) emit(state - 1);
  }
}
