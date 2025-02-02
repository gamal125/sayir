
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';

import '../UserScreens/DetailsScreen.dart';
import '../models/PostModel.dart';



Widget defaultTextFormField({
  FocusNode? focusNode,
  required TextEditingController controller,
  required TextInputType keyboardType,
  required String? Function(String?) validate,
  required String label,

  String? hint,

  onTap,
  onChanged,
  Function(String)? onFieldSubmitted,
  bool isPassword = false,
  bool isClickable = true,
  InputDecoration? decoration,
  IconData? suffix,
  IconData? prefix,
  Function? suffixPressed,
}) =>
    TextFormField(


      maxLines: 1,
      minLines: 1,
      controller: controller,
      validator: validate,
      enabled: isClickable,
      onTap: onTap,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      obscureText: isPassword,
      keyboardType: keyboardType,
      autofocus: false,
      decoration: InputDecoration(
        prefixIcon: Icon(
          prefix,
          color: HexColor("#118C8C"),
        ),
        suffixIcon: suffix != null
            ? IconButton(
          onPressed: () {
            suffixPressed!();
          },
          icon: Icon(
            suffix,
            color: HexColor("#118C8C"),
          ),
        )
            : null,
        filled: true,
        isCollapsed: false,
        fillColor: Colors.white,
        hoverColor: Colors.red.withOpacity(0.2),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
          borderSide: BorderSide(
            color: Colors.cyan,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        labelText: label,
        labelStyle: const TextStyle(

          color: Colors.black,
        ),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        focusColor: Colors.black,
        disabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
          borderSide: BorderSide(
            color: Colors.green,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
      ),
    );

Widget defaultMaterialButton({
  required Function function,
  required String text,
  Color color=Colors.white,
  double width = 200,
  double height = 60.0,
  double radius = 15.0,
  bool isUpperCase = true,
  Function? onTap,
}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: color
        //  color: background,
      ),
      child: MaterialButton(
        onPressed: () {
          function();
        },
        child: Text(
          isUpperCase?text.toUpperCase():text,
          textAlign:TextAlign.start,


          style: TextStyle(

            color: HexColor("#118C8C"),
            fontSize: 20.0,
          ),
        ),
      ),
    );

Widget defaultTextButton({
  required Function function,
  required String text,
}) =>
    TextButton(
      onPressed: () {
        function();
      },
      child: Text(text,style: TextStyle(color: Colors.white),),
    );

Widget myDivider() => Container(
  width: double.infinity,
  height: 1.0,
  color: Colors.grey[300],
);

void showToast({
  required String text,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0,
    );

// enum  كذا اختيار من حاجة

enum ToastStates { success, error, warning }

Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.success:
      color = Colors.green;
      break;

    case ToastStates.error:
      color = Colors.red;
      break;

    case ToastStates.warning:
      color = Colors.amber;
      break;
  }
  return color;
}

void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ), (route) {
  return false;
});
double height(context){return MediaQuery.of(context).size.height;}
double width(context){return MediaQuery.of(context).size.width;}
Widget mainCard(int index,List<PostModel> posts,context)=> Padding(
  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
  child: SizedBox(

    child: InkWell(
      onTap: (){
        navigateTo(context, DetailsScreen(post: posts[index], ));},
      child: Card(

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.white,
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(15.0)),
              child: posts[index].image != null
                  ? ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 0, sigmaY: 0), // Apply a minimal filter to avoid WebGL
                child: Image.network(
                  posts[index].image!,
                  height: 180,
                  fit: BoxFit.fill,
                  errorBuilder: (context, error, stackTrace) {
                    return Center(child: Icon(Icons.broken_image, size: 150, color: Colors.grey));
                  },
                ),
              ):
              posts[index].image2 != null
                  ? ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 0, sigmaY: 0), // Apply a minimal filter to avoid WebGL
                child: Image.network(
                  posts[index].image2!,
                  height: 180,
                  fit: BoxFit.fill,
                  errorBuilder: (context, error, stackTrace) {
                    return Center(child: Icon(Icons.broken_image, size: 150, color: Colors.grey));
                  },
                ),
              ):
              posts[index].image3 != null
                  ? ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 0, sigmaY: 0), // Apply a minimal filter to avoid WebGL
                child: Image.network(
                  posts[index].image3!,
                  height: 180,
                  fit: BoxFit.fill,
                  errorBuilder: (context, error, stackTrace) {
                    return Center(child: Icon(Icons.broken_image, size: 150, color: Colors.grey));
                  },
                ),
              )
                  : Container(
                height: 180,
                color: Colors.grey[300],
                child: const Icon(Icons.image, size: 60, color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          posts[index].name!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.right,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),


                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                          Icons.location_on, size: 16, color: Colors.red),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          posts[index].location!,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.right,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  ),
);
// void logOut(context) {
//   CacheHelper.removeData(
//     key: 'token',
//   ).then((value) {
//     if (value) {
//       navigateAndFinish(context, LoginScreen());
//     }
//   });
// }



