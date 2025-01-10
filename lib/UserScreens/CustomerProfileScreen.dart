// ignore_for_file: file_names, prefer_typing_uninitialized_variables


import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:url_launcher/url_launcher.dart';


import '../Componant/Componant.dart';
import '../Cubit/AppCubit.dart';
import '../Cubit/AppStates.dart';
import '../LoginScreen/LoginScreen.dart';
import '../shared/local/cache_helper.dart';

class CustomerProfileScreen extends StatelessWidget {
   CustomerProfileScreen({super.key});
  final Uri policyUri = Uri.parse('https://www.freeprivacypolicy.com/live/e1cf2036-bc46-41a0-a6df-de862603a94c');

  @override
  Widget build(BuildContext context) {
    Size screenSiz = MediaQuery.of(context).size;

    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {

          if(state is LogoutSuccessState){

            CacheHelper.removeData(key: 'uId',);
            CacheHelper.removeData(key: 'name',);

            navigateAndFinish(context, LoginScreen());
          }

        },
        builder: (context, state) {
          return CacheHelper.getData(key: 'uId')==null||CacheHelper.getData(key: 'uId')==''||AppCubit.get(context).userdata==null?


          Scaffold(
            backgroundColor: HexColor("#118C8C"),

            body: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,

                      child:  Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 72.0),
                            child: Stack(
                                alignment: AlignmentDirectional.bottomEnd,
                                children:[

                                  CircleAvatar(backgroundImage: AssetImage('assets/images/1.jpg'),radius: 60,),


                                ]

                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
                            child: Row(
                              children: [
                                const SizedBox(width: 10,),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Container(
                                        padding: const EdgeInsets.all(5),
                                        width: MediaQuery.of(context).size.width*0.7,
                                        height: MediaQuery.of(context).size.height*0.05,
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Colors.green,width: 1),
                                            borderRadius: BorderRadius.circular(10)
                                            ,color: Colors.white
                                        ),
                                        child:
                                        Text('New user',
                                          style:  TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: HexColor("#118C8C"),overflow: TextOverflow.ellipsis),maxLines: 1,textAlign: TextAlign.right,)),

                                  ),
                                ),
                                const SizedBox(width: 10,),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Container(
                                      padding: const EdgeInsets.all(5),
                                      width: MediaQuery.of(context).size.width*0.2,
                                      height: MediaQuery.of(context).size.height*0.05,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(color: Colors.white,width: 1),
                                          borderRadius: BorderRadius.circular(10)

                                      ),
                                      child: Text('اسم المستخدم',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: HexColor("#118C8C"),),textAlign: TextAlign.right,)),
                                ),
                                const SizedBox(width: 10,),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
                            child: Row(
                              children: [
                                const SizedBox(width: 10,),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Container(
                                        padding: const EdgeInsets.all(5),
                                        width: MediaQuery.of(context).size.width*0.7,
                                        height: MediaQuery.of(context).size.height*0.05,
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Colors.green,width: 1),
                                            borderRadius: BorderRadius.circular(10)
                                            ,color: Colors.white
                                        ),
                                        child:
                                        Text('*****@gmail.com',
                                          style:  TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: HexColor("#118C8C"),overflow: TextOverflow.ellipsis),maxLines: 1,textAlign: TextAlign.right,)),

                                  ),
                                ),
                                const SizedBox(width: 10,),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Container(
                                      padding: const EdgeInsets.all(5),
                                      width: MediaQuery.of(context).size.width*0.2,
                                      height: MediaQuery.of(context).size.height*0.05,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(color: Colors.white,width: 1),
                                          borderRadius: BorderRadius.circular(10)

                                      ),
                                      child: Text('البريد الاكتروني',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: HexColor("#118C8C"),),textAlign: TextAlign.right,)),
                                ),
                                const SizedBox(width: 10,),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
                            child: Row(
                              children: [
                                const SizedBox(width: 10,),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Container(
                                        padding: const EdgeInsets.all(5),
                                        width: MediaQuery.of(context).size.width*0.7,
                                        height: MediaQuery.of(context).size.height*0.05,
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Colors.green,width: 1),
                                            borderRadius: BorderRadius.circular(10)
                                            ,color: Colors.white
                                        ),
                                        child:
                                        Text('##########',
                                          style:  TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: HexColor("#118C8C"),overflow: TextOverflow.ellipsis),maxLines: 1,textAlign: TextAlign.right,)),

                                  ),
                                ),
                                const SizedBox(width: 10,),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Container(
                                      padding: const EdgeInsets.all(5),
                                      width: MediaQuery.of(context).size.width*0.2,
                                      height: MediaQuery.of(context).size.height*0.05,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(color: Colors.white,width: 1),
                                          borderRadius: BorderRadius.circular(10)

                                      ),
                                      child: Text('رقم الجوال',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: HexColor("#118C8C"),),textAlign: TextAlign.right,)),
                                ),
                                const SizedBox(width: 10,),
                              ],
                            ),
                          ),


                          SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              ConditionalBuilder(
                                  condition: state is! LogoutLoadingState,
                                  builder: (context)=>

                                      Container(
                                          padding: const EdgeInsets.all(2),
                                          width: MediaQuery.of(context).size.width*0.5,
                                          height: MediaQuery.of(context).size.height*0.055,
                                          decoration: BoxDecoration(
                                              border: Border.all(color: Colors.white,width: 1),
                                              borderRadius: BorderRadius.circular(10)
                                              ,color: Colors.red
                                          ),
                                          child:TextButton(onPressed: (){

                                            AwesomeDialog(
                                              body:    const Padding(
                                                padding: EdgeInsets.all(18.0),
                                                child: Column(
                                                  children: [
                                                    Text('هل تريد حقا تسجيل الخروج'),
                                                    SizedBox(height: 20,),

                                                  ],
                                                ),
                                              ),
                                              context: context,
                                              dialogType: DialogType.warning,
                                              animType: AnimType.rightSlide,

                                              btnCancelOnPress: () {},
                                              btnCancelText: 'لا',
                                              btnOkText: 'نعم',
                                              btnOkOnPress: () {
                                                AppCubit.get(context).signout();
                                              },
                                            ).show();

                                          },child: const Text('LogOut',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.white),))) , fallback: (context)=>  Center(
                                  child: LoadingAnimationWidget.inkDrop(
                                    color: Colors.green.withOpacity(.8),
                                    size: screenSiz.width / 12,
                                  ))
                              ) ,
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Container(   width: 40,height: 40,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white),

                                  child:  Icon(Icons.logout_rounded,color:  HexColor("#118C8C")),
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ):
          Scaffold(
            backgroundColor: HexColor("#118C8C"),

            body: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,

                      child:  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: Stack(
                                alignment: AlignmentDirectional.bottomEnd,
                                children:[


                                  const CircleAvatar(backgroundImage: AssetImage('assets/images/1.jpg'),radius: 65,)
                                  ,
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 2.0,right: 8),
                                    child: Container(

                                        width: 32,
                                        height: 32,
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                                          color: Colors.white,
                                        ),
                                        child: IconButton( onPressed: (){
                                          if(AppCubit.get(context).userdata!=null) {
                                         //   navigateTo(context, UpdateProfileScreen());
                                          }
                                          else{
                                            AppCubit.get(context).getUser(CacheHelper.getData(key: 'uId'), );
                                          }
                                        }, icon: const Icon(Icons.edit,color: Colors.green,size: 18,))),
                                  ),

                                ]

                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 20),
                            child: Row(
                              children: [
                                const SizedBox(width: 10,),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Container(
                                        padding: const EdgeInsets.all(5),
                                        width: MediaQuery.of(context).size.width*0.6,
                                        height: MediaQuery.of(context).size.height*0.05,
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Colors.green,width: 1),
                                            borderRadius: BorderRadius.circular(10)
                                            ,color: Colors.white
                                        ),
                                        child:
                                        Text('${AppCubit.get(context).userdata!.name}',
                                          style:  TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: HexColor("#118C8C"),overflow: TextOverflow.ellipsis),maxLines: 1,textAlign: TextAlign.right,)),

                                  ),
                                ),
                                const SizedBox(width: 10,),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Container(
                                      padding: const EdgeInsets.all(5),
                                      width: MediaQuery.of(context).size.width*0.3,
                                      height: MediaQuery.of(context).size.height*0.05,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                          border: Border.all(color: Colors.white,width: 1),
                                          borderRadius: BorderRadius.circular(10)

                                      ),
                                      child: Text('اسم المستخدم',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: HexColor("#118C8C"),),textAlign: TextAlign.right,)),
                                ),
                                const SizedBox(width: 10,),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0 ),
                            child: Row(
                              children: [
                                const SizedBox(width: 10,),
                                Expanded(
                                  child: Container(
                                      padding: const EdgeInsets.all(5),
                                      width: MediaQuery.of(context).size.width*0.6,
                                      height: MediaQuery.of(context).size.height*0.05,
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.green,width: 1),
                                          borderRadius: BorderRadius.circular(10)
                                          ,color: Colors.white
                                      ),
                                      child:
                                      Text('${AppCubit.get(context).userdata!.email}',
                                        style:  TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: HexColor("#118C8C"),overflow: TextOverflow.ellipsis),maxLines: 1,textAlign: TextAlign.right,)),
                                ),
                                const SizedBox(width: 10,),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                                  child: Container(
                                      padding: const EdgeInsets.all(5),
                                      width: MediaQuery.of(context).size.width*0.3,
                                      height: MediaQuery.of(context).size.height*0.05,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(color: Colors.white,width: 1),
                                          borderRadius: BorderRadius.circular(10)

                                      ),
                                      child: Text('البريد الاكتروني',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: HexColor("#118C8C"),),textAlign: TextAlign.right,)),
                                ),
                                const SizedBox(width: 10,),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              children: [
                                const SizedBox(width: 10,),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Container(
                                        padding: const EdgeInsets.all(5),
                                        width: MediaQuery.of(context).size.width*0.6,
                                        height: MediaQuery.of(context).size.height*0.05,
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Colors.green,width: 1),
                                            borderRadius: BorderRadius.circular(10)
                                            ,color: Colors.white
                                        ),
                                        child:
                                        Text('${AppCubit.get(context).userdata!.phone}',
                                          style:  TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: HexColor("#118C8C"),overflow: TextOverflow.ellipsis),maxLines: 1,textAlign: TextAlign.right,)),

                                  ),
                                ),
                                const SizedBox(width: 10,),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Container(
                                      padding: const EdgeInsets.all(5),
                                      width: MediaQuery.of(context).size.width*0.3,
                                      height: MediaQuery.of(context).size.height*0.05,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(color: Colors.white,width: 1),
                                          borderRadius: BorderRadius.circular(10)

                                      ),
                                      child: Text('رقم الجوال',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: HexColor("#118C8C"),),textAlign: TextAlign.right,)),
                                ),
                                const SizedBox(width: 10,),
                              ],
                            ),
                          ),



                          SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              ConditionalBuilder(
                                  condition: state is! LogoutLoadingState,
                                  builder: (context)=>

                                      Container(
                                          padding: const EdgeInsets.all(2),
                                          width: MediaQuery.of(context).size.width*0.5,
                                          height: MediaQuery.of(context).size.height*0.055,
                                          decoration: BoxDecoration(
                                              border: Border.all(color: Colors.white,width: 1),
                                              borderRadius: BorderRadius.circular(10)
                                              ,color: Colors.red
                                          ),
                                          child:TextButton(onPressed: (){

                                            AwesomeDialog(
                                              body:    const Padding(
                                                padding: EdgeInsets.all(18.0),
                                                child: Column(
                                                  children: [
                                                    Text('هل تريد حقا تسجيل الخروج'),
                                                    SizedBox(height: 20,),

                                                  ],
                                                ),
                                              ),
                                              context: context,
                                              dialogType: DialogType.warning,
                                              animType: AnimType.rightSlide,

                                              btnCancelOnPress: () {},
                                              btnCancelText: 'لا',
                                              btnOkText: 'نعم',
                                              btnOkOnPress: () {
                                                AppCubit.get(context).signout();
                                              },
                                            ).show();

                                          },child: const Text('تسجيل الخروج',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.white),))) , fallback: (context)=>  Center(
                                  child: LoadingAnimationWidget.inkDrop(
                                    color: Colors.green.withOpacity(.8),
                                    size: screenSiz.width / 12,
                                  ))
                              ) ,
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Container(   width: 40,height: 40,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white),

                                  child:  Icon(Icons.logout_rounded,color:  HexColor("#118C8C")),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                          ElevatedButton(

                            onPressed: _launchUrl,
                            child: Text('سياسة الخصوصية'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

          );
        }



    );}
   Future<void> _launchUrl() async {
     if (!await launchUrl(policyUri)) {
       throw Exception('Could not launch $policyUri');
     }
}
}