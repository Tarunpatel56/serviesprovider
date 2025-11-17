import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/categories/categorie_controller.dart';
import 'package:healthcare/categories/categorie_detail_page.dart';
import 'package:healthcare/categories/categorie_model.dart';
import 'package:healthcare/home/detail_page.dart';
import 'package:healthcare/utils/color_util.dart';

class CategoryListPage extends StatelessWidget {

  final String categoryName; 
  CategoryListPage({super.key, required this.categoryName, });


  final CategorieController ctrl = Get.put(CategorieController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Column(
          children: [
    
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              height: Get.height * 0.1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(30),
                ),
                color: AppColors.primary,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${_capitalize(categoryName)} Services",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),hintText: "Search for service...",prefixIcon: Icon(Icons.search)),),
            ),


            Obx(() {
              final List<CategorieModel> list = _getList(categoryName);

              return Expanded(
                child: list.isEmpty
                    ? Center(
                        child: Text(
                          "No items found",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      )
                    : ListView.separated(
                        padding: EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 12,
                        ),
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          return _serviceTile(list[index]);
                        },
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 10),
                      ),
              );
            }),
          ],
        ),
      ),
    );
  }


  List<CategorieModel> _getList(String name) {
    switch (name.toLowerCase()) {
      case "doctor":
        return ctrl.drList;
            case "salon":
        return ctrl.salonList;


      case "spa":
        return ctrl.spaList;
      case "therapist":
        return ctrl.therapistList;
      case "dentist":
        return ctrl.dentistList;
      case "yoga":
        return ctrl.yogaList;
      default:
        return [];
    }
  }


  String _capitalize(String s) =>
      s.isEmpty ? s : s[0].toUpperCase() + s.substring(1).toLowerCase();


  Widget _serviceTile( data) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        onTap: () {
           Get.to(CategorieDetailPage( index: data, user1: data,));
   
        },
        contentPadding: EdgeInsets.all(12),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: 50,
            height: 50,
            color: Colors.grey[200],
            child: (data.image != null && data.image!.trim().isNotEmpty)
                ? Image.asset(
                    data.image!,
                    height: Get.height*0.8,
                    width: Get.width*02,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(Icons.broken_image, size: 28);
                    },
                  )
                : Icon(Icons.person, size: 28),
          ),
        ),
        title: Text(
          data.tittle ?? "",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(data.subtittle ?? ""),
            SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 16),
                SizedBox(width: 4),
                Text(data.rating ?? ""),
                SizedBox(width: 8),
                Text("(${data.ratinguser ?? ''})"),
                SizedBox(width: 10),
                Icon(Icons.electric_bolt, size: 16),
                SizedBox(width: 6),
                Text(data.exp ?? ''),
              ],
            ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "₹${data.price ?? ""}",
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
            ),
            SizedBox(height: 5),
            Text(data.session ?? "",style: TextStyle(fontSize: 14),),
          ],
        ),
      ),
    );
  }
}
