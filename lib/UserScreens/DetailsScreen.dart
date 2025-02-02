import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:sayir/Componant/Componant.dart';
import 'package:sayir/models/PostModel.dart';

import '../Cubit/AppCubit.dart';
import '../Cubit/AppStates.dart';
import '../shared/local/cache_helper.dart';

class DetailsScreen extends StatelessWidget {
   const DetailsScreen({super.key,required this.post,});
  final PostModel post;

  @override
  Widget build(BuildContext context) {
    List<String> images=[];
    post.image!=''? images.add(post.image!):null;
    post.image2!=''? images.add(post.image2!):null;
    post.image3!=''? images.add(post.image3!):null;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor:  HexColor("#118C8C"), // Change the color here
        statusBarIconBrightness: Brightness.light,));
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context,state){
            if(state is CreateOrderSuccessState){
              showToast(text: 'تم الحجز بنجاح !  سيتم التواصل معك', state: ToastStates.success);
              Navigator.pop(context);
            }
            if(state is CreateOrderErrorStates){
              showToast(text: 'تحقق من الاتصال بالانترنت', state: ToastStates.error);

            }
      },
      builder: (context,state) {
        return Scaffold(
          backgroundColor: HexColor("#118C8C"), // Light background color

          body: Container(
            color: Colors.white,
            child: Stack(
              children: [
                ScrollConfiguration(
                  behavior: ScrollBehavior().copyWith(scrollbars: true, dragDevices: {
                    PointerDeviceKind.mouse,
                    PointerDeviceKind.touch,
                  }),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(images.length, (index) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.4,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(images[index]),
                              fit: BoxFit.fill,
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.4,),
                  child: Container(
                    height: height(context)*0.6,
                    padding:  EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50),), color: Colors.white,),

                    child: SingleChildScrollView(
                      child: Column(

                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          // Image

                          const SizedBox(height: 16),

                          // Title, Price, and Location
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    post.price!,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.orange,
                                    ),
                                  ),
                                  Text(
                                    post.name!,
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),

                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children:  [

                                  Text(
                                    post.location!,
                                    style: TextStyle(fontSize: 16, color: Colors.black54),

                                  ),

                                  SizedBox(width: 4),
                                  Icon(Icons.location_on, color: Colors.red, size: 16),
                                ],
                              ),
                            ],
                          ),

                          const SizedBox(height: 16),

                          // Features
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FeatureIcon(
                                value:post.nRooms!,
                                icon: Icons.hotel_sharp,
                                label: 'عدد الغرف',
                              ),
                              FeatureIcon(
                                value:post.age!,
                                icon: Icons.access_time,
                                label: 'عمر العقار',
                              ),
                              FeatureIcon(
                                value:post.area!,
                                icon: Icons.area_chart,
                                label: 'المساحة',
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),

                          // Description Section
                          const Text(
                            'وصف',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                      Container(
                          width: width(context),
                          height: height(context)/4,  // Specify a fixed height or let it grow
                          color: Colors.white38,
                          child: SingleChildScrollView(
                            child: Text(
                              post.description!,
                              style: TextStyle(fontSize: 14, color: Colors.black87, height: 1.5),
                              textAlign: TextAlign.right,
                            ),
                          ),),


                          const SizedBox(height: 16),

                          if (CacheHelper.getData(key: 'uId')!="5wJWxLCo1VaQEwTO6ftLWqYcJsI2") Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ConditionalBuilder(
                                condition: state is !CreateOrderLoadingState,
                                builder: (context) {
                                  return Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: InkWell(
                                      onTap: (){
                                        CacheHelper.getData(key: 'uId')==null||CacheHelper.getData(key: 'uId')==''||AppCubit.get(context).userdata==null?
                                            showToast(text: 'من فضلك سجل دخول اولا', state: ToastStates.warning):
                                   AppCubit.get(context).createOrder(
                                       area: post.area!,
                                       location: post.location!,
                                       type: post.type!,
                                       price: post.price!,
                                       name: post.name!, date:DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now()));
                                      },
                                      child: Container(

                                        width:width(context)*0.4,height: height(context)*0.07, decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(20)),
                                        color:  HexColor("#118C8C"),

                                      ),
                                      child: Center(child: Text('!إحجز الان و إدفع لاحقاّ',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),),
                                    ),
                                  );
                                }, fallback: (BuildContext context) { return Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Center(child: CircularProgressIndicator()),
                                ); },
                              ),
                            ],
                          ) else SizedBox(),
                          // Photo Gallery Section

                        ],
                      ),
                    ),
                  ),
                ),


              ],
            ),
          ),
        );
      }
    );
  }
}

class FeatureIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const FeatureIcon({super.key, required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 3,horizontal: 5),
      decoration: BoxDecoration(border:Border.all(color: Colors.black,width: 2),borderRadius: BorderRadius.circular(5) ),
      child: Row(
        children: [
          Icon(icon, size: 24, color: Colors.black),
          const SizedBox(width:4 ),
          Text(
            value,
            style: const TextStyle(fontSize: 12, color: Colors.black),
          ),
          const SizedBox(width:4 ),
          Text(
            label,
            style: const TextStyle(fontSize: 12, color: Colors.black),
          ),

        ],
      ),
    );
  }
}
