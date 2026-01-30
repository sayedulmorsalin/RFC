import 'package:get/get.dart';
import 'package:rfc/views/auth/login.dart';
import 'package:rfc/views/auth/register.dart';
import 'package:rfc/views/product/cart.dart';
import 'package:rfc/views/product/home/home.dart';
import 'package:rfc/views/profile/user_profile.dart';

class AppRoutes {
  static const home = '/';
  static const profile = '/profile';
  static const cart = '/cart';
  static const login = '/login';
  static const register = '/register';



  static final routes = [
    GetPage(name: home, page: () => const Home()),
    GetPage(name: profile, page: () => const UserProfile()),
    GetPage(name: cart, page: () => const CartPage()),
    GetPage(name: login, page: () => const Login()),
    GetPage(name: register, page: () => const Register()),

  ];
}

