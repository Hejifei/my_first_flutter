import 'package:flutter/material.dart';

class CounterDisplay extends StatelessWidget {
  const CounterDisplay({required this.count, Key? key}) : super(key: key);

  final int count;

  @override
  Widget build(BuildContext context) {
    return Text('Count: $count');
  }
}

class CounterIncrementor extends StatelessWidget {
  const CounterIncrementor({required this.onPressed, Key? key})
      : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: const Text('Increment'),
    );
  }
}

class CounterDecrementor extends StatelessWidget {
  const CounterDecrementor({required this.onPressed, Key? key})
      : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: const Text('Decrement'),
    );
  }
}


class Counter extends StatefulWidget {

  const Counter({Key? key}) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  void _decrement() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Layout show'),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add', // used by assistive technologies
        child: Icon(Icons.add),
        onPressed: _increment,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Row(children: [
            // Text('Count: $_counter'),
            CounterDisplay(count: _counter),
            SizedBox(width: 32),
            CounterIncrementor(onPressed: _increment),
            // ElevatedButton(
            //   onPressed: _increment,
            //   child: Text('+'),
            // ),
            SizedBox(width: 32),
            CounterDecrementor(onPressed: _decrement,),
            // ElevatedButton(
            //   onPressed: _decrement,
            //   child: Text('-'),
            // ),
          ],)
        
        ],
      )
    );
    // return Row(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: <Widget>[
        
    //   ],
    // );
  }
}