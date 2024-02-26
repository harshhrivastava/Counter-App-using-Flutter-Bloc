import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/features/counter/bloc/counter_bloc.dart';

class AnotherPage extends StatefulWidget {
  final CounterBloc counterBloc;

  const AnotherPage({
    super.key,
    required this.counterBloc,
  });

  @override
  State<AnotherPage> createState() => _AnotherPageState();
}

class _AnotherPageState extends State<AnotherPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterBloc, CounterState>(
      bloc: widget.counterBloc,
      listenWhen: (previous, current) => current is CounterActionState,
      listener: (context, state) {
        switch(state.runtimeType) {
          case CounterIncrementActionState:
            setState(() {});
            break;
          case CounterDecrementActionState:
            setState(() {});
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
                  widget.counterBloc.count.toString(),
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    widget.counterBloc.add(CounterIncrementEvent());
                  },
                  child: const Text(
                    'Increment',
                  ),
                ),
                TextButton(
                  onPressed: () {
                    widget.counterBloc.add(CounterDecrementEvent());
                  },
                  child: const Text(
                    'Decrement',
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
