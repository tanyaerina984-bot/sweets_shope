import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';
import 'providers/product_provider.dart';
import 'screens/auth_screen.dart';
import 'screens/product_list_screen.dart';
import 'screens/registration_screen.dart';

void main() {
  runApp(const PastryWarehouseApp());
}

class PastryWarehouseApp extends StatelessWidget {
  const PastryWarehouseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
      ],
      child: MaterialApp(
        title: 'Склад кондитерской',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.brown,
            brightness: Brightness.light,
            background: Colors.brown.shade50,
          ),
          useMaterial3: true,
          textTheme: const TextTheme(
            bodyLarge: TextStyle(fontSize: 16, color: Colors.brown),
          ),
        ),
        initialRoute: '/auth',
        routes: {
          '/auth': (context) => const AuthScreen(),
          '/register': (context) => const RegistrationScreen(),
          '/products': (context) => const ProductListScreen(),
        },
      ),
    );
  }
}