import 'package:coin_switch/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    const ProviderScope(
      child: CoinSwitch(),
    ),
  );
}

class CoinSwitch extends StatelessWidget {
  const CoinSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 65, 179, 162),
            brightness: Brightness.dark,
        ),
      ),
        home: const HomeScreen()
    );
  }
}
