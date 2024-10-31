import 'package:counter_app_with_bloc_cuibit/bloc/counter.bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncrementDecrementWidget extends StatelessWidget {
  const IncrementDecrementWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // final counterCubit = BlocProvider.of<CounterCubit>(context);
    final counterBloc = BlocProvider.of<CounterBloc>(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          onPressed: () => counterBloc.add(CounterIncremented()),
          tooltip: 'Increment',
          child: const Icon(Icons.plus_one),
        ),
        const SizedBox(height: 20),
        FloatingActionButton(
          onPressed: () => counterBloc.add(CounterDecremented()),
          tooltip: 'Decrement',
          child: const Icon(Icons.exposure_minus_1),
        ),
      ],
    );
  }
}
