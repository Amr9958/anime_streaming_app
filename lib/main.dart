import 'package:anime_streaming_app/core/utils/theming.dart';
import 'package:flutter/material.dart';
import 'package:anime_streaming_app/core/di/injection_container.dart';
import 'package:anime_streaming_app/core/navigation/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize dependencies
  await initializeDependencies();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Anime App',
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      theme:AppTheme   );
  }
}