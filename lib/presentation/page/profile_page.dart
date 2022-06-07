import 'package:flutter/material.dart';
import 'package:mythic_design/common/requeststate.dart';
import 'package:mythic_design/common/thema_app.dart';
import 'package:mythic_design/domain/enities/user.dart';
import 'package:mythic_design/presentation/provider/profile_nothifier.dart';
import 'package:mythic_design/presentation/widget/bottol_app.dart';
import 'package:provider/provider.dart';

import '../../common/size.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  static const String routeName = "/profile";

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    Future.microtask(() => context.read<ProfileNothifier>()..fecthUser());
    super.initState();
  }

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
          const SizedBox(
            width: defaultPading / 2,
          )
        ],
      ),
      body: Consumer<ProfileNothifier>(builder: (context, data, child) {
        if (data.nowUserState == RequestState.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (data.nowUserState == RequestState.loaded) {
          return _bodyProfile(data.user);
        } else {
          return Center(
            child: Text(data.message),
          );
        }
      }),
    );
  }

  ListView _bodyProfile(User user) {
    return ListView(
      children: [
        Stack(
          children: [
            Container(
              height: 200,
            ),
            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(user.backgroundImage))),
            ),
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    radius: 52,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 50,
                      backgroundImage: NetworkImage(user.image),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "${user.nameFist} ${user.nameLast}",
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: titleActive),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        user.id,
                        style: const TextStyle(fontSize: 13, color: label),
                      ),
                      const SizedBox(width: 4),
                      const Icon(
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
        bio(text: user.bio),
        const SizedBox(height: 12),
        myCollection(),
        const SizedBox(height: 12),
        myCoupon(),
        Center(
            child: Text(
          "Member since  ${user.creatAt}",
          style: const TextStyle(color: label, fontSize: 13),
        )),
        const SizedBox(height: 12),
        Container(
          height: 50,
          clipBehavior: Clip.hardEdge,
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
        ),
        const SizedBox(height: defaultPading * 3),
        const BottomApp(),
      ],
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

  Container bio({required String text}) {
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
          Text(
            text,
            style: const TextStyle(
              color: label,
              height: 1.3,
            ),
          )
        ],
      ),
    );
  }
}
