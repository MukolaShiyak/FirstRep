import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_learn/redux/actions/actions.dart';
import 'package:redux_learn/redux/state/app_state.dart';

AppState reducer(AppState state, dynamic action) => AppState(
    widget: _imageReducer(state.widget, action),
    counter: _counterReducer(state.counter, action),
    text: _textReducer(state.text, action));

Reducer<Widget> _imageReducer = combineReducers([
  TypedReducer<Widget, GetImageAction>(_getImageReducer),
  TypedReducer<Widget, LoadedImageAction>(_loadedImageReducer),
]);

Widget _getImageReducer(Widget widget, GetImageAction action) =>
    CircularProgressIndicator();
Widget _loadedImageReducer(Widget widget, LoadedImageAction action) =>
    action.widget;

Reducer<int> _counterReducer = combineReducers([
  TypedReducer<int, AddAction>(_addCounterReducer),
  TypedReducer<int, MinusAction>(_removeCounterReducer),
]);

Reducer<String> _textReducer = combineReducers([
  TypedReducer<String, SetTextAction>(_setTextReducer),
  TypedReducer<String, ResetText>(_resetTextReducer),
]);

int _addCounterReducer(int count, AddAction action) => action.count;

int _removeCounterReducer(int count, MinusAction action) => count - 1;

String _setTextReducer(String text, SetTextAction action) => action.text;
String _resetTextReducer(String text, ResetText action) => 'init';

// AppState reducer(AppState state, dynamic action) => AppState(
//       counter: _counterReducer(state, action),
//       text: _textReducer(state, action),
//     );

// int _counterReducer(AppState state, dynamic action) {
//   if (action is MinusAction) {
//     return state.counter - 1;
//   } else if (action is AddAction) {
//     return state.counter + 1;
//   } else {
//     return state.counter;
//   }
// }

// String _textReducer(AppState state, dynamic action) {
//   if (action is SetTextAction) {
//     return action.text;
//   } else if (action is ResetText) {
//     return 'init';
//   } else {
//     return state.text;
//   }
// }
