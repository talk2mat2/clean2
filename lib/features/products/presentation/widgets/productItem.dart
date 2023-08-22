import 'package:clean/features/products/domain/entities/ProductEntity.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  ProductEntity item;
  ProductItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(vertical: 5),
      width: MediaQuery.of(context).size.width,
      color: const Color(0xffffffff),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Image.network(
          item.thumbnail ?? "",
          width: MediaQuery.of(context).size.width * 0.3,
        ),
        Text(
          item.title ?? "",
          style: const TextStyle(fontWeight: FontWeight.bold),
        )
      ]),
    );
  }
}
