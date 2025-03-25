import 'package:counter_app_with_bloc_cubit/bloc/counter.bloc.dart';
import 'package:counter_app_with_bloc_cubit/counter_bloc.screen.dart';
import 'package:counter_app_with_bloc_cubit/counter_cubit.screen.dart';
import 'package:counter_app_with_bloc_cubit/cubit/counter.cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterCubit()),
        BlocProvider(create: (context) => CounterBloc()),
      ],
      child: MaterialApp(
        title: 'Counter App with Bloc and Cuibit',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigoAccent),
        ),
        home: const MyHomePage(title: 'Counter App with Bloc and Cuibit'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // final counter = CounterCubit().state;
  // final counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: SizedBox(
        height: height * 0.8,
        width: width,
        child: Column(
          children: [
            Expanded(child: CounterCubitScreen()),
            Expanded(child: CounterBlocScreen()),
          ],
        ),
      ),
    );
  }
}
