import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  ChangeNotifierProvider(
    create: (context) => Counter(),
    child: MaterialApp(home: MyApp()),
  ),
);

class Counter extends ChangeNotifier {
  int counter = 0;

  void increment() {
    counter++;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<Counter>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Provider Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Counter value: ${data.counter}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: data.increment,
              child: Text('Increment Counter'),
            ),
          ],
        ),
      ),
    );
  }
}