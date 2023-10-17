import 'package:flutter/material.dart';
import 'animated_bottom_navigation/animated_bottom_nagivation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animated bottom navigation',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Animated bottom navigation'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<IconData> bottomIcon = [
    Icons.home,
    Icons.search,
    Icons.settings,
    Icons.history,
  ];
  int selectedIndex = 0;

  void bottomOnchange(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AnimatedBottomNagivation(
        itemList: bottomIcon,
        onChanged: (int value) {
          bottomOnchange(value);
        },
      ),
      body: Center(
        child: Icon(
          bottomIcon[selectedIndex],
        ),
      ),
    );
  }
}
