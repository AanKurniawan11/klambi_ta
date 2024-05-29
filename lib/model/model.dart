import 'package:flutter/material.dart';

class Product {
  final int id,stock, saled;
  final String title, image, category, price, description;
  final double rating ;
  final bool isFavourite, isPopular;

  Product({
    required this.id,
    required this.image,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    required this.category,
    required this.price,
    required this.stock,
    required this.saled,
    required this.description,
  });
}

// Our demo Products
List<Product> demoProducts = [
  Product(
    id: 1,
    image: 'assets/images/demo_image.png',
    title: 'Custom Baju Warna Hitam Polos',
    category: 'Lengan Pendek',
    price: '99.000',
    description: description,
    rating: 4.5,
    stock: 10,
    saled: 15,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 2,
    image: 'assets/images/demo_image.png',
    title: 'Custom Baju Warna Hitam Polos',
    category: 'Lengan Pendek',
    price: '199.000',
    description: description,
    rating: 4.0,
    stock: 12,
    saled: 10,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 3,
    image: 'assets/images/demo_image.png',
    title: 'Custom Baju Warna Hitam Polos',
    category: 'Oversize',
    price: '119.000',
    description: description,
    rating: 5.0,
    stock: 15,
    saled: 14,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 4,
    image: 'assets/images/demo_image.png',
    title: 'Custom Baju Warna Hitam Polos',
    category: 'Lengan Panjang',
    price: '129.000',
    description: description,
    rating: 4.0,
    stock: 12,
    saled: 7,
    isFavourite: true,
    isPopular: true,
  ),
];

const String description =
    'Demo Deskripsi Tentang Produk Klambi Yang Akan Kami jual Pada Aplikasi Mobile yang akan Kami Buat...';

