import 'package:flutter/material.dart';
import 'package:navigasi/models/item.dart';
import 'package:navigasi/pages/home_page.dart';
import 'package:navigasi/pages/item_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == ItemPage.routeName) {
          final args = settings.arguments as Item;
          return MaterialPageRoute(
            builder: (context) {
              return ItemPage(
                name: args.name,
                quantity: args.quantity,
                price: args.price,
              );
            },
          );
        }
        assert(false, '${settings.name}');
        return null;
      },
    );
  }
}