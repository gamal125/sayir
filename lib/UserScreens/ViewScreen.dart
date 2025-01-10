import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

import '../Componant/Componant.dart';
import 'DetailsScreen.dart';
class ViewScreen extends StatelessWidget {
  const ViewScreen({super.key,required this.posts,required this.uId,});
final List posts;
final String uId;
  @override
  Widget build(BuildContext context) {

    return   Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle( statusBarColor:  HexColor("#118C8C"), // Change the color here
          statusBarIconBrightness: Brightness.light,),
        iconTheme: const IconThemeData(color: Colors.white),backgroundColor: HexColor("#118C8C"),elevation: 1,),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(


            itemCount: posts.length,
            itemBuilder: (context, index) {


              return Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(


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
      ),
    );
  }
}
