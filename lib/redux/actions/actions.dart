import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

class AddAction {
  final int count;

  AddAction(this.count);
}

class MinusAction {}

class SetTextAction {
  final String text;
  SetTextAction({required this.text});
}

class ResetText {}

class GetImageAction {}

class LoadedImageAction {
  final Widget widget;

  LoadedImageAction(this.widget);
}

ThunkAction calcCountThunkAction = (Store store) async {
  compute(calc, 200000000).then((value) => store.dispatch(AddAction(value)));
};

Future<int> calc(int count) async {
  int result = 0;
  for (var i = 0; i < count; ++i) {
    result++;
  }
  return result;
}

ThunkAction loadImageThunkAction = (Store store) async {
  store.dispatch(GetImageAction());
  _loadImage('https://picsum.photos/id/237/536/354')
      .then((image) => store.dispatch(LoadedImageAction(image)));
};

Future<Widget> _loadImage(String url) async {
  await Future.delayed(Duration(seconds: 5));
  return Image.network(url);
}
