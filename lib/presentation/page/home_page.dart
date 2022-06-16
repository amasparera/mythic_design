import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mythic_design/common/requeststate.dart';
import 'package:mythic_design/common/size.dart';
import 'package:mythic_design/common/thema_app.dart';
import 'package:mythic_design/presentation/page/notifikasi_page.dart';
import 'package:mythic_design/presentation/page/product_detail_page.dart';
import 'package:mythic_design/presentation/page/wishlist_page.dart';
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
    Future.microtask(() => context.read<HomeNotifier>()
      ..getProfileImage()
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
                        onPressed: () {
                          Navigator.pushNamed(context, NotifikasiPage.route);
                        },
                        icon: Image.asset(
                          "asset/icons/Notification.png",
                          width: 24,
                        )),
                    IconButton(
                        splashRadius: 20,
                        onPressed: () {
                          Navigator.pushNamed(context, WishlistPage.route);
                        },
                        icon: Image.asset(
                          "asset/icons/Cart.png",
                          width: 24,
                        )),
                    IconButton(
                        splashRadius: 20,
                        onPressed: () {
                          context.read<HomeNotifier>().goToProfile(context);
                        },
                        icon:  CircleAvatar(
                          backgroundColor: Colors.grey,
                          backgroundImage: context.read<HomeNotifier>().profilleImage!= null?  NetworkImage(
                              context.read<HomeNotifier>().profilleImage!) : null,
                          radius: 15,
                          child:context.read<HomeNotifier>().profilleImage== null? const Icon(Icons.person,color: Colors.white,) : null,
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
            GestureDetector(
              onTap: () {
                context.read<HomeNotifier>().goToSeach(context);
                // showSearch(context: context, delegate: CustomSearch());
              },
              child: Container(
                alignment: Alignment.center,
                height: 48,
                margin: const EdgeInsets.only(
                    top: coverPading * 2,
                    bottom: coverPading * 1.5,
                    left: defaultPading * 1.5,
                    right: defaultPading * 1.5),
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
                    Image.asset("asset/icons/Icon.png", width: 25),
                    const SizedBox(width: coverPading),
                    const Text(
                      "Search items, collections, and accounts",
                      style: TextStyle(color: placeholder, fontSize: 13),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
}
