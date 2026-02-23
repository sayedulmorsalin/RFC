import 'package:flutter/material.dart';

class ViewProductPage extends StatelessWidget {
  final String productName;
  final String productDescription;
  final double price;


  const ViewProductPage({
    super.key,
    this.productName = "Sample Product Name",
    this.productDescription = "This is a detailed description of the sample product. It highlights all the amazing features and benefits of using it.",
    this.price = 199.99,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              productName,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12.0),
            Text(
              productDescription,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 12.0),
            Text(
              'Price: \$${price.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {

              },
              child: const Text('Add to Cart'),
            ),
            const SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {

              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  foregroundColor: Theme.of(context).colorScheme.onSecondary),
              child: const Text('Buy Now'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: TextButton.icon(
            icon: const Icon(Icons.shopping_cart),
            label: const Text('View Cart'),
            onPressed: () {

            },
          ),
        ),
      ),
    );
  }
}
