import 'package:flutter/material.dart';
import '../auth/login_page.dart';
import 'models/product.dart';
import 'widgets/product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data for Phase 2
    final mockProducts = [
      const Product(
        id: 1,
        title: 'Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops',
        price: 109.95,
        description: 'Your perfect pack for everyday use and walks in the forest.',
        imageUrl: 'TODO',
      ),
      const Product(
        id: 2,
        title: 'Mens Casual Premium Slim Fit T-Shirts ',
        price: 22.3,
        description: 'Slim-fitting style, contrast raglan sleeve.',
        imageUrl: 'TODO',
      ),
      const Product(
        id: 3,
        title: 'Mens Cotton Jacket',
        price: 55.99,
        description: 'great outerwear jackets for Spring/Autumn/Winter.',
        imageUrl: 'TODO',
      ),
      const Product(
        id: 4,
        title: 'Mens Casual Slim Fit',
        price: 15.99,
        description: 'The color could be slightly different between on the screen and in practice.',
        imageUrl: 'TODO',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Loja Online'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
               // Phase 4 will navigate to CartPage
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
               Navigator.pushReplacement(
                 context,
                 MaterialPageRoute(builder: (context) => const LoginPage()),
               );
            },
            tooltip: 'Sair',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: mockProducts.length,
          itemBuilder: (context, index) {
            return ProductCard(product: mockProducts[index]);
          },
        ),
      ),
    );
  }
}
