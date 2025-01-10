
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sayir/main.dart';

import '../Componant/Componant.dart';
import '../Cubit/AppCubit.dart';
import '../Cubit/AppStates.dart';


class AddService extends StatefulWidget {
  const AddService({super.key});

  @override
  State<AddService> createState() => _AddServiceState();
}

class _AddServiceState extends State<AddService> {
  final  formKey = GlobalKey<FormState>();
  final imageController = TextEditingController();
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final descController = TextEditingController();
  final areaController = TextEditingController();
  final ageController = TextEditingController();
  final locationController = TextEditingController();
  String selectedOption='1';
  String selectedOption2='شقق';
  @override
  Widget build(BuildContext context) {

    Size screenSiz = MediaQuery.of(context).size;
    var c= AppCubit.get(context);
    return  BlocConsumer<AppCubit, AppStates>(
        listener:(context, state){
          if(state is GetServiceSuccessStates){
            navigateAndFinish(context, MyHomePage(title: ''));}
        },
        builder:(context, state)
        {
          var image=c.PickedFile2;
          var image3=c.PickedFile3;
          var image4=c.PickedFile4;
          return Scaffold(

              appBar: AppBar(
                systemOverlayStyle: SystemUiOverlayStyle( statusBarColor:  HexColor("#118C8C"), // Change the color here
                  statusBarIconBrightness: Brightness.light,),
                centerTitle: true,
                title: Text('إضافة منشور',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                iconTheme: const IconThemeData(color: Colors.white),backgroundColor: HexColor("#118C8C"),elevation: 1,),
              body: Container(
                decoration:   BoxDecoration(
                    color: HexColor("#118C8C")
                ),
                child: GestureDetector(
                  onTap: (){ FocusManager.instance.primaryFocus?.unfocus();},
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

                                child: Column(
                                  children: [

                                    Container(
                                      decoration:  BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),

                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 10,left: 10,bottom:10),
                                        child: Column(children: [
                                          SingleChildScrollView(   scrollDirection: Axis.horizontal,
                                            child: Row(
                                              children: [
                                                InkWell(
                                                  onTap: (){
                                                    c.getImage2();
                                                  },
                                                  child: Container(
                                                    width: 250,
                                                    height: 250,

                                                    decoration: image != null ?
                                                    BoxDecoration(borderRadius: BorderRadius.circular(15), image: DecorationImage(image: FileImage(image),fit: BoxFit.fill ))
                                                        : BoxDecoration(borderRadius: BorderRadius.circular(15),image: const DecorationImage(image: NetworkImage(
                                                        'https://www.leedsandyorkpft.nhs.uk/advice-support/wp-content/uploads/sites/3/2021/06/pngtree-image-upload-icon-photo-upload-icon-png-image_2047546.jpg') ))
                                                    ,
                                                  ),
                                                ),
                                                const SizedBox(width:10,),
                                                InkWell(
                                                  onTap: (){
                                                    c.getImage3();
                                                  },
                                                  child: Container(
                                                    width: 250,
                                                    height: 250,

                                                    decoration: image3 != null ?
                                                    BoxDecoration(borderRadius: BorderRadius.circular(15), image: DecorationImage(image: FileImage(image3),fit: BoxFit.fill ))
                                                        :   BoxDecoration(borderRadius: BorderRadius.circular(15),image: DecorationImage(image: NetworkImage(
                                                        'https://www.leedsandyorkpft.nhs.uk/advice-support/wp-content/uploads/sites/3/2021/06/pngtree-image-upload-icon-photo-upload-icon-png-image_2047546.jpg') ))
                                                    ,
                                                  ),
                                                ),
                                                const SizedBox(width:10,),
                                                InkWell(
                                                  onTap: (){
                                                    c.getImage4();
                                                  },
                                                  child: Container(
                                                    width: 250,
                                                    height: 250,

                                                    decoration: image4 != null ?
                                                    BoxDecoration(borderRadius: BorderRadius.circular(15), image: DecorationImage(image: FileImage(image4),fit: BoxFit.fill ))
                                                        :  BoxDecoration(borderRadius: BorderRadius.circular(15),image: DecorationImage(image: NetworkImage(
                                                        'https://www.leedsandyorkpft.nhs.uk/advice-support/wp-content/uploads/sites/3/2021/06/pngtree-image-upload-icon-photo-upload-icon-png-image_2047546.jpg') ))
                                                    ,
                                                  ),
                                                ),
                                              ],
                                            ),),

                                          const SizedBox(
                                            height: 20,
                                          ),
                                          defaultTextFormField(
                                            onTap: (){

                                            },
                                            controller: nameController,
                                            keyboardType: TextInputType.text,
                                            prefix: Icons.person,
                                            validate: (String? value) {
                                              if (value!.isEmpty) {
                                                return 'اسم العقار ';
                                              }
                                              return null;
                                            },
                                            label: 'اسم العقار',
                                            hint: 'اسم العقار',
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          defaultTextFormField(
                                            onTap: (){

                                            },
                                            controller: priceController,
                                            keyboardType: TextInputType.number,
                                            prefix: Icons.attach_money_rounded,
                                            validate: (String? value) {
                                              if (value!.isEmpty) {
                                                return 'سعر العقار ';
                                              }
                                              return null;
                                            },
                                            label: 'سعر العقار ',
                                            hint: 'سعر العقار ',
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          defaultTextFormField(
                                            onTap: (){

                                            },
                                            controller: locationController,
                                            keyboardType: TextInputType.text,
                                            prefix: Icons.location_on,
                                            validate: (String? value) {
                                              if (value!.isEmpty) {
                                                return 'عنوان العقار ';
                                              }
                                              return null;
                                            },
                                            label: 'عنوان العقار',
                                            hint: 'عنوان العقار',
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          defaultTextFormField(
                                            onTap: (){

                                            },
                                            controller: areaController,
                                            keyboardType: TextInputType.number,
                                            prefix: Icons.location_city,
                                            validate: (String? value) {
                                              if (value!.isEmpty) {
                                                return 'مساحة العقار ';
                                              }
                                              return null;
                                            },
                                            label: 'مساحة العقار ',
                                            hint: 'مساحة العقار ',
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          defaultTextFormField(
                                            onTap: (){

                                            },
                                            controller: ageController,
                                            keyboardType: TextInputType.text,
                                            prefix: Icons.numbers,
                                            validate: (String? value) {
                                              if (value!.isEmpty) {
                                                return 'عمر العقار ';
                                              }
                                              return null;
                                            },
                                            label: 'عمر العقار',
                                            hint: 'عمر العقار',
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 7, vertical: 8),
                                                child: Text(
                                                  'الوصف',
                                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                                                child: Container(
                                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                                                  child: TextField(
                                                  
                                                    maxLines: 5,
                                                  
                                                    controller: descController,
                                                    decoration: const InputDecoration(
                                                      filled: true,
                                                      fillColor: Colors.white,
                                                  hintStyle:  TextStyle(fontSize: 16,fontWeight: FontWeight.normal,color: Colors.white),
                                                      hintText: 'الوصف',
                                                      enabledBorder:OutlineInputBorder(
                                                        borderRadius: BorderRadius.all(
                                                          Radius.circular(20.0),
                                                        ),
                                                        borderSide: BorderSide(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      border: InputBorder.none,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 8.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,

                                                  children: [
                                                    const Padding(
                                                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                                      child: Text(
                                                        'عدد الغرف',
                                                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),
                                                      ),
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(border: Border.all(color: Colors.white),borderRadius: BorderRadius.circular(12)),

                                                      child: Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                                                        child: DropdownButton<String>(
                                                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),
                                                          value: selectedOption,
                                                          dropdownColor:HexColor("#118C8C") ,
                                                          hint: const Text('عدد الغرف'),
                                                          onChanged: (newValue) {
                                                            setState(() {
                                                              selectedOption = newValue!;
                                                            });
                                                          },
                                                          items: const [
                                                            DropdownMenuItem(
                                                              value: '1',
                                                              child: Text('1'),
                                                            ),
                                                            DropdownMenuItem(
                                                              value: '2',
                                                              child: Text('2'),
                                                            ),
                                                            DropdownMenuItem(
                                                              value: '3',
                                                              child: Text('3'),
                                                            ),
                                                            DropdownMenuItem(
                                                              value: '4',
                                                              child: Text('4'),
                                                            ),
                                                            DropdownMenuItem(
                                                              value: '5',
                                                              child: Text('5'),
                                                            ),
                                                            DropdownMenuItem(
                                                              value: '6',
                                                              child: Text('6'),
                                                            ),
                                                            DropdownMenuItem(
                                                              value: '7',
                                                              child: Text('7'),
                                                            ),
                                                            DropdownMenuItem(
                                                              value: '8',
                                                              child: Text('8'),
                                                            ),
                                                            DropdownMenuItem(
                                                              value: '9',
                                                              child: Text('9'),
                                                            ),
                                                            DropdownMenuItem(
                                                              value: '10',
                                                              child: Text('10'),
                                                            ),
                                                            DropdownMenuItem(
                                                              value: '11',
                                                              child: Text('11'),
                                                            ),
                                                            DropdownMenuItem(
                                                              value: '12',
                                                              child: Text('12'),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),   Padding(
                                            padding: const EdgeInsets.only(left: 8.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,

                                                  children: [
                                                    const Padding(
                                                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                                      child: Text(
                                                        'نوع العقار',
                                                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),
                                                      ),
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(border: Border.all(color: Colors.white),borderRadius: BorderRadius.circular(12)),

                                                      child: Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                                                        child: DropdownButton<String>(
                                                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),
                                                          value: selectedOption2,
                                                          dropdownColor:HexColor("#118C8C") ,
                                                          hint: const Text('اختر نوع العقار' ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                                                          onChanged: (newValue) {
                                                            setState(() {
                                                              selectedOption2 = newValue!;
                                                            });
                                                          },
                                                          items: const [
                                                            DropdownMenuItem(
                                                              value: 'شقق',
                                                              child: Text('شقق'),
                                                            ),
                                                            DropdownMenuItem(
                                                              value: 'تاون هاوس',
                                                              child: Text('تاون هاوس'),
                                                            ),
                                                            DropdownMenuItem(
                                                              value: 'فيلا',
                                                              child: Text('فيلا'),
                                                            ),

                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          ConditionalBuilder(condition: state is! ImageintStates, builder: (context){return defaultMaterialButton(function: (){
                                            if (formKey.currentState!.validate()) {
                                              if(c.PickedFile2!=null) {
                                                c.PickedFile3 ??= c.PickedFile2;
                                                c.PickedFile4 ??= c.PickedFile2;


                                                c.uploadPostImage(
                                                  name: nameController.text,
                                                  desc: descController.text,
                                                  location: locationController
                                                      .text,
                                                  price: priceController.text,
                                                  type: selectedOption2,
                                                  age: ageController.text,
                                                  area: areaController.text,
                                                  nRooms: selectedOption,);
                                              }

                                              else{
                                                showToast(text:'please insert picture first', state: ToastStates.error);
                                              }
                                            }

                                          }, text: 'post');},
                                              fallback: (context){return
                                                Center(
                                                    child: LoadingAnimationWidget.inkDrop(
                                                      color: Colors.blue.withOpacity(.8),
                                                      size: screenSiz.width / 12,
                                                    ));
                                              })
                                        ]),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
          );}
    );
  }
}
