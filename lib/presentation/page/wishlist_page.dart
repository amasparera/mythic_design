import 'package:flutter/material.dart';
import 'package:mythic_design/common/size.dart';

import '../../common/thema_app.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({Key? key}) : super(key: key);

  static const String route = "/wishlist";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _floatingBottom(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        leading: IconButton(
          splashRadius: 20,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset(
            "asset/icons/Arrow_back.png",
            height: 18,
          ),
        ),
        title: const Text("Wishlist"),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.only(bottom: 130),
          itemCount: 15,
          itemBuilder: (context, index) => MaterialButton(
                padding: const EdgeInsets.all(coverPading),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: coverPading),
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: NetworkImage(
                                  "https://images.unsplash.com/photo-1654613044785-9c5e2d75dad6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(4)),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Daun Merah",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "commplete your payment",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                          style: TextStyle(color: placeholder, fontSize: 12),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Rp. 5.000.000,00",
                          style: TextStyle(color: placeholder, fontSize: 12),
                        )
                      ],
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    )
                  ],
                ),
              )),
    );
  }

  Container _floatingBottom() {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.symmetric(
          horizontal: defaultPading, vertical: defaultPading),
      height: 120,
      width: double.infinity,
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(children: const [
            Text(
              "15 items",
              style: TextStyle(color: placeholder),
            ),
            Spacer(),
            Text("Select all", style: TextStyle(color: placeholder)),
            SizedBox(width: 4),
            Icon(
              Icons.check_box_rounded,
              color: Colors.green,
            )
          ]),
          const Divider(),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Total Price",
                    style: TextStyle(fontWeight: FontWeight.bold, color: label),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Rp 3.000.000",
                    style: TextStyle(
                        color: body, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Spacer(),
              Expanded(
                child: Container(
                  height: 35,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: const LinearGradient(
                          colors: [Color(0xff0038F5), Color(0xff9F03FF)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight)),
                  child: MaterialButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    child: const Text(
                      "Checkout",
                      style: TextStyle(
                          color: offWhite,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
