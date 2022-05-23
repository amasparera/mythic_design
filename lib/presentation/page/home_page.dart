import 'package:flutter/material.dart';
import 'package:mythic_design/common/size.dart';
import 'package:mythic_design/common/thema_app.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const route = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverAppBar(
                  elevation: 0,
                  titleSpacing: defaultPading * 2 / 3,
                  automaticallyImplyLeading: false,
                  floating: true,
                  // snap: true,
                  title: Image.asset(
                    "asset/logo/Logo.png",
                    width: 150,
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
                        icon: const CircleAvatar(
                          radius: 15,
                        )),
                    const SizedBox(
                      width: defaultPading / 4,
                    )
                  ],
                  // bottom: PreferredSize(
                  //   preferredSize: Size(double.infinity, 200),
                  //   child: Container(),
                  // ),
                )
              ],
          body: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: 100,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return coverHomeSearch(context);
                }

                return ListTile(
                  title: Text("$index"),
                );
              })),
    );
  }

  Container coverHomeSearch(BuildContext context) => Container(
        height: 180,
        color: offWhite,
        child: Column(
          children: [
            const SizedBox(height: coverPading * 2),
            const Text(
              "Discover, Collect, And Seller",
              style: TextStyle(
                  color: label, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: coverPading),
            const Text(
              "Digital Design",
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: titleActive),
            ),
            Container(
              height: 48,
              margin: const EdgeInsets.only(top: coverPading * 2),
              width: MediaQuery.of(context).size.width * .88,
              padding: const EdgeInsets.all(defaultPading / 2.2),
              decoration: BoxDecoration(
                  color: inputBacgroud,
                  borderRadius: BorderRadius.circular(defaultPading)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("asset/logo/Icon.png", width: coverPading * 2.2),
                  const SizedBox(width: coverPading),
                  const Text(
                    "Search items, collections, and accounts",
                    style: TextStyle(color: placeholder),
                  )
                ],
              ),
            )
          ],
        ),
      );
}
