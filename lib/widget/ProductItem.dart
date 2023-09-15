// ignore_for_file: file_names
import 'package:ecommerce_app/Global%20Variables/Global.dart';
import 'package:ecommerce_app/constant/constant.dart';
import 'package:ecommerce_app/model/Product.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String title;
    product.title.length > 16 ? title = "${product.title.substring(0, 14)}.." : title = product.title;

    return Container(
      height: 280,
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Global.dark ? Purple : const Color.fromRGBO(156, 156, 156, 100),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 5),

          //image with header and foter
          SizedBox(
            height: 170,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: GridTile(
                header: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 45,
                      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(189, 0, 0, 1.0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "-${product.discountPercentage}%",
                          style: const TextStyle(color: FontColorDark, fontSize: 15),
                        ),
                      ),
                    ),
                  ],
                ),
                footer: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 65,
                      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Global.dark ? const Color.fromRGBO(225, 232, 235, 15) : const Color.fromRGBO(227, 227, 227, 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${product.rating}", style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                          const Icon(Icons.star, color: Color.fromRGBO(255, 193, 7, 1)),
                        ],
                      ),
                    )
                  ],
                ),
                child: FadeInImage.assetNetwork(
                  placeholder: "assets/images/a47aebcb-8131-42a4-bcb1-09ae5e04efeb.gif",
                  image: product.thumbnail,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),

          Text(title, style: TextStyle(color: Global.dark ? FontColorDark : Colors.black, fontSize: 20, fontWeight: FontWeight.bold), softWrap: false, overflow: TextOverflow.clip),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${product.price}\$", style: TextStyle(color: Global.dark ? FontColorDark : Colors.black, fontSize: 20)),
            ],
          )
        ],
      ),
    );
  }
}
