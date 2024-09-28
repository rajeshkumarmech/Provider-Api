import 'package:flutter/material.dart';
import 'package:interns1/screen/apiscreen.dart';
import 'package:interns1/screen/provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => providercall(),
      builder: (context, child) {
        final themechange = Provider.of<providercall>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themechange.theme,
          home: FetchApiScreen1(),
        );
      },
    );
  }
}
