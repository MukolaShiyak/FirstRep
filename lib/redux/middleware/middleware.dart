import 'package:flutter/cupertino.dart';
import 'package:redux/redux.dart';
import 'package:redux_learn/redux/actions/actions.dart';
import 'package:redux_learn/redux/state/app_state.dart';

void loaderMiddleware(
    Store<AppState> store, dynamic action, NextDispatcher nextDispatcher) {
  if (action is GetImageAction) {}

  nextDispatcher(action);
}
