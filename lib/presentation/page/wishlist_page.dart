import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mythic_design/common/requeststate.dart';
import 'package:mythic_design/common/size.dart';
import 'package:mythic_design/domain/enities/wishlist.dart';
import 'package:mythic_design/presentation/provider/wishlist_nothifier.dart';
import 'package:provider/provider.dart';

import '../../common/thema_app.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({Key? key}) : super(key: key);

  static const String route = "/wishlist";

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  @override
  void initState() {
    Future.microtask(() => context.read<WishlistNothifier>()..getWishlist());
    super.initState();
  }

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
        title: const Text("Wishlist"),
      ),
      body: Consumer<WishlistNothifier>(builder: (context, data, _) {
        if (data.nowState == RequestState.loaded) {
          return _body(data.wishlist);
        } else if (data.nowState == RequestState.loading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Center(
            child: Text(data.message),
          );
        }
      }),
    );
  }

  ListView _body(List<Wishlist> data) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: 2,
    );
    return ListView.builder(
        padding: const EdgeInsets.only(bottom: 130),
        itemCount: data.length,
        itemBuilder: (context, index) =>
            Consumer<WishlistNothifier>(builder: (context, value, _) {
              return MaterialButton(
                padding: const EdgeInsets.all(coverPading),
                onPressed: () {
                  context.read<WishlistNothifier>().addSelect(data[index]);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: coverPading),
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage( "https://mythicserver.herokuapp.com/public/${data[index].image}"),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(4)),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data[index].title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.bold),
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
                          currencyFormatter
                              .format(int.parse(data[index].price)),
                          // data[index].price,
                          style:
                              const TextStyle(color: placeholder, fontSize: 12),
                        )
                      ],
                    ),
                    const Spacer(),
                    value.wishlistSelect.contains(data[index])
                        ? const Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          )
                        : const SizedBox()
                  ],
                ),
              );
            }));
  }

  Widget _floatingBottom() {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: 2,
    );
    return Consumer<WishlistNothifier>(builder: (context, data, _) {
      return Container(
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.symmetric(
            horizontal: defaultPading, vertical: defaultPading),
        height: 120,
        width: double.infinity,
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(children: [
              Text(
                "${context.read<WishlistNothifier>().wishlistSelect.length} items",
                style: const TextStyle(color: placeholder),
              ),
              const Spacer(),
              const Text("Select all", style: TextStyle(color: placeholder)),
              const SizedBox(width: 4),
              GestureDetector(
                onTap: () {
                  data.allSelect();
                },
                child: Icon(
                  data.all
                      ? Icons.check_box_rounded
                      : Icons.check_box_outline_blank_rounded,
                  color: data.all ? Colors.green : Colors.grey,
                ),
              )
            ]),
            const Divider(),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Total Price",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, color: label),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      currencyFormatter
                          .format(context.read<WishlistNothifier>().total),
                      style: const TextStyle(
                          color: body,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Spacer(),
                Expanded(
                  child: Container(
                    height: 35,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        gradient: const LinearGradient(
                            colors: [Color(0xff0038F5), Color(0xff9F03FF)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight)),
                    child: MaterialButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        data.checkout(context);
                      },
                      child: const Text(
                        "Checkout",
                        style: TextStyle(
                            color: offWhite,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
