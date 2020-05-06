import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterApi {
  int _count = 100;

  int get count => _count;
}

class CounterService {
  CounterApi _api;

  CounterService({@required CounterApi api}) : _api = api;

  CounterApi get api => _api;
}

class CounterModel with ChangeNotifier {
  CounterService _counterService;

  CounterModel({@required CounterService counterService})
      : _counterService = counterService;

  CounterService get counterService => _counterService;
}

class DemoProxyProvider extends StatelessWidget {
  const DemoProxyProvider({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(value: CounterApi()),
        ProxyProvider<CounterApi, CounterService>(
            update: (context, counterApi, previous) {
          return CounterService(api: counterApi);
        })
      ],
      child: TestWidget(),
    );
  }
}

class TestWidget extends StatelessWidget {
  const TestWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CounterModel>.value(
      value: CounterModel(counterService: Provider.of(context)),
      child: Consumer<CounterModel>(
        builder: (context, model, child) {
          return Center(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    model.counterService.api.count.toString(),
                    style: TextStyle(fontSize: 40),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
