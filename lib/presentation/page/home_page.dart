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
                          backgroundImage: NetworkImage(
                              "https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880"),
                          radius: 15,
                        )),
                    const SizedBox(
                      width: defaultPading / 4,
                    )
                  ],
                )
              ],
          body: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: 10 + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return coverHomeSearch(context);
                }

                return const CardHome();
              })),
    );
  }

  Container coverHomeSearch(BuildContext context) => Container(
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
              margin: const EdgeInsets.only(
                  top: coverPading * 2, bottom: coverPading * 1.5),
              width: MediaQuery.of(context).size.width * .88,
              padding: const EdgeInsets.all(defaultPading / 2.2),
              decoration: BoxDecoration(
                  color: inputBacgroud,
                  borderRadius: BorderRadius.circular(defaultPading)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("asset/icons/Icon.png", width: coverPading * 2.2),
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
                    width: 44,padding: EdgeInsets.all(10),
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
