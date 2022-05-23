import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const route = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverAppBar(
                  titleSpacing: 12,
                  automaticallyImplyLeading: false,
                  floating: true,
                  title: Image.asset(
                    "asset/logo/Logo.png",
                    width: 120,
                  ),
                  actions: [
                    IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          "asset/icons/Notification.png",
                          width: 24,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          "asset/icons/Cart.png",
                          width: 24,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const CircleAvatar(radius: 15,))
                  ],
                )
              ],
          body: Container()),
    );
  }
}
