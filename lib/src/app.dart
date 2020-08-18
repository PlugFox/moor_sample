import 'dart:async';

import 'package:flutter/material.dart';

import 'repository.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) =>
    MaterialApp(
      title: 'Moor sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Home(),
    );
}

@immutable
class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) =>
    const Scaffold(
      body: SafeArea(
        child: Center(
          child: MoorForm(),
        ),
      ),
    );
}

@immutable
class MoorForm extends StatefulWidget {
  const MoorForm({Key key}) : super(key: key);
  @override
  State<MoorForm> createState() => _MoorFormState();
}

class _MoorFormState extends State<MoorForm> {

  final Repository _repo = Repository();
  bool _isInit = false;
  String _text;

  @override
  void initState() {
    super.initState();
    _repo.init().then((value) =>
      setState(() {
        _isInit = true;
      }));
  }

  @override
  void dispose() {
    _repo.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
    !_isInit
    ? const SizedBox(
      height: 64,
      width: 64,
      child: CircularProgressIndicator(),
    )
    : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 25),
          Expanded(
            child: Text(
              _text ?? '<none>',
            ),
          ),
          SizedBox(
            height: 50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                RaisedButton(
                  onPressed: () async {
                    await _repo.setCurrentDate();
                    setState(() {
                      _text = 'success';
                    });
                  },
                  child: const Text('Set current date'),
                ),
                RaisedButton(
                  onPressed: () async {
                    final value = await _repo.getLastDate();
                    setState(() {
                      _text = value;
                    });
                  },
                  child: const Text('Get last date'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
        ],
      );
}
