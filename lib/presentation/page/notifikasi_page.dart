import 'package:flutter/material.dart';
import 'package:mythic_design/common/size.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../common/thema_app.dart';

class NotifikasiPage extends StatelessWidget {
  const NotifikasiPage({Key? key}) : super(key: key);

  static const String route = "/notifikasi";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _floatingBottom(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        leading: IconButton(
          splashRadius: 20,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset(
            "asset/icons/Arrow_back.png",
            height: 18,
          ),
        ),
        title: const Text("Notification"),
      ),
      body: ListView.builder(
          // padding: const EdgeInsets.all(defaultPading),
          itemCount: 5,
          itemBuilder: (context, index) => MaterialButton(
                padding: EdgeInsets.all(coverPading),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: coverPading),
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: NetworkImage(
                                  "https://images.unsplash.com/photo-1654613044785-9c5e2d75dad6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(4)),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Daun Merah",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          "commplete your payment",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                          style: TextStyle(color: placeholder, fontSize: 12),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          timeago.format(DateTime.now()
                              .subtract(const Duration(minutes: 15))),
                          style: const TextStyle(
                              color: placeholder, fontSize: 12),
                        )
                      ],
                    )
                  ],
                ),
              )),
    );
  }

  Container _floatingBottom() {
    return Container(
      width: double.infinity,
      height: 45,
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.symmetric(
          horizontal: defaultPading * 4, vertical: defaultPading * 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: const LinearGradient(
              colors: [Color(0xff0038F5), Color(0xff9F03FF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)),
      child: MaterialButton(
        onPressed: () {},
        child: const Text(
          "Clear All",
          style: TextStyle(
              color: offWhite, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }
}
