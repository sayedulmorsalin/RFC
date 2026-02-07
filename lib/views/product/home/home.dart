import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:rfc/routes/routes.dart';
import 'package:rfc/views/product/home/all_item_card.dart';
import 'package:rfc/views/product/home/item_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Welcome to RFC",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: scheme.onPrimary,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.person, color: scheme.onPrimary),
            onPressed: () {
              Get.toNamed(AppRoutes.profile);
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
              _buildSearchField(),
              const SizedBox(height: 24),
              _buildRestaurantHeader(),
              const SizedBox(height: 24),
              _buildSectionTitle("Popular Menu"),
              const SizedBox(height: 16),
              _buildMenuList(),
              const SizedBox(height: 24),
              _buildSectionTitle("Fast Delivery"),
              const SizedBox(height: 16),
              _buildMenuList(),
              const SizedBox(height: 24),
              _buildSectionTitle("All Menu"),
              const SizedBox(height: 16),
              _builAlldMenuList(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.cart);
        },
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search for food...",
        hintStyle: TextStyle(
          color: Theme.of(
            context,
          ).textTheme.titleMedium?.color?.withOpacity(0.6),
        ),
        prefixIcon: Icon(
          Icons.search,
          color: Theme.of(
            context,
          ).textTheme.titleMedium?.color?.withOpacity(0.6),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Theme.of(context).colorScheme.surface,
      ),
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
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "Chinese • Burgers • Fast Food",
          style: TextStyle(
            fontSize: 16,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Icon(
              Icons.run_circle_outlined,
              color: Theme.of(context).colorScheme.onSurface,
              size: 20,
            ),
            Text(
              " Very fast delivery ",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
              ),
            ),
            SizedBox(width: 16),
            Icon(
              Icons.timer_outlined,
              color: Theme.of(context).colorScheme.onSurface,
              size: 20,
            ),
            Text(
              " 25-35 min",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }

  Widget _buildMenuList() {
    final menu = [
      {
        "name": "Classic Burger",
        "description":
            "A juicy beef patty with lettuce, tomato, and our special sauce.",
        "price": "\$9.99",
        "image":
            "https://images.unsplash.com/photo-1550547660-d9450f859349?auto=format&fit=crop&w=765&q=80",
      },
      {
        "name": "Cheese Burger",
        "description":
            "The classic burger with a slice of melted cheddar cheese.",
        "price": "\$10.99",
        "image":
            "https://images.unsplash.com/photo-1607013251379-e6eecfffe234?auto=format&fit=crop&w=687&q=80",
      },
      {
        "name": "Fries",
        "description": "Crispy golden fries.",
        "price": "\$3.99",
        "image":
            "https://images.unsplash.com/photo-1541592106381-b31e9677c0e5?auto=format&fit=crop&w=1170&q=80",
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
            child: buildMenuItemCard(context, menu[index]),
          );
        },
      ),
    );
  }

  Widget _builAlldMenuList() {
    final menu = [
      {
        "name": "Classic Burger",
        "description":
            "A juicy beef patty with lettuce, tomato, and our special sauce.",
        "price": "\$9.99",
        "image":
            "https://images.unsplash.com/photo-1550547660-d9450f859349?auto=format&fit=crop&w=765&q=80",
      },
      {
        "name": "Cheese Burger",
        "description":
            "The classic burger with a slice of melted cheddar cheese.",
        "price": "\$10.99",
        "image":
            "https://images.unsplash.com/photo-1607013251379-e6eecfffe234?auto=format&fit=crop&w=687&q=80",
      },
      {
        "name": "Fries",
        "description": "Crispy golden fries.",
        "price": "\$3.99",
        "image":
            "https://images.unsplash.com/photo-1541592106381-b31e9677c0e5?auto=format&fit=crop&w=1170&q=80",
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: menu.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.6,
      ),
      itemBuilder: (context, index) {
        return buildAllMenuItemCard(context, menu[index]);
      },
    );
  }
}
