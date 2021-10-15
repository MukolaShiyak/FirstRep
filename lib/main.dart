import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_learn/redux/middleware/middleware.dart';
import 'package:redux_learn/redux/state/app_state.dart';

import 'redux/actions/actions.dart';
import 'redux/reducer/reducers.dart';

void main() {
  final Store<AppState> store = Store(reducer,
      // middleware: [loaderMiddleware],
      initialState:
          AppState(counter: 0, text: 'init', widget: const Icon(Icons.image)));
  runApp(StoreProvider(
    store: store,
    child: const MaterialApp(
      home: _Counter(),
    ),
  ));
}

class _Counter extends StatelessWidget {
  const _Counter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);
    String inputText = '';
    // String resetText = 'init';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter redux'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
              margin: const EdgeInsets.all(15),
              child: StoreConnector<AppState, AppState>(
                converter: (store) => store.state,
                builder: (context, vm) => vm.widget,
              ),
            ),
            TextButton(
              onPressed: () => store.dispatch(loadImageThunkAction(store)),
              child: Text('Get Image'),
            ),
            Container(
              width: 200,
              child: TextField(
                onChanged: (value) => inputText = value,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () =>
                      store.dispatch(SetTextAction(text: inputText)),
                  child: const Text('set'),
                ),
                TextButton(
                  onPressed: () => store.dispatch(ResetText()),
                  child: const Text('reset'),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            StoreConnector<AppState, AppState>(
              converter: (store) => store.state,
              builder: (context, vm) => Text(vm.text),
            ),
            const SizedBox(
              height: 20,
            ),
            StoreConnector<AppState, AppState>(
              converter: (store) => store.state,
              builder: (context, state) => Text(
                state.counter.toString(),
                style: const TextStyle(fontSize: 30),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () => store.dispatch(MinusAction()),
                  icon: const Icon(Icons.remove),
                ),
                IconButton(
                  onPressed: () => store.dispatch(calcCountThunkAction(store)),
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
