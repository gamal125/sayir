import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sayir/models/OrderModel.dart';
import '../Cubit/AppCubit.dart';
import '../Cubit/AppStates.dart';


class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
List<OrderModel> orders=[];
  @override
  Widget build(BuildContext context) {

    return  BlocConsumer<AppCubit, AppStates>(
        listener:(context, state){
          if(state is GetOrdersSuccessStates){
           orders=AppCubit.get(context).orders;
          }
        },
        builder:(context, state)
        {
          return Scaffold(
              appBar: AppBar(
                systemOverlayStyle: SystemUiOverlayStyle( statusBarColor:  HexColor("#118C8C"), // Change the color here
                  statusBarIconBrightness: Brightness.light,),
                centerTitle: true,
                title: Text('الطلبات',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                iconTheme: const IconThemeData(color: Colors.white),backgroundColor: HexColor("#118C8C"),elevation: 1,),
              body: ConditionalBuilder(
                condition: state is ! GetOrdersLoadingStates,
                builder: (context) {
                  return ConditionalBuilder(
                    condition: orders.isNotEmpty,
                    builder: (context) {
                      return Container(
                        width:MediaQuery.of(context).size.width ,
                        height: MediaQuery.of(context).size.height,
                        decoration:   BoxDecoration(

                            color: HexColor("#118C8C")
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: ListView.builder(
                          itemCount: orders.length,
                          itemBuilder: (context, index) {
                            return Padding(
                                                padding: const EdgeInsets.symmetric(vertical: 18.0),
                                                child: Container(width:MediaQuery.of(context).size.width*0.9,
                                                  decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                                  color: Colors.white
                                                ),
                                                child: Column(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.all(5.0),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                        children: [
                                                          Expanded(child: Text(orders[index].name!,style: TextStyle(color:HexColor("#118C8C"),fontSize: 18 ,),textAlign: TextAlign.right,overflow: TextOverflow.ellipsis,)),

                                                          Padding(
                                                            padding: const EdgeInsets.symmetric(horizontal: 3.0),
                                                            child: Text(':  العميل',style: TextStyle(color:HexColor("#118C8C"),fontSize: 18 ),),
                                                          ),

                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.all(5.0),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                        children: [
                                                          Expanded(child: Text(orders[index].phone!,style: TextStyle(color:HexColor("#118C8C"),fontSize: 18 ,),textAlign: TextAlign.right,overflow: TextOverflow.ellipsis,)),

                                                          Padding(
                                                            padding: const EdgeInsets.symmetric(horizontal: 3.0),
                                                            child: Text(': الهاتف ',style: TextStyle(color:HexColor("#118C8C"),fontSize: 18 ),),
                                                          ),

                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.all(5.0),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                        children: [
                                                          Expanded(child: Text(orders[index].email!,style: TextStyle(color:HexColor("#118C8C"),fontSize: 18 ,),textAlign: TextAlign.right,overflow: TextOverflow.ellipsis,)),

                                                          Padding(
                                                            padding: const EdgeInsets.symmetric(horizontal: 3.0),
                                                            child: Text(': الايميل',style: TextStyle(color:HexColor("#118C8C"),fontSize: 18 ),),
                                                          ),

                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.all(5.0),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                        children: [
                                                          Expanded(child: Text(orders[index].name!,style: TextStyle(color:HexColor("#118C8C"),fontSize: 18 ,),textAlign: TextAlign.right,overflow: TextOverflow.ellipsis,)),

                                                          Padding(
                                                            padding: const EdgeInsets.symmetric(horizontal: 3.0),
                                                            child: Text(':  اسم العقار',style: TextStyle(color:HexColor("#118C8C"),fontSize: 18 ),),
                                                          ),

                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.all(5.0),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                        children: [
                                                          Expanded(child: Text(orders[index].location!,style: TextStyle(color:HexColor("#118C8C"),fontSize: 18 ,),textAlign: TextAlign.right,overflow: TextOverflow.ellipsis,)),

                                                          Padding(
                                                            padding: const EdgeInsets.symmetric(horizontal: 3.0),
                                                            child: Text(':  عنوان العميل',style: TextStyle(color:HexColor("#118C8C"),fontSize: 18 ),),
                                                          ),

                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.all(5.0),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                        children: [
                                                          Expanded(child: Text(orders[index].area!,style: TextStyle(color:HexColor("#118C8C"),fontSize: 18 ,),textAlign: TextAlign.right,overflow: TextOverflow.ellipsis,)),

                                                          Padding(
                                                            padding: const EdgeInsets.symmetric(horizontal: 3.0),
                                                            child: Text(':  مساحة العقار',style: TextStyle(color:HexColor("#118C8C"),fontSize: 18 ),),
                                                          ),

                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.all(5.0),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                        children: [
                                                          Expanded(child: Text(orders[index].type!,style: TextStyle(color:HexColor("#118C8C"),fontSize: 18 ,),textAlign: TextAlign.right,overflow: TextOverflow.ellipsis,)),

                                                          Padding(
                                                            padding: const EdgeInsets.symmetric(horizontal: 3.0),
                                                            child: Text(':      نوع العقار',style: TextStyle(color:HexColor("#118C8C"),fontSize: 18 ),),
                                                          ),

                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.all(5.0),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                        children: [
                                                          Expanded(child: Text(orders[index].price!,style: TextStyle(color:HexColor("#118C8C"),fontSize: 18 ,),textAlign: TextAlign.right,overflow: TextOverflow.ellipsis,)),

                                                          Padding(
                                                            padding: const EdgeInsets.symmetric(horizontal: 3.0),
                                                            child: Text(':     سعر العقار',style: TextStyle(color:HexColor("#118C8C"),fontSize: 18 ),),
                                                          ),

                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                ),
                                              );

                          }


                                                ),
                        )
                      );
                    }, fallback: (BuildContext context) { return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child:   Text('! لا توجد طلبات حتي الان',style: TextStyle(color:Colors.grey,fontSize: 18 ),)),
                    ); },
                  );
                }, fallback: (BuildContext context) { return Center(child: CircularProgressIndicator(color: Colors.white,),); },
              )
          );}
    );
  }
}
