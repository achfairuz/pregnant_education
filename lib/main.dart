import 'package:flutter/material.dart';
import 'package:pregnant_education/core/routes/app_router.dart';
import 'package:pregnant_education/shared/helpers/tts_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await TtsHelper.init(
    language: 'id-ID',
    pitch: 1.0,
    rate: 0.5,
    volume: 1.0,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Maternia',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
    );
  }
}
