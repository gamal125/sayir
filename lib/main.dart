import 'dart:ui';



import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sayir/Componant/Componant.dart';
import 'package:sayir/register/cubit/cubit.dart';
import 'package:sayir/shared/local/bloc_observer.dart';
import 'package:sayir/shared/local/cache_helper.dart';
import 'package:sayir/welcome_screen.dart';

import 'AdminScreens/OrdersScreen.dart';
import 'AdminScreens/addPost.dart';
import 'Cubit/AppCubit.dart';
import 'Cubit/AppStates.dart';
import 'UserScreens/CustomerProfileScreen.dart';
import 'UserScreens/DetailsScreen.dart';
import 'UserScreens/ViewScreen.dart';
import 'firebase_options.dart';

import 'package:flutter/material.dart';

import 'models/PostModel.dart';

Future<void> main() async {
  Widget widget;
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );










  runApp( MyApp(startWidget: WelcomeScreen()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key,   required this.startWidget});
 final Widget startWidget;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor:  HexColor("#118C8C"), // Change the color here
      statusBarIconBrightness: Brightness.light, // Light icons
    ));
    var uId=CacheHelper.getData(key: 'uId');
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubit()..getUser(uId)..getPosts()),
        BlocProvider(create: (context) => RegisterCubit()..getUser(uId)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ساير',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: startWidget
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var name='';
  List<PostModel> posts=[];
  List<String> categories=['شقق','فيلا','تاون هاوس'];

  var uId=CacheHelper.getData(key: 'uId')??'';



  @override
  Widget build(BuildContext context) {




    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          if (state is GetUserSuccessState) {

              name=  state.name;





          }
          if (state is GetServiceSuccessStates) {
              posts=  AppCubit.get(context).posts;

          }

        },
      builder: (context, state) {
        return Scaffold(

          body: SafeArea(
            child:Stack(

              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                        flex: 1,
                        child: Container(
                          color: HexColor("#118C8C"),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,

                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                               uId  == '5wJWxLCo1VaQEwTO6ftLWqYcJsI2'?  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Row(

                                      children: [
                                    Icon(Icons.list,color: Colors.white,),
                                        TextButton(onPressed: (){
                                          AppCubit.get(context).getOrders();
                                          navigateTo(context, OrdersScreen());
                                        },child: Text('الطلبات',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),)

                                      ],
                                    ),
                                  ):SizedBox(),
                                  IconButton(onPressed: (){navigateTo(context, CustomerProfileScreen());}, icon: Icon(Icons.person,color: Colors.white,)),

                                ],
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                    Text(name,style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal,color: Colors.white),),
                                        Text('  حياك الله  ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),

                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text('كيف نقدر نخدمك؟',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )),
                    Expanded(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsetsDirectional.only(top: MediaQuery.of(context).size.height*0.11,start: 10,end: 10),
                          child: SingleChildScrollView(
                            child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text('المشاريع',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold ),),
                                posts.isEmpty?       Text('لا توجد عقارات الان!',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold ),):
                                Container(
                                  width: double.infinity,
                               height: height(context)/2,
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
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
                Padding(
                  padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.24,),
                  child: SizedBox(
                    height: 150,

                    child: Padding(

                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          card(0),
                          card(1),
                          card(2),

                        ],
                      ),
                    ),
                  ),

                )
              ],
            )
          ),
          floatingActionButton: uId=="5wJWxLCo1VaQEwTO6ftLWqYcJsI2"? FloatingActionButton(
            onPressed: (){
              navigateTo(context, AddService());
            },
            backgroundColor:HexColor("#118C8C") ,
            child: const Icon(Icons.add,color: Colors.white,),
          ):SizedBox(), // This trailing comma makes auto-formatting nicer for build methods.
        );
      }
    );
  }
Widget card(int index,)=>     Padding(
  padding: const EdgeInsets.symmetric(horizontal: 7.0),
  child: InkWell(
  onTap: (){
  navigateTo(context, ViewScreen(posts: posts,uId: uId));
  },
  child: Container(
  width: 110,

  decoration: BoxDecoration(color: Colors.orange,borderRadius: BorderRadius.circular(10)),
  padding: const EdgeInsets.all(16.0),
  child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
  Container(
  width: 60,
  height: 60,
  decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.orange[300]),
  child: Icon(
  Icons.home, // Replace with your desired icon
  size: 40,
  color: Colors.white,
  ),
  ),
  SizedBox(height: 10),
  Text(
  categories[index],
  style: TextStyle(
  fontSize: 16,
  color: Colors.white,
  fontWeight: FontWeight.bold,
  ),
  textAlign: TextAlign.center,
  ),
  ],
  ),
  ),
  ),
  );

}
