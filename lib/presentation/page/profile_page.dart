import 'package:flutter/material.dart';
import 'package:mythic_design/common/thema_app.dart';

import '../../common/size.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  static const String routeName = "/profile";

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
          // IconButton(
          //     splashRadius: 20,
          //     onPressed: () {
          //       Navigator.pushNamed(context, ProfilePage.routeName);
          //     },
          //     icon: const CircleAvatar(
          //       backgroundImage: NetworkImage(
          //           "https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880"),
          //       radius: 15,
          //     )),
          const SizedBox(
            width: defaultPading / 2,
          )
        ],
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: 200,
              ),
              Container(
                height: 100,
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://images.unsplash.com/photo-1644982647531-daff2c7383f3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80"))),
              ),
              SizedBox(
                height: 200,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const CircleAvatar(
                      radius: 52,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                            "https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880"),
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "Gift Habeshaw",
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
                          "52fs5ge5g45sov45a",
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
          bio(),
          const SizedBox(height: 12),
          myCollection(),
          const SizedBox(height: 12),
          myCoupon(),
          const Center(
              child: Text(
            "Member since  2021",
            style: TextStyle(color: label, fontSize: 13),
          )),
          const SizedBox(height: 12),
          Container(
            height: 50,
            margin: const EdgeInsets.all(24),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: const LinearGradient(
                    colors: [Color(0xff0038F5), Color(0xff9F03FF)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)),
            child: MaterialButton(
              onPressed: () {},
              child: const Text(
                "Log Out",
                style: TextStyle(
                    color: offWhite, fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget myCollection() {
    return Column(
      children: [
        const Text(
          "Your collection.",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: titleActive, fontSize: 20),
        ),
        Container(
          height: 80,
          width: double.infinity,
          color: inputBacgroud,
          margin: const EdgeInsets.symmetric(
              horizontal: defaultPading, vertical: defaultPading / 2),
          padding: const EdgeInsets.all(12),
          alignment: Alignment.center,
          child: const Text(
            "Start buy your collection artwork",
            style: TextStyle(color: label),
          ),
        )
      ],
    );
  }

  Widget myCoupon() {
    return Column(
      children: [
        const Text(
          "Your coupon.",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: titleActive, fontSize: 20),
        ),
        Container(
          height: 80,
          width: double.infinity,
          color: inputBacgroud,
          margin: const EdgeInsets.symmetric(
              horizontal: defaultPading, vertical: defaultPading / 2),
          padding: const EdgeInsets.all(12),
          alignment: Alignment.center,
          child: const Text(
            "Your Coupon is empty.",
            style: TextStyle(color: label),
          ),
        )
      ],
    );
  }

  Container bio() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: const Color(0xff000000).withOpacity(.05),
                blurRadius: 4,
                offset: const Offset(0, 2))
          ]),
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
      margin: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                "Bio",
                style: TextStyle(
                  fontSize: 18,
                  color: body,
                ),
              ),
              const Spacer(),
              Image.asset(
                "asset/icons/Settings.png",
                width: 20,
              )
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            "Graphics designer and Logo maker. \nWEBSITE LOGO. TSHIRT DESIGN \nANIMATION BRANDING CARTOON DESIGN \nDM  us to get the best customized \ndesign \nwww.tusharinnovation.com",
            style: TextStyle(
              color: label,
              height: 1.3,
            ),
          )
        ],
      ),
    );
  }
}
