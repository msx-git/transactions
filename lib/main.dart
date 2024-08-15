import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'repos/app_state.dart';
import 'view/screens/cards.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Card Transactions',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CardListScreen(),
    );
  }
}
