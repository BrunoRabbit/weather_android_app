import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_android_app/modules/register/data/digest_adapter.dart';
import 'package:weather_android_app/routes/app_routes.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await dotenv.load(fileName: '.env');

  Hive.registerAdapter(DigestAdapter());

  runApp(const WeatherApp());
}

class WeatherApp extends StatefulWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.generateRoute,
      theme: ThemeData(
        fontFamily: 'Nunito-Light',
      ),
    );
  }
}
