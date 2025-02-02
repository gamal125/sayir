import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';



import '../Componant/Componant.dart';

import '../LoginScreen/LoginScreen.dart';


import '../main.dart';
import '../shared/local/cache_helper.dart';
import 'cubit/cubit.dart';
import 'cubit/state.dart';




class RegisterScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();



  final passwordController = TextEditingController();
  final passwordController2 = TextEditingController();

  final nameController = TextEditingController();

  final phoneController = TextEditingController();
  late final String name ;
  late final String email ;


  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
       listener: (context, state) {
        if (state is RegisterSuccessState) {

          navigateAndFinish(context, LoginScreen());
        }
        if (state is SuccessState) {
          CacheHelper.saveData(key: 'uId', value: state.uId);
         //  AppCubit.get(context).ud=state.uId;
          RegisterCubit.get(context).getUser(state.uId);

           navigateAndFinish(context, const MyHomePage(title: '',));
        }

      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: HexColor("#118C8C"),
          body: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth < 600) {
                  return Container(
                    color: Colors.white,
                    child: Center(
                      child: Text(
                        "Increase window size (min 600)",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                } else {

                  return  GestureDetector(
                    onTap: (){
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    child: Padding(
                      padding:  EdgeInsets.only(top: height(context)*0.25),
                      child: SizedBox(

                        child: SingleChildScrollView(
                          child: Form(
                            key: formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [


                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child:  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('إنشاء حساب',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold,fontFamily: 'Dubai',),),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 15,left: 15,bottom:10,top: 50),
                                  child: SizedBox(
                                    width: width(context) / 3,
                                    child: Column(children: [

                                      defaultTextFormField(
                                        controller: emailController,
                                        prefix: Icons.email,
                                        keyboardType: TextInputType.emailAddress,
                                        validate: (String? value) {
                                          if (value!.isEmpty) {
                                            return 'البريد الالكتروني';
                                          }
                                          return null;
                                        },
                                        label: 'البريد الالكتروني',
                                        hint: 'البريد الالكتروني',
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      defaultTextFormField(
                                        controller: nameController,
                                        keyboardType: TextInputType.text,
                                        prefix: Icons.edit,
                                        validate: (String? value) {
                                          if (value!.isEmpty) {
                                            return 'الاسم الكامل';
                                          }
                                          return null;
                                        },
                                        label: 'الاسم الكامل',
                                        hint: 'الاسم الكامل',
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      defaultTextFormField(
                                        controller: phoneController,
                                        prefix: Icons.phone,
                                        keyboardType: TextInputType.phone,
                                        validate: (String? value) {
                                          if (value!.isEmpty) {
                                            return 'رقم الهاتف';
                                          }
                                          return null;
                                        },
                                        label: 'رقم الهاتف',
                                        hint: 'رقم الهاتف',
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      defaultTextFormField(
                                        controller: passwordController,

                                        keyboardType: TextInputType.visiblePassword,
                                        prefix: Icons.key,
                                        suffix: RegisterCubit.get(context).suffix,
                                        isPassword: RegisterCubit.get(context).isPassword,
                                        suffixPressed: () {
                                          RegisterCubit.get(context).changePassword();
                                        },
                                        validate: (String? value) {
                                          if (value!.isEmpty) {
                                            return 'كلمة المرور';
                                          }
                                          return null;
                                        },
                                        label: 'كلمة المرور',
                                        hint: 'كلمة المرور',
                                      ),

                                      const SizedBox(
                                        height: 20,
                                      ),
                                      defaultTextFormField(
                                        controller: passwordController2,
                                        keyboardType: TextInputType.visiblePassword,
                                        prefix: Icons.key,
                                        suffix: RegisterCubit.get(context).suffix,
                                        isPassword: RegisterCubit.get(context).isPassword,
                                        suffixPressed: () {
                                          RegisterCubit.get(context).changePassword();
                                        },
                                        validate: (String? value) {
                                          if (value!.isEmpty) {
                                            return 'تاكيد كلمة المرور';
                                          }
                                          return null;
                                        },
                                        label: 'تاكيد كلمة المرور',
                                        hint: 'تاكيد كلمة المرور',
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      ConditionalBuilder(
                                        condition: state is! CreateUserInitialState,
                                        builder: (context) => Center(
                                          child: defaultMaterialButton(
                                            function: () {
                                              if (formKey.currentState!.validate()) {
                                                if(passwordController.text!=passwordController2.text){
                                                  showToast(text:'كلمة المرور غير متطابقه' , state: ToastStates.error);
                                                }else{
                                                  if(phoneController.text.length<10){
                                                    showToast(text:'رقم الهاتف غير صحيح' , state: ToastStates.error);
                                                  }else{
                                                    RegisterCubit.get(context).userRegister(
                                                      email: emailController.text,
                                                      password: passwordController.text,
                                                      name: nameController.text,
                                                      phone: phoneController.text,
                                                    );
                                                  }

                                                }

                                              }
                                            },
                                            text: 'تسجيل دخول',
                                            radius: 20,
                                          ),
                                        ),
                                        fallback: (context) =>
                                        const Center(child: CircularProgressIndicator()),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      SizedBox(
                                        width: width(context) / 3,
                                        child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                          children: [

                                            TextButton(onPressed: () { navigateTo(context, LoginScreen()); },
                                              child:const Text(' تسجيل دخول',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.white),),
                                            ),
                                            Expanded(
                                              child: const Text('هل تمتلك حساب مسبقا؟',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.white70),
                                              textAlign: TextAlign.right,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),


                                    ]),
                                  ),
                                ),


                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }
              }

          )
        );
      },
    );
  }

}
