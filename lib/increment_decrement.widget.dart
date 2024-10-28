import 'package:flutter/material.dart';

import 'cubit/counter.cubit.dart';

class IncrementDecrementWidget extends StatelessWidget {
  const IncrementDecrementWidget({
    super.key,
    required this.counterCubit,
  });

  final CounterCubit counterCubit;

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
