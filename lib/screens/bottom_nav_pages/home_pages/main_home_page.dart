import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_task/screens/bottom_nav_pages/productDetails.dart';
import 'package:interview_task/widgets/searching_widgets.dart';

import '../../../widgets/home_category.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  var _dotPosition = 0;

  TextEditingController _searchController = TextEditingController();

  List<String> _carouselImages = [];
  List _products = [];
  var _firestoreInstance = FirebaseFirestore.instance;

  fetchCarouselImages() async {
    // var _firestoreInstance = FirebaseFirestore.instance;
    QuerySnapshot qn =
        await _firestoreInstance.collection("carousel_image").get();

    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        _carouselImages.add(
          qn.docs[i]["img"],
        );
        print(qn.docs[i]["img"]);
      }
    });
    return qn.docs;
  }

  fetchProducts() async {
    QuerySnapshot qn = await _firestoreInstance.collection("products").get();

    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        _products.add({
          "product-name": qn.docs[i]["product-name"],
          "product-description": qn.docs[i]["product-description"],
          "product-price": qn.docs[i]["product-price"],
          "product-image": qn.docs[i]["product-img"],
        });
        //print(qn.docs[i]["img"]);
      }
    });
    return qn.docs;
  }

  @override
  void initState() {
    fetchCarouselImages();
    fetchProducts();
    super.initState();
//
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //searching bar
            Searching(),
            SizedBox(
              height: 8.h,
            ),
            //carousal
            Column(
              children: [
                AspectRatio(
                  aspectRatio: 2.0,
                  child: CarouselSlider(
                    items: _carouselImages
                        .map((item) => Padding(
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
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 2),
                        enlargeCenterPage: true,
                        viewportFraction: 0.8,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                        onPageChanged: (val, carosuselPageChange) {
                          setState(() {
                            _dotPosition = val;
                          });
                        }),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DotsIndicator(
                  dotsCount:
                      _carouselImages.length == 0 ? 1 : _carouselImages.length,
                  position: _dotPosition.toDouble(),
                  decorator: DotsDecorator(
                      color: Colors.deepOrange.withOpacity(0.5),
                      activeColor: Colors.deepOrange,
                      spacing: EdgeInsets.all(2),
                      activeSize: Size(8, 8),
                      size: Size(6, 6)),
                ),
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            //CategoryItems
            CategoryItems(),
            SizedBox(
              height: 6.h,
            ),
            //New Collections
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Text(
                " New Collections",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 6.h,
            ),
            Container(
              height: 200,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1),
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>ProductDetails(product: _products[index],))),
                    child: Card(
                      elevation: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AspectRatio(
                              aspectRatio: 2,
                              child: Image.network(
                                _products[index]["product-image"][0],
                                fit: BoxFit.cover,
                              )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${_products[index]["product-name"]}",
                                style: TextStyle(fontSize: 15),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color:
                                        Colors.deepOrangeAccent.withOpacity(0.5),
                                    size: 15,
                                  ),
                                  Text("3.5"),
                                  Icon(
                                    Icons.bookmark_border,
                                    size: 18,
                                  )
                                ],
                              )
                            ],
                          ),

                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Icon(Icons.place,size: 14,),
                              Text("Dhanmondi" , style: TextStyle(color: Colors.grey),)
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Text("\$" ,style: TextStyle(
                                fontWeight: FontWeight.bold
                              ),),
                              Text(" ${_products[index]["product-price"].toString()}",style: TextStyle(
                                  fontWeight: FontWeight.bold
                              ),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

/*  Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 100.h,
                    child: ListView.builder(
                        itemCount: _products.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) {

                          return Card(
                            elevation: 3,
                            child: Column(
                              children: [
                                AspectRatio(aspectRatio: 2,child: Image.network(_products[index]["product-image"][0])),
                                Text("${_products[index]["product-name"]}"),
                                Text("${_products[index]["product-price"].toString()}"),
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),*/
