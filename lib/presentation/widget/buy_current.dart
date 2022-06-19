import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mythic_design/common/size.dart';

import '../../common/thema_app.dart';

class BuyCurrent extends StatelessWidget {
   BuyCurrent({
    Key? key, required this.price,
  }) : super(key: key);

  final int price;

  NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: 2,
    );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: coverPading),
      height: 50,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
          gradient: gradientButton,
          borderRadius: BorderRadius.circular(50)),
      child: Container(
        height: 48,
        padding: const EdgeInsets.only(
            left: defaultPading + coverPading,
            top: 2,
            bottom: 2,
            right: 1.5),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(50)),
        child: Row(
          children: [
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                const Text(
                  "current",
                  style: TextStyle(color: label),
                ),
                Text(
                 currencyFormatter.format(price),
                  style: const TextStyle(
                      color: titleActive,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                )
              ],
            )),
            Container(
              height: 44,
              width: 44,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, gradient: gradientButton),
              child: Image.asset("asset/icons/Cart_white.png"),
            )
          ],
        ),
      ),
    );
  }
}
