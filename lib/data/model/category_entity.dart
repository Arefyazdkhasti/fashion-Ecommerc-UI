import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryEntity {
  final String id;
  final Icon image;
  final String title;

  CategoryEntity({
    required this.id,
    required this.image,
    required this.title,
  });

  static List<CategoryEntity> fakeCategories = [
    CategoryEntity(id: '1', image: const Icon(CupertinoIcons.cube_box , size: 24), title: 'All'),
    CategoryEntity(id: '2', image: const Icon(CupertinoIcons.collections , size: 24), title: 'Clothing'),
    CategoryEntity(id: '3', image: const Icon(CupertinoIcons.camera , size: 24), title: 'Accessories'),
    CategoryEntity(id: '4', image: const Icon(CupertinoIcons.bag , size: 24), title: 'Bags'),
    CategoryEntity(id: '5', image: const Icon(CupertinoIcons.star , size: 24), title: 'Shoes'),
  ];
}

