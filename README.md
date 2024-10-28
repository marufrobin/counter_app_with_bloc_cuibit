# Counter App with Bloc and Cuibit

POC(Proof of Concept) Counter app using BOLC and Cuibit with Clean Architecture SOLID

## Cubit State management

First we need to create a Cubit State management class

```dart
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
```

## Cubit State management with BlocBuilder

Now we need to create a Cubit State management with BlocBuilder

```dart
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  final counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: BlocBuilder<CounterCubit, int>(
        bloc: counterCubit,
        builder: (context, state) {
          return Center(
            child: Text('Count: $state'),
          );
        },
      ),
      floatingActionButton: Column(
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
    );
  }
}
```

## Cubit State management with BlocProvider

Now we need to create a Cubit State management with BlocProvider

In the `main.dart` file

```dart
 BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Counter App with Bloc and Cuibit',
        home: const MyHomePage(),
      ),
    )
```

```dart
/// [CounterCubit] class can be used as a singleton from any where in the app
    final counterCubit = BlocProvider.of<CounterCubit>(context);
```

```dart
/// My home page
  @override
  Widget build(BuildContext context) {
    final counterCubit = BlocProvider.of<CounterCubit>(context);
    return Scaffold(
      body: BlocBuilder<CounterCubit, int>(
        bloc: counterCubit,
        builder: (context, state) {
          return Center(
            child: Text('Count: $state'),
          );
        },
      ),

  }
```

```dart
/// My Increment Decrement Widget
@override
  Widget build(BuildContext context) {
    final counterCubit = BlocProvider.of<CounterCubit>(context);
    return Scaffold(
      body:  Column(
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
    );
  }
```
