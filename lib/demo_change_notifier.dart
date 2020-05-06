import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Counter with ChangeNotifier {
  int _count = 0;

  int get count => _count;
  increment() {
    _count++;
    notifyListeners();
  }
}

class DemoChangeNotifierProvider extends StatelessWidget {
  const DemoChangeNotifierProvider({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Counter>(
      create: (context) => Counter(),
      child: TestWidget(),
    );
  }
}

class TestWidget extends StatelessWidget {
  const TestWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Counter counter = Provider.of<Counter>(context);
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              counter.count.toString(),
              style: TextStyle(fontSize: 40),
            ),
            RaisedButton(
              onPressed: () {
                counter.increment();
              },
              child: Text(
                "Increment",
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
