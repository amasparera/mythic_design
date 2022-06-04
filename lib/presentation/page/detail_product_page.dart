import 'package:flutter/material.dart';
import 'package:mythic_design/common/size.dart';
import 'package:mythic_design/common/thema_app.dart';


class DetailProductPage extends StatelessWidget {
  const DetailProductPage({Key? key}) : super(key: key);

  static const String route = "/detail-product";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundWhite,
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.only(
              top: 32,
              left: defaultPading,
              right: defaultPading,
              bottom: 12,
            ),
            child: Text(
              "Mirror ogiabsd iADSBH fsid hvsio dhfgo sho fsohjdi9s jdj pojfsp ojd",
              textAlign: TextAlign.center,
              style: TextStyle(
                  letterSpacing: 1,
                  color: titleActive,
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Column(
              children: List.generate(
                  images.length,
                  (index) =>
                      Image.network(images[index], fit: BoxFit.fitWidth))),
          const Padding(
            padding: EdgeInsets.all(defaultPading),
            child: Text(
              "Together with my design team, we designed this futuristic Cyberyacht concept artwork. We wanted to create something that has not been created yet, so we started to collect ideas of how we imagine the Cyberyacht could look like in the future.",
              style: TextStyle(
                color: label,
                fontSize: 13,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPading),
            child: Wrap(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      tag.length,
                      (index) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 3),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 8),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(defaultPading),
                              border: Border.all(color: placeholder)),
                          child: Text(
                            "#${tag[index]}",
                            style: const TextStyle(
                                color: placeholder, fontSize: 13),
                          ))),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                detailCover("asset/icons/favorite.png", "578"),
                detailCover("asset/icons/terjual.png", "578"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: defaultPading * 2,
                left: defaultPading,
                right: defaultPading,
                bottom: defaultPading),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Expanded(
                  child: Text(
                    "Mirror ogiabsd ",
                    style: TextStyle(
                        letterSpacing: 1,
                        color: titleActive,
                        fontSize: 32,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: defaultPading),
                Icon(Icons.favorite_border_rounded)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPading),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    padding: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: const Color(0x0ff00000).withOpacity(.029),
                              blurRadius: 13.27,
                              offset: const Offset(0, 10.14))
                        ],
                        color: offWhite,
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      children: const [
                        CircleAvatar(
                          radius: 16,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: defaultPading),
                          child: Text(
                            "@openart",
                            style: TextStyle(
                                color: body,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        )
                      ],
                    )),
                const Spacer(),
                Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        gradient: gradientButton,
                        borderRadius: BorderRadius.circular(50)),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)),
                      child: Image.asset("asset/icons/Follow.png", width: 32),
                    ))
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
                horizontal: defaultPading, vertical: defaultPading * 2),
            // child: const BuyCurrent(),
          ),
        ],
      ),
    );
  }

  Padding detailCover(String image, String total) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        children: [
          Image.asset(
            image,
            width: 20,
          ),
          const SizedBox(width: 4),
          Text(total),
        ],
      ),
    );
  }
}

List images = [
  "https://images.unsplash.com/photo-1653578705644-3672f965f009?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=749&q=80",
  "https://images.unsplash.com/photo-1653919695043-d8ad76914e99?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
  "https://images.unsplash.com/photo-1653909067182-c06ac034c715?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1427&q=80"
];
List tag = ["black", "art", "color", "circle"];
