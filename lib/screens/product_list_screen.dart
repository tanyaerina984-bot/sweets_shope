import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../providers/product_provider.dart';
import 'product_detail_screen.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();
    final products = context.watch<ProductProvider>().products;

    return Scaffold(
      appBar: AppBar(
        title: Text('Склад кондитерской'),
        actions: [
          TextButton(
            onPressed: () {
              context.read<AuthProvider>().logout();
              Navigator.pushReplacementNamed(context, '/auth');
            },
            child: Text('Выйти (${auth.currentUser?.name})', style: const TextStyle(color: Colors.white)),
          ),
          const SizedBox(width: 10),
        ],
      ),
      backgroundColor: Colors.brown.shade50,
      body: products.isEmpty
          ? const Center(child: Text('Товары не найдены'))
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(12),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(product.imagePath),
                      radius: 30,
                    ),
                    title: Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(product.description, maxLines: 2, overflow: TextOverflow.ellipsis),
                    trailing: Chip(
                      label: Text(product.statusText),
                      backgroundColor: product.statusColor.withOpacity(0.2),
                      side: BorderSide(color: product.statusColor),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ProductDetailScreen(productId: product.id),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}