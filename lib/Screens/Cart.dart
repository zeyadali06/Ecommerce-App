// ignore_for_file: file_names
import 'package:ecommerce_app/Global%20Variables/Global.dart';
import 'package:ecommerce_app/constant/constant.dart';
import 'package:ecommerce_app/logic/helper.dart';
import 'package:ecommerce_app/model/Product.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  int total = 0;
  @override
  Widget build(BuildContext context) {
    total = 0;
    for (Tuple2<int, Product> product in Global.cartProducts) {
      total += product.item1 * product.item2.price;
    }
    return Scaffold(
      backgroundColor: Global.dark ? BackgroundColorDark : BackgroundColorLight,
      appBar: AppBar(backgroundColor: Purple, title: const Text("Cart"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
            height: 15.0,
          ),
          itemCount: Global.cartProducts.length,
          itemBuilder: (context, index) => Dismissible(
            onDismissed: (direction) async {
              Global.cartProducts.removeAt(index);
              setState(() {});
            },
            key: UniqueKey(),
            background: Container(
              color: const Color.fromRGBO(189, 0, 0, 1.0),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Delete Product ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white)),
                  Icon(Icons.delete, color: Colors.white),
                ],
              ),
            ),
            child: Container(
              decoration: BoxDecoration(color: Global.dark ? Purple : const Color.fromRGBO(156, 156, 156, 100), borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${Global.cartProducts[index].item1}",
                      style: TextStyle(color: Global.dark ? FontColorDark : Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: FadeInImage.assetNetwork(
                          placeholder: "assets/images/a47aebcb-8131-42a4-bcb1-09ae5e04efeb.gif",
                          image: Global.cartProducts[index].item2.thumbnail,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        Global.cartProducts[index].item2.title,
                        style: TextStyle(color: Global.dark ? FontColorDark : Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.clip,
                      ),
                    ),
                    Text(
                      "${Global.cartProducts[index].item1 * Global.cartProducts[index].item2.price}\$",
                      style: TextStyle(color: Global.dark ? FontColorDark : Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Global.dark ? const Color.fromRGBO(66, 66, 66, 130) : Colors.grey.shade200,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ],
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(40),
            topLeft: Radius.circular(40),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width / 2,
                height: 50,
                child: Row(
                  children: [
                    Expanded(
                      child: FittedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: Text(
                            "Total : $total",
                            style: TextStyle(
                              color: Global.dark ? Colors.grey.shade200 : Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
                            softWrap: true,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Container(
                  height: 65,
                  width: double.infinity,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(color: Purple, borderRadius: BorderRadius.circular(20)),
                  child: MaterialButton(
                    onPressed: () {
                      showSnackBar(context, "Purshase complete");
                      Global.cartProducts.clear();
                      setState(() {});
                    },
                    child: Text("Purshase", style: TextStyle(fontSize: 20, color: Colors.grey.shade200)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
