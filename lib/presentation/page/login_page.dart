import 'package:flutter/material.dart';
import 'package:mythic_design/common/size.dart';
import 'package:mythic_design/presentation/provider/login_nothifier.dart';
import 'package:provider/provider.dart';

import '../../common/thema_app.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const String route = "/login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
              width: 350,
              alignment: Alignment.topRight,
              child: Image.asset("asset/icons/login image .png")),
          // _bodyLogin(),
          Consumer<LoginNothifier>(builder: (context, data, child) {
            return data.isLogin ? _bodyLogin(context) : _bodySingUp(context);
          })
        ],
      )),
    );
  }

  Widget _bodySingUp(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: defaultPading),
      children: [
        const Padding(
          padding: EdgeInsets.only(
              left: defaultPading * 1.5, top: defaultPading * 2),
          child: Text(
            "SingUp",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * .3),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: defaultPading),
          child: Text(
            "Enter your details",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        TextFormField(
          decoration: InputDecoration(
              hintText: "Name",
              hintStyle: const TextStyle(
                  color: placeholder, fontWeight: FontWeight.bold),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide.none),
              fillColor: inputBacgroud,
              filled: true),
        ),
        const SizedBox(height: defaultPading),
        TextFormField(
          decoration: InputDecoration(
              hintText: "Email",
              hintStyle: const TextStyle(
                  color: placeholder, fontWeight: FontWeight.bold),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide.none),
              fillColor: inputBacgroud,
              filled: true),
        ),
        const SizedBox(height: defaultPading),
        TextFormField(
          decoration: InputDecoration(
              hintText: "Password",
              hintStyle: const TextStyle(
                  color: placeholder, fontWeight: FontWeight.bold),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide.none),
              fillColor: inputBacgroud,
              filled: true),
        ),
        Container(
          width: double.infinity,
          height: 50,
          clipBehavior: Clip.hardEdge,
          margin: const EdgeInsets.symmetric(
              horizontal: defaultPading, vertical: defaultPading * 2),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: const LinearGradient(
                  colors: [Color(0xff0038F5), Color(0xff9F03FF)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
          child: MaterialButton(
            onPressed: () {},
            child: const Text(
              "SingUp",
              style: TextStyle(
                  color: offWhite, fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "do you already have an account?",
              style: TextStyle(fontWeight: FontWeight.bold, color: label),
            ),
            GestureDetector(
              onTap: () {
                context.read<LoginNothifier>().swipLogin();
              },
              child: const Text(
                " Login",
                style: TextStyle(
                    fontSize: 15,
                    color: Color(0xff31A8FF),
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        const SizedBox(height: defaultPading * 2)
      ],
    );
  }
}

Widget _bodyLogin(BuildContext context) {
  return ListView(
    padding: const EdgeInsets.symmetric(horizontal: defaultPading),
    children: [
      const Padding(
        padding:
            EdgeInsets.only(left: defaultPading * 1.5, top: defaultPading * 2),
        child: Text(
          "Login",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
        ),
      ),
      SizedBox(height: MediaQuery.of(context).size.height * .35),
      const Padding(
        padding: EdgeInsets.symmetric(vertical: defaultPading),
        child: Text(
          "Enter your details",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      TextFormField(
        decoration: InputDecoration(
            hintText: "Email",
            hintStyle: const TextStyle(
                color: placeholder, fontWeight: FontWeight.bold),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide.none),
            fillColor: inputBacgroud,
            filled: true),
      ),
      const SizedBox(height: defaultPading),
      TextFormField(
        decoration: InputDecoration(
            hintText: "Password",
            hintStyle: const TextStyle(
                color: placeholder, fontWeight: FontWeight.bold),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide.none),
            fillColor: inputBacgroud,
            filled: true),
      ),
      Container(
        width: double.infinity,
        height: 50,
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.symmetric(
            horizontal: defaultPading, vertical: defaultPading * 2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: const LinearGradient(
                colors: [Color(0xff0038F5), Color(0xff9F03FF)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: MaterialButton(
          onPressed: () {},
          child: const Text(
            "Login",
            style: TextStyle(
                color: offWhite, fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "do you not have an account?",
            style: TextStyle(fontWeight: FontWeight.bold, color: label),
          ),
          GestureDetector(
            onTap: () {
              context.read<LoginNothifier>().swipLogin();
            },
            child: const Text(
              " SingUp",
              style: TextStyle(
                  fontSize: 15,
                  color: Color(0xff31A8FF),
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
      const SizedBox(height: defaultPading * 2)
    ],
  );
}
