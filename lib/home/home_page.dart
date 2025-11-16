import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:healthcare/categories/category_list_page.dart';
import 'package:healthcare/home/detail_page.dart';
import 'package:healthcare/home/home_controler.dart';
import 'package:healthcare/model/categories_model.dart';
import 'package:healthcare/model/professional_model.dart';
import 'package:healthcare/utils/color_util.dart';
import 'package:healthcare/utils/text_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true;
  final List<catgmodel> userCatgList = [];
  final List<profList> userProfList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loaddata();
    loaddata2();
  }

  loaddata() {
    isLoading = true;
    for (var List in catgList) {
      userCatgList.add(catgmodel.fromJson(List));
    }
    isLoading = false;
    setState(() {});
  }

  loaddata2() {
    isLoading = true;
    for (var item in dummyData) {
      userProfList.add(profList.fromJson(item));
    }
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Column(
          children: [
            Text("Good Morning", style: AppTextStyles.subHeadingTextStyle4),
            Text("John Doe", style: AppTextStyles.subHeadingTextStyle2),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.location_on_outlined)),
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications_none)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 20, right: 5, left: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                color: AppColors.background,
              ),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Search for services..",
                      prefixIcon: Icon(Icons.search),
                      hintStyle: AppTextStyles.subHeadingTextStyle,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Categories", style: AppTextStyles.headingTextStyle),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "See All",
                          style: AppTextStyles.headingTextStyle2,
                        ),
                      ),
                    ],
                  ),
        
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // 3 by 3 grid
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: catgList.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
        
                    itemBuilder: (context, index) {
                      final item = userCatgList[index];
        
                      return InkWell(
                        onTap: () {
                          switch (index) {
                            case 0:
                              Get.to(
                                () => CategoryListPage(categoryName: "Doctor"),
                              );
        
                              break;
                            case 1:
                              Get.to(
                                () => CategoryListPage(categoryName: "salon"),
                              );
        
                              break;
                            case 2:
                              Get.to(
                                () => CategoryListPage(categoryName: "spa"),
                              );
        
                              break;
                            case 3:
                              Get.to(
                                () =>
                                    CategoryListPage(categoryName: "Therapist"),
                              );
        
                              break;
                            case 4:
                              Get.to(
                                () => CategoryListPage(categoryName: "Dentist"),
                              );
        
                              break;
                            default:
                              Get.to(
                                () => CategoryListPage(categoryName: "Yoga"),
                              );
                          }
                        },
                        child: Categories(item),
                      );
                    },
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Featured Professionals",style: AppTextStyles.headingTextStyle,),
                      TextButton(onPressed: () {}, child: Text("See All",style: TextStyle(color: Colors.blue),)),
                    ],
                  ),
                  ListView.separated(
                    itemBuilder: (context, index) {
                      final item = userProfList[index];
                      return usersProfdata(item);
                    },
                    separatorBuilder: (context, index) => SizedBox(),
                    itemCount: dummyData.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget Categories(data) {
    return Card(
      margin: EdgeInsets.all(10),

      child: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              CircleAvatar(backgroundImage: AssetImage(data.image ?? '')),
              // Icon(IconData(int.parse(data.icon ?? '0xf041'), fontFamily: 'MaterialIcons')),
              Text(data.name ?? "", maxLines: 1),
            ],
          ),
        ),
      ),
    );
  }

  Widget usersProfdata(data) {
    return InkWell(
      onTap: () {
        Get.to(DetailPage(user: data, index: data));
      },
      child: ListTile(
        leading: Container(width: Get.width*0.2,
        height: Get.height*0.1,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color: Colors.amber),
          child: Image.asset(data.image ?? '',fit: BoxFit.fill,),
        ),
        title: Text(data.tittle ?? ""),
        subtitle: Column(
          children: [
            Text(data.subtittle ?? ''),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber),
                Text(data.rating ?? ''),SizedBox(width: 10,),
                Text(("(${data.ratinguser ?? ''})")),
                SizedBox(width: 10,),

                Icon(Icons.electric_bolt),
                Text(data.exp ?? ''),
              ],
            ),
          ],
        ),

        trailing: Column(
          children: [Text(data.price ?? ''), Text(data.session ?? '')],
        ),
      ),
    );
  }
}
