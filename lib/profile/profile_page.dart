import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/login/login_page.dart';
import 'package:healthcare/profile/profile_model.dart';
import 'package:healthcare/utils/color_util.dart';
import 'package:healthcare/utils/text_utils.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isLoading = false;

  // final List<profilemodel> userProfileModel = [];
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   loaddata();
  // }

  // loaddata() {
  //   isLoading = true;
  //   for (var List in profileList) {
  //     userProfileModel.add(profilemodel.fromJson(List));
  //   }
  //   isLoading = false;
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Profile & Settings",
                    style: AppTextStyles.subHeadingTextStyle2,
                  ),
                ],
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/4.jpg"),
              ),
              title: Text("John Doe", style: AppTextStyles.headingTextStyle4),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "John.doe@email.com",
                    style: AppTextStyles.headingTextStyle2,
                  ),
                  Text(
                    "+1(555)123-4567",
                    style: AppTextStyles.headingTextStyle2,
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text(
                "Edit Profile",
                style: AppTextStyles.headingTextStyle,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Padding(padding: EdgeInsetsGeometry.only()),
                        Text("12", style: AppTextStyles.headingTextStyle2),
                        Text(
                          "Appointments",
                          style: AppTextStyles.headingTextStyle2,
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text("8", style: AppTextStyles.headingTextStyle2),
                        Text(
                          "Completed",
                          style: AppTextStyles.headingTextStyle2,
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text("2", style: AppTextStyles.headingTextStyle2),
                        Text(
                          "Upcoming",
                          style: AppTextStyles.headingTextStyle2,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Text("Account", style: AppTextStyles.headingTextStyle),

            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.person_4_outlined, color: Colors.blue),
              ),
              title: Text("Edit Profile"),
              trailing: Icon(Icons.arrow_forward_ios_sharp),
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(
                  Icons.notifications_none_outlined,
                  color: Colors.orange,
                ),
              ),
              title: Text("Notification"),
              trailing: Icon(Icons.arrow_forward_ios_sharp),
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.credit_card_outlined, color: Colors.green),
              ),
              title: Text("Payment Methods"),
              trailing: Icon(Icons.arrow_forward_ios_sharp),
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(
                  Icons.lock_outline_rounded,
                  color: Colors.deepPurpleAccent,
                ),
              ),
              title: Text("Privacy & Security"),
              trailing: Icon(Icons.arrow_forward_ios_sharp),
            ),
            Text("Support", style: AppTextStyles.headingTextStyle),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.question_mark, color: Colors.blue),
              ),
              title: Text("Help Center"),
              trailing: Icon(Icons.arrow_forward_ios_sharp),
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.notes_outlined, color: Colors.grey),
              ),
              title: Text("Payment Methods"),
              trailing: Icon(Icons.arrow_forward_ios_sharp),
            ),
            Center(
              child: SizedBox(
                height: Get.height * 0.06,
                width: Get.width * 0.8,
                child: OutlinedButton.icon(
                  onPressed: () {
                    Get.to(LoginPage());
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.red),
                    iconColor: Colors.red,
                    iconSize: 25,
                  ),
                  label: Text(
                    "Logout",
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  ),
                  icon: Icon(Icons.logout_sharp),
                ),
              ),
            ),

            // ListView.separated(
            //   itemBuilder: (context, index) {
            //   final item = userProfileModel[index];
            //     return profile(item);
            //   },
            //   separatorBuilder: (context, index) => SizedBox(),
            //   itemCount: profileList.length,
            //   shrinkWrap: true,
            //   physics: NeverScrollableScrollPhysics(),
            // ),
          ],
        ),
      ),
    );
  }

  //  Widget profile(profilemodel data) {
  //   return ListTile(
  //     leading: data.icon != null && data.icon!.isNotEmpty
  //         ? Image.asset(
  //             data.icon!,
  //             width: 40,
  //             height: 40,
  //             fit: BoxFit.cover,
  //           )
  //         : CircleAvatar(),
  //     title: Text(data.tittle ?? ""),
  //     trailing: Icon(Icons.arrow_forward_ios, size: 16),
  //     onTap: () {
  //       // handle tap
  //     },
  //   );
  // }
}
