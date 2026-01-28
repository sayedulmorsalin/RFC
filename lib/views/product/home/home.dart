import 'package:flutter/material.dart';
import 'package:rfc/views/product/home/item_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final h1_color = Colors.white;
  final h2_color = Colors.white;
  final h3_color = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("Welcome to RFC", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: h1_color)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.person, color: Colors.white),
            onPressed: () {
              // Navigate to cart screen
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildRestaurantHeader(),
              const SizedBox(height: 24),
              _buildSectionTitle("Menu"),
              const SizedBox(height: 16),
              _buildMenuList(),
            ],
          ),
        ),

      ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Navigate to cart screen
          },
          child: const Icon(Icons.shopping_cart),
        )
    );
  }

  Widget _buildRestaurantHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            "https://images.unsplash.com/photo-1571091718767-18b5b1457add?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1172&q=80",
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          "Raihan Food Corner",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: h2_color),
        ),
        const SizedBox(height: 8),
        Text(
          "Chinese • Burgers • Fast Food",
          style: TextStyle(fontSize: 16, color: h3_color),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Icon(Icons.star, color: Colors.yellow, size: 20),
            Text(" 4.5 (200+ ratings)",style: TextStyle(color: h3_color)),
            SizedBox(width: 16),
            Icon(Icons.timer_outlined, size: 20),
            Text(" 25-35 min",style: TextStyle(color: h3_color)),
          ],
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: h2_color),
    );
  }

  Widget _buildMenuList() {
    final menu = [
      {
        "name": "Classic Burger",
        "description": "A juicy beef patty with lettuce, tomato, and our special sauce.",
        "price": "\$9.99",
        "image": "https://images.unsplash.com/photo-1550547660-d9450f859349?auto=format&fit=crop&w=765&q=80"
      },
      {
        "name": "Cheese Burger",
        "description": "The classic burger with a slice of melted cheddar cheese.",
        "price": "\$10.99",
        "image": "https://images.unsplash.com/photo-1607013251379-e6eecfffe234?auto=format&fit=crop&w=687&q=80"
      },
      {
        "name": "Fries",
        "description": "Crispy golden fries.",
        "price": "\$3.99",
        "image": "https://images.unsplash.com/photo-1541592106381-b31e9677c0e5?auto=format&fit=crop&w=1170&q=80"
      },
    ];

    return SizedBox(
      height: 270,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: menu.length,
        itemBuilder: (context, index) {
          return SizedBox(
            width: 280,
            child: buildMenuItemCard(menu[index]),
          );
        },
      ),
    );
  }



}
