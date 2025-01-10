import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sayir/models/OrderModel.dart';

import '../models/PostModel.dart';
import '../models/UserModel.dart';
import '../shared/local/cache_helper.dart';
import 'AppStates.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);
  Future<void> userLogin({required String email, required String password}) async {
    emit(LoginLoadingState());

    try {
      var value = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(LoginSuccessState(value.user!.uid,));
    } catch (error) {
      String errorMessage = getFirebaseErrorMessage(error);
      emit(LoginErrorState(errorMessage)); // Emit the custom error message in Arabic
    }
  }

// Function to map Firebase error codes to Arabic messages
  String getFirebaseErrorMessage(Object error) {
    if (error is FirebaseAuthException) {
      switch (error.code) {
        case 'user-not-found':
          return "المستخدم غير موجود. يرجى التحقق من البريد الإلكتروني.";
        case 'wrong-password':
          return "كلمة المرور التي أدخلتها غير صحيحة.";
        case 'network-request-failed':
          return "فشل الاتصال بالشبكة. تحقق من اتصالك بالإنترنت.";
        case 'too-many-requests':
          return "تم حظر الحساب مؤقتاً بسبب محاولات تسجيل متعددة.";
        default:
          return "حدث خطأ غير معروف. حاول مرة أخرى لاحقاً.";
      }
    }
    // Handle other unexpected errors
    return "حدث خطأ غير متوقع. حاول مرة أخرى لاحقاً.";
  }
  void createUser({
    required String email,
    required String uId,
    required String name,
    required String phone,

  }) {
    UserModel model=UserModel(
        email: email,
        name: name,
        phone: phone,
        uId: uId,

    );

    FirebaseFirestore.instance.collection("users").doc(uId).set(model.Tomap()).then((value) {

      emit(LoginSuccessState(uId,));
    }).catchError((error) {
      emit(LoginErrorState(error.toString()));
    });
  }
  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  // ignore: non_constant_identifier_names
  void ChangePassword() {
    isPassword = !isPassword;
    suffix =
    isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(ChangePasswordState());
  }
  void signout(){
    emit(LogoutLoadingState());
    FirebaseAuth.instance.signOut().then((value) {
      emit(LogoutSuccessState());
    });
  }
  UserModel? userdata;
  void getUser(uid) {
uid !=''&& uid !=null?
    FirebaseFirestore.instance.collection('users').doc(uid.toString())
        .get()
        .then((value) {

     userdata = UserModel.fromjson(value.data()!);
      CacheHelper.saveData(key: 'name', value: userdata!.name);
      emit(GetUserSuccessState( userdata!.name!));
    }):null;
  }
  //////////////////////////
  final ImagePicker picker4 = ImagePicker();
  File? PickedFile4;
  Future<void> getImage4() async {
    final imageFile = await picker4.pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      PickedFile4 = File(imageFile.path);
      emit(UpdateProductImageSuccessStates());
    }
    else {
      var error = 'no Image selected';
      emit(UpdateProductImageErrorStates(error.toString()));
    }
  }
  ///////////////////////////////////
  final ImagePicker picker3 = ImagePicker();
  File? PickedFile3;
  Future<void> getImage3() async {
    final imageFile = await picker3.pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      PickedFile3 = File(imageFile.path);
      emit(UpdateProductImageSuccessStates());
    }
    else {
      var error = 'no Image selected';
      emit(UpdateProductImageErrorStates(error.toString()));
    }
  }
  ///////////////////////////////////////////
  final ImagePicker picker2 = ImagePicker();
  File? PickedFile2;
  Future<void> getImage2() async {
    final imageFile = await picker2.pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      PickedFile2 = File(imageFile.path);
      emit(UpdateProductImageSuccessStates());
    }
    else {
      var error = 'no Image selected';
      emit(UpdateProductImageErrorStates(error.toString()));
    }
  }
  final ImagePicker picker = ImagePicker();
  File? PickedFile;
  Future<void> getImage() async {
    final imageFile = await picker.pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      PickedFile = File(imageFile.path);
      emit(UpdateProductImageSuccessStates());
    }
    else {
      var error = 'no Image selected';
      emit(UpdateProductImageErrorStates(error.toString()));
    }
  }
  ////////////////////upload workshop/////////////
  String ImageUrl = '';
  String ud =  CacheHelper.getData(key: 'uId')??'';

  uploadPostImage({
    required String name,
    required String desc,
    required String location,
    required String type,
    required String age,
    required String area,
    required String nRooms,
    required String price,
  }) {
    emit(ImageintStates());
    FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(PickedFile2!.path).pathSegments.last}')
        .putFile(PickedFile2!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        String imageUrl1 = value;

        // Upload second image
        FirebaseStorage.instance
            .ref()
            .child('users/${Uri.file(PickedFile3!.path).pathSegments.last}')
            .putFile(PickedFile3!)
            .then((value) {
          value.ref.getDownloadURL().then((value) {
            String imageUrl2 = value;

            // Upload third image
            FirebaseStorage.instance
                .ref()
                .child('users/${Uri.file(PickedFile4!.path).pathSegments.last}')
                .putFile(PickedFile4!)
                .then((value) {
              value.ref.getDownloadURL().then((value) {
                String imageUrl3 = value;

                // Call createworkshop function with the image URLs
                createPost(
                  image1: imageUrl1,
                  image2: imageUrl2,
                  image3: imageUrl3,
                  name: name,
                  desc: desc,

                  location: location,
                  type: type,
                  age: age,
                  area: area,
                  nRooms: nRooms,
                  price: price,
                );

                PickedFile2 = null;
                PickedFile3 = null;
                PickedFile4 = null;
                emit(ImageSuccessStates());
              }).catchError((error) {
                emit(ImageErrorStates(error));
              });
            }).catchError((error) {
              emit(ImageErrorStates(error));
            });
          }).catchError((error) {
            emit(ImageErrorStates(error));
          });
        }).catchError((error) {
          emit(ImageErrorStates(error));
        });
      }).catchError((error) {
        emit(ImageErrorStates(error));
      });
    }).catchError((error) {
      emit(ImageErrorStates(error));
    });
  }
  void createPost({
    required String name,
    required String desc,
    required String age,
    required String area,
    required String location,
    required String nRooms,
    required String type,
    required String price,
    required String image1,
    required String image2,
    required String image3,
  }) {
    PostModel model = PostModel(
        age: age,
        name: name,
        description: desc,
        image: image1,
        image2: image2,
        image3: image3,
        location: location,
        type: type,
        area: area,
      price:price ,
      nRooms: nRooms,


    );


    FirebaseFirestore.instance.collection("category").add(model.Tomap())
        .then((value) {
      getPosts();
      emit(CreatePostSuccessState());
    }).catchError((error) {
      emit(CreatePostErrorStates(error.toString()));});


  }
  void createOrder({



    required String area,
    required String location,
    required String type,
    required String price,
    required String name,
    required String date,

  }) {
    OrderModel model = OrderModel(
      username:userdata!.name!=''||userdata!.name!=null?userdata!.name!:'' ,
      phone: userdata!.phone!=''||userdata!.phone!=null?userdata!.phone!:'',
      email: userdata!.email!=''||userdata!.email!=null?userdata!.email!:'',
        name: name,
        area: area,
        location: location,
        type: type,
        price:price ,
      date: date



    );

    emit(CreateOrderLoadingState());
    FirebaseFirestore.instance.collection("order").add(model.Tomap())
        .then((value) {

      emit(CreateOrderSuccessState());
    }).catchError((error) {
      emit(CreateOrderErrorStates(error.toString()));});


  }
  List<PostModel> posts=[];
  void getPosts() {

    posts.clear();
    emit(GetServiceLoadingStates());
    FirebaseFirestore.instance.collection('category')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        posts.add(PostModel.fromjson(element.data()));
      });
      emit(GetServiceSuccessStates());

    }).catchError((error) {
      emit(GetServiceStates(error.toString()));
    });
  }
  List<OrderModel> orders=[];
  void getOrders() {
    orders.clear();
    emit(GetOrdersLoadingStates());
    FirebaseFirestore.instance.collection('order').orderBy('date', descending: true)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        orders.add(OrderModel.fromjson(element.data()));
      });
      emit(GetOrdersSuccessStates());

    }).catchError((error) {
      emit(GetOrdersStates(error.toString()));
    });
  }
}