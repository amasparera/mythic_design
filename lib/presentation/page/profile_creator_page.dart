import 'package:flutter/material.dart';
import 'package:mythic_design/presentation/widget/bottol_app.dart';

import '../../common/size.dart';
import '../../common/thema_app.dart';
import '../widget/wrap_sosial_media.dart';

class ProfileCreatorPage extends StatelessWidget {
  const ProfileCreatorPage({Key? key}) : super(key: key);

  static const String route = "/profile-creator";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        titleSpacing: defaultPading * 2 / 3,
        automaticallyImplyLeading: false,
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
              onPressed: () {},
              icon: const CircleAvatar(
                backgroundColor: Colors.grey,
                backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880"),
                radius: 15,
              )),
          const SizedBox(
            width: defaultPading / 4,
          )
        ],
      ),
      body: ListView(children: [
        Stack(
          children: [
            Container(
              height: 250,
            ),
            Container(
              height: 125,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://images.unsplash.com/photo-1654518999181-98bc88eb7ad1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80"))),
            ),
            SizedBox(
              height: 250,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 73),
                  const CircleAvatar(
                    radius: 52,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 50,
                      backgroundImage: NetworkImage(
                          "https://images.unsplash.com/photo-1654468087397-814085c7328c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Gabriel Madu",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: titleActive),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "phHodebnon&69Iob8Go0",
                        style: TextStyle(fontSize: 13, color: label),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.copy_rounded,
                        size: 16,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPading * 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "1",
                    style: TextStyle(
                        color: body, fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 2),
                  Text(
                    "Collected",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: label),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "2024",
                    style: TextStyle(
                        color: body, fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 2),
                  Text(
                    "Followes",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: label),
                  )
                ],
              ),
              Container(
                  padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                      gradient: gradientButton,
                      borderRadius: BorderRadius.circular(6)),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: defaultPading * 1.2, vertical: coverPading),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.5)),
                    child: Image.asset("asset/icons/Follow.png", width: 48),
                  ))
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(
              top: defaultPading * 2,
              left: defaultPading,
              bottom: defaultPading),
          child: Text(
            "Bio Creator",
            style: TextStyle(color: label, fontSize: 18),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPading),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.asset("asset/icons/google-maps 1.png", width: 16),
              const SizedBox(width: 4),
              const Text("Jakarta, Indonesia.")
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(
              top: defaultPading, left: defaultPading, right: defaultPading),
          child: Text(
            "Trevor Jackson is a multi-disciplinary artist exploring analog + digital realms since 1988. Collaborators inc Apple, BMW, Comme Des Garçons, ICA, NTS, Sonos,  Stone Island, Tate Modern + Warp.",
            style: TextStyle(fontSize: 13, height: 1.4, color: body),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(defaultPading),
          child: Text(
            "Member since 2021",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: label),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultPading),
          child: WrapSocialMedia(),
        ),
        const Padding(
          padding: EdgeInsets.all(defaultPading),
          child: Text(
            "Collection",
            style: TextStyle(
                fontSize: 18, color: label, fontWeight: FontWeight.bold),
          ),
        ),
        Wrap(
          children: List.generate(listimage.length, (index) {
            return GestureDetector(
              onTap: () {},
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.width / 2,
                child: Image.network(
                  listimage[index],
                  fit: BoxFit.cover,
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: defaultPading * 4),
        const BottomApp(),
      ]),
    );
  }
}

var listimage = <String>[
  "https://images.unsplash.com/photo-1644982654072-0b42e6636821?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
  "https://images.unsplash.com/photo-1649859398021-afbfe80e83b9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
  "https://images.unsplash.com/photo-1649859394614-dc4f7290b7f2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
  "https://images.unsplash.com/photo-1649859395314-bdea587e4524?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
  "https://images.unsplash.com/photo-1649859398731-d3c4ebca53fc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
  "https://images.unsplash.com/photo-1649859394657-8762d8a4758a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=952&q=80",
  "https://images.unsplash.com/photo-1649859397840-e90c65756084?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1051&q=80",
  "https://images.unsplash.com/photo-1649859397268-251f729c4e09?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
  "https://images.unsplash.com/photo-1649859396073-13ff3244ec1d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
  "https://images.unsplash.com/photo-1644982653424-1bfed7f972a2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1089&q=80"
];
