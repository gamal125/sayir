import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sayir/models/PostModel.dart';

import '../Componant/Componant.dart';
class ViewScreen extends StatelessWidget {
  const ViewScreen({super.key,required this.posts,required this.uId,});
final List<PostModel> posts;
final String uId;
  @override
  Widget build(BuildContext context) {

    return   Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle( statusBarColor:  HexColor("#118C8C"), // Change the color here
          statusBarIconBrightness: Brightness.light,),
        iconTheme: const IconThemeData(color: Colors.white),backgroundColor: HexColor("#118C8C"),elevation: 1,),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child:  Container(
          width: double.infinity,

          color: Colors.white38,
          child: GridView.builder(
            scrollDirection: Axis.vertical,  // Horizontal grid scrolling
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:3,  // Only 1 item per row to make it horizontal
              mainAxisSpacing: 10,
              mainAxisExtent: 400,// Space between items in the main axis (horizontal)
              crossAxisSpacing: 50, // Space between items in the cross axis
            ),
            itemCount: posts.length, // Number of grid items
            itemBuilder: (context, index) {
              return mainCard(index,posts,context); // Replace this with your custom card
            },
          ),
        )
      ),
    );
  }
}
//nawaf77.assa7@gmail.com
//ALsubaie776