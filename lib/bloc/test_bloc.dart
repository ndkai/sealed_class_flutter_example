import 'dart:async';


import 'package:bloc/bloc.dart';
import 'bloc.dart';

class TestBloc extends Bloc<TestEvent, TestState> {
  TestBloc() :super(const TestState.initial()){
    on<GetEvent>((event, emit){
      try{
        emit(const TestState.loading());
        //do something like call api
        // final data = await callApi();
        emit(const TestState.loaded("success"));
      } catch(e){
        emit(const TestState.error());
      }
    });
  }

}
