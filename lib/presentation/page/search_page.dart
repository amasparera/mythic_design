import 'package:flutter/material.dart';
import 'package:mythic_design/presentation/widget/animasi_fade_in.dart';

import '../../common/size.dart';
import '../../common/thema_app.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  static const String route = "/search";

  @override
  Widget build(BuildContext context) {
    List<String> category = [
      "All Populer",
      "New",
      "High Price",
      "Low Price",
      "Icon",
      "Template"
    ];
    return DefaultTabController(
        length: category.length,
        child: Scaffold(
            body: SafeArea(
                child: Column(children: [
          Container(
            height: 48,
            margin: const EdgeInsets.only(
                top: coverPading * 2,
                bottom: coverPading * 1.5,
                left: defaultPading,
                right: defaultPading),
            // width: MediaQuery.of(context).size.width * .88,
            padding: const EdgeInsets.symmetric(
                horizontal: defaultPading, vertical: defaultPading / 2.5),
            decoration: BoxDecoration(
                color: inputBacgroud,
                borderRadius: BorderRadius.circular(defaultPading)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("asset/icons/Icon.png", width: 25),
                const SizedBox(width: coverPading),
                Expanded(
                  child: TextField(
                      onChanged: (value) {
                        // print("mulai $value");
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search items, collections, and accounts",
                        hintStyle: TextStyle(
                            color: placeholder, fontSize: 14, height: 1.2),
                      )),
                )
              ],
            ),
          ),
          Container(
              alignment: Alignment.centerLeft,
              height: 40,
              margin: const EdgeInsets.symmetric(horizontal: defaultPading),
              padding: const EdgeInsets.symmetric(vertical: defaultPading / 2),
              child: TabBar(
                  indicatorPadding: const EdgeInsets.symmetric(horizontal: 4),
                  onTap: (value) {
                    // print(value);
                  },
                  indicator: BoxDecoration(
                      // color: Colors.black,
                      gradient: gradientButton,
                      borderRadius: BorderRadius.circular(20)),
                  isScrollable: true,
                  splashBorderRadius: BorderRadius.circular(20),
                  unselectedLabelStyle: const TextStyle(
                      color: label, fontWeight: FontWeight.bold),
                  unselectedLabelColor: label,
                  tabs: List.generate(
                      category.length,
                      (index) => Tab(
                            text: category[index],
                          )))),
          Expanded(
              child: TabBarView(
                  children: List.generate(
            category.length,
            (index) => GridView.builder(
                padding: const EdgeInsets.symmetric(
                    horizontal: 4, vertical: defaultPading),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 4, mainAxisSpacing: 4, crossAxisCount: 2),
                itemCount: 13,
                itemBuilder: (context, index) => FadeIn(
                      delay: Duration(milliseconds: 100 * index),
                      child: Container(
                        color: Colors.amber,
                      ),
                    )),
          )))
        ]))));
  }
}
