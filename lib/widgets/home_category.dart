import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_task/const/AppColors.dart';

class CategoryItems extends StatefulWidget {
  const CategoryItems({Key? key}) : super(key: key);

  @override
  State<CategoryItems> createState() => _CategoryItemsState();
}

class _CategoryItemsState extends State<CategoryItems> {
  List<String> categories = [
    'Yamaha',
    'Royal En',
    'Hero',
    'TVS ',
    'Runner',
    'SmartPhone',
    'Laptop'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(

      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20,right: 20),
          child: Text("Categories",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),),
        ),
        SizedBox(
          height: 5.h,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 100.h,
                    child: ListView.builder(
                        itemCount: categories.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) {

                      return Card(
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Center(
                            child: Text(
                              categories[index],
                              style: TextStyle(
                                  fontSize: 16,
                                  //fontWeight: FontWeight.w600
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
