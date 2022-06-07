import 'package:flutter/material.dart';

import '../../common/size.dart';
import '../../common/thema_app.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  static const String route = "/search";

  @override
  Widget build(BuildContext context) {
  List<String> category = ["All Populer", "New", "High Price", "Low Price","Icon","Template"];
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
                        print("mulai $value");
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
              height: 50,
              padding: const EdgeInsets.symmetric(vertical: defaultPading / 2),
              child: TabBar(
                  onTap: (value) {
                    print(value);
                  },
                  indicator: const BoxDecoration(color: Colors.black),
                  isScrollable: true,
                  tabs: List.generate(
                      category.length,
                      (index) => Tab(
                            child: Text(category[index]),
                          )))),
          Expanded(
              child: TabBarView(
                  children: List.generate(
            category.length,
            (index) => GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 4, mainAxisSpacing: 4, crossAxisCount: 2),
                itemCount: 14,
                itemBuilder: (context, index) => Container(
                      color: Colors.amber,
                    )),
          )))
        ]))));
  }
}


