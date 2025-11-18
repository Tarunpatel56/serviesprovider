import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/utils/color_util.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,  shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),actionsPadding: EdgeInsets.all(10),elevation: 10,toolbarHeight: 100,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        title: Text(
          "Edit Profile",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 50),
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("assets/4.jpg"),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Text(
                "Personal Details",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("First Name"),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),

                        hintText: "Name",

                        contentPadding: EdgeInsets.all(10.0),
                        errorStyle: TextStyle(color: Colors.red),
                      ),
                    ),
                    Text("Last Name"),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),

                        hintText: "Last Name",
                        alignLabelWithHint: bool.fromEnvironment(
                          AutofillHints.email,
                        ),
                        contentPadding: EdgeInsets.all(10.0),
                        errorStyle: TextStyle(color: Colors.red),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "SUBMIT",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    Text("Mobile Number"),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "+1(555)123-4567",
                        prefixIcon: Icon(Icons.phone),
                        suffixIcon: TextButton(
                          style: TextButton.styleFrom(padding: EdgeInsets.zero),
                          onPressed: () {},
                          child: Text("Update"),
                        ),
                      ),
                    ),
                    Text("Email ID"),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "John.doe@email.com",
                        prefixIcon: Icon(Icons.email),
                        suffixIcon: TextButton(
                          onPressed: () {},
                          child: Text("Verify"),
                        ),
                      ),
                    ),

                    Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "change Password",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                    Divider(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
