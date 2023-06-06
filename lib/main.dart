import 'package:flutter/material.dart';
import 'package:test_dotted_line/custom_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Text with dotted line'),
        ),
        body: Center(
          child: CustomWidget(
            text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
            isSelected: true
          ),
        ),
      ),
    );
  }
}