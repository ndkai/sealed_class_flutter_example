import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sealed_classes/bloc/bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  late BuildContext _blocContext;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: BlocProvider<TestBloc>(
          create: (context) => TestBloc(),
          child: Column(
            children: [
              const SizedBox(height: 300,),
              BlocBuilder<TestBloc, TestState>  (
                builder: (context, state) {
                  _blocContext = context;
                  return state.when(
                      initial: () => const Center(
                        child: Text("init"),
                      ),
                      loading: () => const Center(
                        child: Text("loading"),
                      ),
                      loaded: (e) => Center(
                        child: Text(e),
                      ),
                      error: () => const Center(
                        child: Text("error"),
                      ));
                },
              ),
              ElevatedButton(
                onPressed: (){
                  BlocProvider.of<TestBloc>(_blocContext).add(GetEvent());
                },
                child: const Center(
                  child: Text("Call event"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
