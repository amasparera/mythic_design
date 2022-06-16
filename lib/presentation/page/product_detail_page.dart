import 'package:flutter/material.dart';
import 'package:mythic_design/common/size.dart';
import 'package:mythic_design/common/thema_app.dart';
import 'package:mythic_design/domain/enities/product.dart';
import 'package:mythic_design/presentation/page/profile_creator_page.dart';
import 'package:mythic_design/presentation/widget/animasi_fade_in.dart';
import 'package:provider/provider.dart';

import '../../common/requeststate.dart';
import '../provider/detail_product_nothifier.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  static const String route = "/detail-product";

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  void initState() {
    Future.microtask(
        () => context.read<ProductDetailNothifier>()..fechProductDetail());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundWhite,
      body: Consumer<ProductDetailNothifier>(builder: (context, data, child) {
        if (data.nowProductDetailState == RequestState.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (data.nowProductDetailState == RequestState.loaded) {
          return _body(product: data.product);
        } else {
          return Center(
            child: Text(data.message),
          );
        }
      }),
    );
  }

  ListView _body({required Product product}) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 32,
            left: defaultPading,
            right: defaultPading,
            bottom: 12,
          ),
          child: Text(
            product.productName,
            textAlign: TextAlign.center,
            style: const TextStyle(
                letterSpacing: 1,
                color: titleActive,
                fontSize: 32,
                fontWeight: FontWeight.bold),
          ),
        ),
        Column(
            children: List.generate(
                product.listMediaImage!.length,
                (index) => FadeIn(
                      delay: Duration(milliseconds: 300 * index),
                      child: Image.network(product.listMediaImage![index].image,
                          fit: BoxFit.fitWidth),
                    ))),
        FutureBuilder(
            future: Future.delayed(const Duration(seconds: 1)),
            builder: (context, state) {
              if (state.connectionState == ConnectionState.done) {
                return _delay(product: product);
              } else {
                return const SizedBox();
              }
            })
      ],
    );
  }

  Widget _delay({required Product product}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(defaultPading),
          child: Text(
            product.description!,
            style: const TextStyle(
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
                            borderRadius: BorderRadius.circular(defaultPading),
                            border: Border.all(color: placeholder)),
                        child: Text(
                          "#${tag[index]}",
                          style:
                              const TextStyle(color: placeholder, fontSize: 13),
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
              detailCover(
                  "asset/icons/favorite.png", product.totalFavorite.toString()),
              detailCover(
                  "asset/icons/terjual.png", product.totalBuy.toString()),
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
            children: [
              Expanded(
                child: Text(
                  product.productName,
                  style: const TextStyle(
                      letterSpacing: 1,
                      color: titleActive,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: defaultPading),
              const Icon(Icons.favorite_border_rounded)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPading),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(ProfileCreatorPage.route);
                },
                child: Container(
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
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          backgroundImage: NetworkImage(product.creatorImage),
                          radius: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: defaultPading),
                          child: Text(
                            product.creatorName,
                            style: const TextStyle(
                                color: body,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        )
                      ],
                    )),
              ),
              const Spacer(),
              Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      gradient: gradientButton,
                      borderRadius: BorderRadius.circular(50)),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
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
