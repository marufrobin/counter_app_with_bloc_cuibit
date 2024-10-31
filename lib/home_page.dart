import 'dart:developer';

import 'package:counter_app_with_bloc_cuibit/bloc/counter.bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'increment_decrement.widget.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    log(name: "--> ", "Checking if full build");

    return Scaffold(
        appBar: _appBar(context),
        body: BlocBuilder<CounterBloc, int>(
          // bloc: counterBloc,
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
        floatingActionButton: const IncrementDecrementWidget()
        /*FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const IncrementDecrementWidget(),
          ));
        },
        tooltip: "Next page",
        child: const Icon(Icons.navigate_next),
      ),*/
        );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Text("Cubit Counter Demo"),
    );
  }
}
