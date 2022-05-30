import 'package:flutter/material.dart';
import 'package:mythic_design/common/thema_app.dart';

import '../../common/size.dart';

class CardHome extends StatelessWidget {
  const CardHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://images.unsplash.com/photo-1463438690606-f6778b8c1d10?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687"))),
          ),
          const Text('Mirror',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              )),
          const SizedBox(height: coverPading),
          Row(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1599566150163-29194dcaad36?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687"),
              ),
              const SizedBox(width: coverPading / 2),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Pawel Czerwinski",
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold, color: body),
                  ),
                  Text(
                    "creator",
                    style: TextStyle(color: label, fontSize: 14),
                  )
                ],
              )),
              const Icon(Icons.favorite)
            ],
          ),
          Container(
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
                    children: const [
                      Text(
                        "current",
                        style: TextStyle(color: label),
                      ),
                      Text(
                        "Rp. 5,000,00",
                        style: TextStyle(
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
          )
        ],
      ),
    );
  }
}
