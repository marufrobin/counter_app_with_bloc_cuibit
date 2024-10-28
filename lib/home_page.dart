import 'dart:developer';

import 'package:counter_app_with_bloc_cuibit/cubit/counter.cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    final counter = counterCubit.state;
    log(name: "--> ", "Checking if full build");
    return Scaffold(
      appBar: _appBar(context),
      body: BlocBuilder<CounterCubit, int>(
        bloc: counterCubit,
        builder: (context, state) {
          return Center(
            child: Text(
              'Count: $state',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () => counterCubit.increment(),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 20),
          FloatingActionButton(
            onPressed: () => counterCubit.decrement(),
            tooltip: 'Decrement',
            child: const Icon(Icons.minimize),
          ),
        ],
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Text("Cubit Counter Demo"),
    );
  }
}
