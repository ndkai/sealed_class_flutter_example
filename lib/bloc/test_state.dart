
import 'package:freezed_annotation/freezed_annotation.dart';
part 'test_state.freezed.dart';

//remember to use 'flutter pub run build_runner build' to generated code
@freezed
abstract class TestState with _$TestState {
const factory TestState.initial() = _TestInitial;
const factory TestState.loading() = _TestLoading;
const factory TestState.loaded(String data) = _TestLoaded;
const factory TestState.error() = _TestError;
}

