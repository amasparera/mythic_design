import 'package:flutter/material.dart';
import 'package:mythic_design/common/thema_app.dart';
import 'package:mythic_design/domain/enities/product.dart';

import '../../common/size.dart';
import 'buy_current.dart';

class CardHome extends StatelessWidget {
  const CardHome(
      {Key? key,
      this.onTap,
      required this.product,
      required this.statusFavorite})
      : super(key: key);

  final GestureTapCallback? onTap;
  final Product product;
  final bool statusFavorite;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(
            left: defaultPading, right: defaultPading, bottom: defaultPading),
        padding: const EdgeInsets.all(coverPading),
        width: double.infinity,
        decoration: BoxDecoration(
            color: whiteCard,
            borderRadius: BorderRadius.circular(coverPading * 2)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 400,
              margin: const EdgeInsets.only(bottom: coverPading * 1.5),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(coverPading * 1.5),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(product.productImage))),
            ),
            Text(product.productName,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(height: coverPading),
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey,
                  backgroundImage: NetworkImage(product.creatorImage),
                ),
                const SizedBox(width: coverPading / 2),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.creatorName,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: body),
                    ),
                    const Text(
                      "creator",
                      style: TextStyle(color: label, fontSize: 14),
                    )
                  ],
                )),
                GestureDetector(
                    child: Icon(
                  Icons.favorite,
                  color: statusFavorite ? Colors.red : Colors.grey,
                ))
              ],
            ),
            BuyCurrent(
              price: product.productPrice,
            )
          ],
        ),
      ),
    );
  }
}
