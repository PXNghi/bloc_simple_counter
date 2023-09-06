import 'package:bloc_counter/bloc/bloc_event.dart';
import 'package:bloc_counter/bloc/bloc_state.dart';
import 'package:bloc_counter/bloc/counter_bloc.dart';
import 'package:bloc_counter/view/second_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First Page"),
        centerTitle: true,
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                state.counter.toString(),
                style: const TextStyle(fontSize: 50.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () =>
                        BlocProvider.of<CounterBloc>(context).add(Increment()),
                    child: const Icon(Icons.add),
                  ),
                  const SizedBox(
                    width: 30.0,
                  ),
                  ElevatedButton(
                    onPressed: () =>
                        BlocProvider.of<CounterBloc>(context).add(Decrement()),
                    child: const Icon(Icons.remove),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const SecondPage()));
                },
                child: Container(
                  width: 138,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple[100],
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: const Center(
                    child: Text(
                      "Click here",
                      style: TextStyle(color: Colors.deepPurple),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
