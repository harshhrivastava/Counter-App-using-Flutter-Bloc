import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/features/counter/bloc/counter_bloc.dart';
import 'package:learn_bloc/features/counter/ui/another_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CounterBloc counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterBloc, CounterState>(
      bloc: counterBloc,
      listenWhen: (previous, current) => current is CounterActionState,
      listener: (context, state) {
        switch(state.runtimeType) {
          case CounterIncrementActionState:
            setState(() {});
            break;
          case CounterDecrementActionState:
            setState(() {});
            break;
          case CounterNavigateActionState:
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AnotherPage(
                  counterBloc: counterBloc,
                ),
              ),
            );
            break;
        }
      },
      buildWhen: (previous, current) => current is !CounterActionState,
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  counterBloc.count.toString(),
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    counterBloc.add(CounterIncrementEvent());
                  },
                  child: const Text(
                    'Increment',
                  ),
                ),
                TextButton(
                  onPressed: () {
                    counterBloc.add(CounterDecrementEvent());
                  },
                  child: const Text(
                    'Decrement',
                  ),
                ),
                TextButton(
                  onPressed: () {
                    counterBloc.add(CounterNavigateEvent());
                  },
                  child: const Text(
                    'Navigate',
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
