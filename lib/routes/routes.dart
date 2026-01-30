import 'package:get/get.dart';
import 'package:rfc/views/product/cart.dart';
import 'package:rfc/views/product/home/home.dart';
import 'package:rfc/views/profile/user_profile.dart';

class AppRoutes {
  static const home = '/';
  static const profile = '/profile';
  static const cart = '/cart';


  static final routes = [
    GetPage(name: home, page: () => const Home()),
    GetPage(name: profile, page: () => const UserProfile()),
    GetPage(name: cart, page: () => const CartPage()),
  ];
}

