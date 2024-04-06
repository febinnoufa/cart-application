//import 'package:counterappp/cart/bloc/cart_bloc.dart';
import 'package:counterappp/counter/counter_bloc.dart';
import 'package:counterappp/screens.dart/Home.dart';
//import 'package:counterappp/featurs/posts/ui/post_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterBloc(),),
      //  BlocProvider(create: (context) => CartBloc())
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: ScreenHome(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    print("sabfgyrvw");

    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                print("count log provider ");
                return Text(
                  "Count :  ${state.count}",
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.w600),
                );
              },
            ),
          ),
          const SizedBox(
            height: 150,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(Incerment());
                  },
                  child: const Icon(Icons.add)),
              ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(Decrement());
                  },
                  child: const Icon(Icons.remove)),
            ],
          )
        ],
      )),
    );
  }
}
