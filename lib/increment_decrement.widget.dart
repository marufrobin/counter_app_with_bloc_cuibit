import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/counter.cubit.dart';

class IncrementDecrementWidget extends StatelessWidget {
  const IncrementDecrementWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final counterCubit = BlocProvider.of<CounterCubit>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              onPressed: () => counterCubit.increment(),
              tooltip: 'Increment',
              child: const Icon(Icons.plus_one),
            ),
            const SizedBox(height: 20),
            FloatingActionButton(
              onPressed: () => counterCubit.decrement(),
              tooltip: 'Decrement',
              child: const Icon(Icons.exposure_minus_1),
            ),
          ],
        ),
      ),
    );
  }
}
