import 'package:flutter/material.dart';
import 'package:mediapp/pages/emergency.dart';
import 'package:is_lock_screen/is_lock_screen.dart';
import 'package:flutter_tts/flutter_tts.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final FlutterTts flutterTTS = FlutterTts();
  stopSpeak() async {
    await flutterTTS.stop();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.inactive) {
      stopSpeak();
    }
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: new Emergency(),
    );
  }
}

void main() {
  runApp(
    MyApp(),
  );
}
