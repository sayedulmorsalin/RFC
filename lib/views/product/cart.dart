import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final background = Colors.redAccent;
  final text_color = Colors.white;
  // Dummy data for cart items
  final List<Map<String, dynamic>> _cartItems = [
    {
      "name": "Classic Burger",
      "price": 9.99,
      "quantity": 1,
      "image":
          "https://images.unsplash.com/photo-1550547660-d9450f859349?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80"
    },
    {
      "name": "Fries",
      "price": 3.99,
      "quantity": 2,
      "image":
          "https://images.unsplash.com/photo-1541592106381-b31e9677c0e5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        title: Text('My Cart', style: TextStyle(color: text_color, fontSize: 24, fontWeight: FontWeight.bold),),
        iconTheme: IconThemeData(color: text_color),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _cartItems.length,
              itemBuilder: (context, index) {
                return _buildCartItem(_cartItems[index]);
              },
            ),
          ),
          _buildOrderSummary(),
        ],
      ),
    );
  }

  Widget _buildCartItem(Map<String, dynamic> item) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              item['image'],
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item['name'], style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: text_color)),
                Text('\$${item['price'].toStringAsFixed(2)}', style: TextStyle(fontSize: 16, color: text_color)),
              ],
            ),
          ),
          _buildQuantityControl(item),
        ],
      ),
    );
  }

  Widget _buildQuantityControl(Map<String, dynamic> item) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.remove_circle_outline, color: text_color,),
          onPressed: () {
            setState(() {
              if (item['quantity'] > 1) {
                item['quantity']--;
              }
            });
          },
        ),
        Text(item['quantity'].toString(), style: TextStyle(fontSize: 16, color: text_color),),
        IconButton(
          icon:  Icon(Icons.add_circle_outline, color: text_color,),
          onPressed: () {
            setState(() {
              item['quantity']++;
            });
          },
        ),
      ],
    );
  }

  Widget _buildOrderSummary() {
    double subtotal = _cartItems.fold(0, (sum, item) => sum + (item['price'] * item['quantity']));
    double deliveryFee = 5.00;
    double total = subtotal + deliveryFee;

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: background,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, -3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Subtotal', style: TextStyle(fontSize: 16, color: text_color)),
              Text('\$${subtotal.toStringAsFixed(2)}', style: TextStyle(fontSize: 16, color: text_color)),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Delivery Fee', style: TextStyle(fontSize: 16, color: text_color)),
              Text('\$${deliveryFee.toStringAsFixed(2)}', style: TextStyle(fontSize: 16, color: text_color)),
            ],
          ),
          const Divider(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: text_color)),
              Text('\$${total.toStringAsFixed(2)}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: text_color)),
            ],
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              // primary: Colors.redAccent,
            ),
            onPressed: () {
              // Navigate to checkout
            },
            child: const Text('Proceed to Checkout', style: TextStyle(fontSize: 18)),
          ),
        ],
      ),
    );
  }
}
