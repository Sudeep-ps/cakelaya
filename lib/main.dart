import 'package:cakelaya/pages/categories.dart';
import 'package:cakelaya/pages/flavour_chart.dart';
import 'package:cakelaya/pages/product_details.dart';
import 'package:cakelaya/pages/shop_details.dart';
import 'package:cakelaya/pages/shop_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CAKELAYA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: GoogleFonts.poppins().fontFamily,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
          scaffoldBackgroundColor: const Color.fromRGBO(255, 255, 255, 1),
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.grey[400],
              centerTitle: true)),
      home: const ShopDetails(),
      routes: {
        ManageShopItem.routename: (ctx) => const ManageShopItem(),
        Categories.routename: (ctx) => Categories(
              unselected: const [], // Initial unselected categories
              selected: const [], // Initial selected categories
              updateSelectedCategories: (List<String> newSelected) {},
              updateUnselectedCategories: (List<String> newUnselected) {},
            ),
        ProductDetails.routename: (ctx) => const ProductDetails(),
        FlavorForm.routename: (ctx) => const FlavorForm()
      },
    );
  }
}
