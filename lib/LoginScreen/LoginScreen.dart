
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';


import '../Componant/Componant.dart';
import '../Cubit/AppCubit.dart';
import '../Cubit/AppStates.dart';

import '../main.dart';
import '../register/register_screen.dart';
import '../shared/local/cache_helper.dart';




class LoginScreen extends StatelessWidget {
  final  formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          CacheHelper.saveData(key: 'uId', value: state.uId);

          AppCubit.get(context).getUser(state.uId);
          AppCubit.get(context).getPosts();
          navigateAndFinish(context,  const MyHomePage(title: '',));

        }
        if (state is LoginErrorState) {
          showToast(text: state.error, state: ToastStates.error);

        }
        },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: HexColor("#118C8C"),
          body: SafeArea(
            child: GestureDetector(
              onTap: (){
                FocusManager.instance.primaryFocus?.unfocus();
              },

              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: const Text(
                              "تسجيل دخول",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          defaultTextFormField(
                            onTap: (){
                            },
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            prefix: Icons.email,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'من فضلك ادخل الايميل';
                              }
                              return null;
                            },
                            label: 'الايميل',
                            hint: 'ادخل الايميل',
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          defaultTextFormField(
                            onTap: (){
                              // LoginCubit.get(context).emit(LoginInitialState());
                            },
                            controller: passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            prefix: Icons.key,
                            suffix: AppCubit.get(context).suffix,
                            isPassword: AppCubit.get(context).isPassword,
                            suffixPressed: () {
                              AppCubit.get(context).ChangePassword();
                            },
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'من فضلك ادخل كلمة المرور';
                              }
                              return null;
                            },
                            label: 'كلمة المرور',
                            hint: 'ادخل كلمة المرور',
                          ),

                          const SizedBox(
                            height: 30,
                          ),
                          ConditionalBuilder(
                            condition: state is! LoginLoadingState,
                            builder: (context) => Center(
                              child: defaultMaterialButton(

                                function: () {
                                  if (formKey.currentState!.validate()) {
                                    AppCubit.get(context).userLogin(
                                        email: emailController.text,
                                        password: passwordController.text);
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
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              defaultTextButton(
                                function: () {
                                  navigateTo(context, RegisterScreen());
                                },
                                text: '! تسجيل جديد',
                              ),

                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                'هل ليس لديك حساب مسبقا؟',
                                style:
                                TextStyle(fontSize: 16, color: Colors.white70),
                              ),
                            ],
                          ),


                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

        );
      },
    );
  }
}
