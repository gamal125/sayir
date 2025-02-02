import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sayir/Componant/Componant.dart';
import 'package:url_launcher/url_launcher.dart';

import 'main.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {







  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return  Scaffold(
      backgroundColor: HexColor("#0b767c"),
      body:Container(
        width: width,
        height: height,
        decoration: BoxDecoration(color: HexColor("#0b767c"),image: DecorationImage(image: AssetImage('assets/images/back3.jpg'),fit: BoxFit.fill)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              elevation: 4,
              shadowColor: Colors.black,  // Shadow color
              borderRadius: BorderRadius.circular(25),
              child: Container(
                width: width*0.95,
                height: 100,
                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(25)),color: HexColor("#0b767c")),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: InkWell(
                      onTap: (){
                        _launchUrl();
                      },
                      child: Container(
                          width:width*0.1 ,
                          height: height*0.08,
                          decoration: BoxDecoration(
                            color: HexColor("#ECE7E1"),
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                          ),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.phone_android,color:HexColor("#0b767c"),size:  width*0.015,),

                              Text('تحميل التطبيق',style: TextStyle(color: HexColor("#0b767c"),fontSize: width*0.012,fontWeight: FontWeight.bold),),
                            ],
                          )),
                    ),
                  ),
                  Container(
                    width: width*0.1,
                    height: 100,
                decoration: BoxDecoration(color:HexColor("#0b767c"),borderRadius: BorderRadius.all(Radius.circular(25)),
                    image: DecorationImage(image: AssetImage('assets/images/logo.jpg'),)
                  )
                  ),

                ],
              ),
              ),
            ),
          ),

          Expanded(
            child: Row(
              children: [
            
                Expanded(child: Padding(
                  padding: const EdgeInsets.all(58.0),
                  child: Center(
                    child: Material(
                              elevation: 10,
                                shadowColor: Colors.black,  // Shadow color
                                borderRadius: BorderRadius.circular(25),
                                color: HexColor("#0b767c"),
                                child: Container(

                    height: height*0.5,
alignment: AlignmentDirectional.bottomCenter,
                    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(25)),color: HexColor("#0b767c"),image: DecorationImage(image: AssetImage('assets/images/text2.png'))),
                               child: Padding(
                                 padding: const EdgeInsets.all(18.0),
                                 child: Padding(
                                   padding: const EdgeInsets.only(left: 18.0),
                                   child: InkWell(
                                     onTap: (){
                                       navigateTo(context, MyHomePage(title: '',));
                                     },
                                     child: Container(
                                         width:width*0.1 ,
                                         height: height*0.08,
                                         decoration: BoxDecoration(
                                           color: HexColor("#ECE7E1"),
                                           borderRadius: BorderRadius.all(Radius.circular(25)),
                                         ),

                                         child: Row(
                                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                           children: [
                                             Icon(Icons.keyboard_backspace,color:HexColor("#0b767c"),size: width*0.015,),

                                             Text('إستأجر الان',style: TextStyle(color: HexColor("#0b767c"),fontSize: width*0.013,fontWeight: FontWeight.bold),),
                                           ],
                                         )),
                                   ),
                                 ),
                               ),

                                )

                    ),
                  ),
                ),
                ),
                Expanded(child: Container()),
              ],
            ),
          )
        ],
      ),
      ) ,

    );
  }
  final String googlePlayUrl = "https://play.google.com/store/apps/details?id=com.gaalsayir132025.sayir"; // Replace with your app's Play Store link

  Future<void> _launchUrl() async {
    Uri url = Uri.parse(googlePlayUrl);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $googlePlayUrl';
    }
  }
}
