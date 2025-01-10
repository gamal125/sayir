import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sayir/Componant/Componant.dart';
import 'package:sayir/register/cubit/cubit.dart';
import 'package:sayir/shared/local/bloc_observer.dart';
import 'package:sayir/shared/local/cache_helper.dart';

import 'AdminScreens/OrdersScreen.dart';
import 'AdminScreens/addPost.dart';
import 'Cubit/AppCubit.dart';
import 'Cubit/AppStates.dart';
import 'LoginScreen/LoginScreen.dart';
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
  var uId=CacheHelper.getData(key: 'uId');
  if(uId != null && uId !=''){

    widget=MyHomePage(title: '',);



  }
  else{

    widget=LoginScreen();



  }
  runApp( MyApp(startWidget: widget));
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
        title: 'Flutter Demo',
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
  var uId=CacheHelper.getData(key: 'uId');



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
                                Container(
                                  width: double.infinity,
                                  height: 300,
                                  color: Colors.white38,
                                  child: ListView.builder(
                            
                                    scrollDirection: Axis.horizontal,
                                      itemCount: posts.length,
                                      itemBuilder: (context, index) {
                            
                            
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                                          child: SizedBox(
                                            width: 290,
                                              height: 250,
                                            child: InkWell(
                                              onTap: (){navigateTo(context, DetailsScreen(post: posts[index], ud: uId,));},
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
                                                          ? Image.network(
                                                        posts[index].image!,
                                                        height: 180,
                                                        fit: BoxFit.fill,
                                                      ):posts[index].image2 != null
                                                          ? Image.network(
                                                        posts[index].image2!,
                                                        height: 180,
                                                        fit: BoxFit.fill,
                                                      ):posts[index].image3 != null
                                                          ? Image.network(
                                                        posts[index].image3 !,
                                                        height: 180,
                                                        fit: BoxFit.fill,
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
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Row(
                                                            children: [
                                                                              Text(
                                                                                posts[index].name!,
                                                                                style: const TextStyle(
                                                                                  fontSize: 18,
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                              ),
                                                                              const Spacer(),
                            
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
                            
                                      }
                                      ),
                            
                                  //////////
                                ),
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
                Padding(
                  padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.24,left: 10),
                  child: Container(
                    height: 140,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal, // Makes it horizontal
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return Padding(
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
                      },
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
}
