import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  var product;

  ProductDetails({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Column(
              children: [
                AspectRatio(
                  aspectRatio: 2.0,
                  child: CarouselSlider(
                    items: widget.product['product-image']
                        .map<Widget>((item) => Padding(
                              padding: EdgeInsets.only(left: 7, right: 7),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image: NetworkImage(item),
                                        fit: BoxFit.cover)),
                              ),
                            ))
                        .toList(),
                    options: CarouselOptions(
                        autoPlay: false,
                        enlargeCenterPage: true,
                        viewportFraction: 0.8,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                        onPageChanged: (val, carosuselPageChange) {
                          setState(() {
                            // _dotPosition = val;
                          });
                        }),
                  ),
                ),
              ],
            ),
            Text(
              widget.product['product-name'],
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Text(
                    "Description :",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    widget.product['product-description'],
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Text("Price : ",style: TextStyle(fontSize: 15,), ),
                  Text(
                    "\$",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(widget.product['product-price'].toString(),style: TextStyle(fontWeight: FontWeight.bold),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
