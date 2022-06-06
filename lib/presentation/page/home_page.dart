import 'package:flutter/material.dart';
import 'package:mythic_design/common/requeststate.dart';
import 'package:mythic_design/common/size.dart';
import 'package:mythic_design/common/thema_app.dart';
import 'package:mythic_design/presentation/page/product_detail_page.dart';
import 'package:provider/provider.dart';

import '../provider/home_nothifier.dart';
import '../widget/card_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String route = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Future.microtask(() => Provider.of<HomeNotifier>(context, listen: false)
      ..getLogin()
      ..getListFavorite()
      ..fechProduct());
    super.initState();
  }

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
                        splashRadius: 20,
                        onPressed: () {},
                        icon: Image.asset(
                          "asset/icons/Notification.png",
                          width: 24,
                        )),
                    IconButton(
                        splashRadius: 20,
                        onPressed: () {},
                        icon: Image.asset(
                          "asset/icons/Cart.png",
                          width: 24,
                        )),
                    IconButton(
                        splashRadius: 20,
                        onPressed: () {
                          Provider.of<HomeNotifier>(context, listen: false)
                              .goToProfile(context);
                        },
                        icon: const CircleAvatar(backgroundColor: Colors.grey,
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
          body: Consumer<HomeNotifier>(builder: (context, data, child) {
            if (data.nowPlayingState == RequestState.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (data.nowPlayingState == RequestState.loaded) {
              return ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: data.listProducts.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return coverHomeSearch(context);
                    }
                    return CardHome(
                      onTap: () =>
                          Navigator.pushNamed(context, ProductDetailPage.route),
                      product: data.listProducts[index - 1],
                      statusFavorite: data.listFavorite
                          .contains(data.listProducts[index - 1].productId),
                    );
                  });
            } else {
              return Center(child: Text(data.message));
            }
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
              padding: const EdgeInsets.symmetric(
                  horizontal: defaultPading / 2.2,
                  vertical: defaultPading / 2.5),
              decoration: BoxDecoration(
                  color: inputBacgroud,
                  borderRadius: BorderRadius.circular(defaultPading)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("asset/icons/Icon.png", width: coverPading * 2.1),
                  const SizedBox(width: coverPading),
                  const Text(
                    "Search items, collections, and accounts",
                    style: TextStyle(color: placeholder, fontSize: 13),
                  )
                ],
              ),
            )
          ],
        ),
      );
}
