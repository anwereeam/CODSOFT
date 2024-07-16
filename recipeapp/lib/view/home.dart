// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipeapp/control/recipe_control.dart';

class RecipeList extends StatelessWidget {
  Recipe controller=Get.put(Recipe(),permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
      Padding(
        padding: const EdgeInsets.only(top: 10,left: 15,right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello,',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 67, 146, 125)),
                ),
                Text('what you want to cook today',style:TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: Color.fromARGB(255, 69, 69, 69)) ,
                  ),
              ],
            ),
            CircleAvatar(
              backgroundImage: AssetImage('images/recipe_login.png'),
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
        child: TextField(  
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search_rounded),
            prefixIconColor: Color.fromARGB(202, 69, 69, 69) ,
            hintText: 'search by recieps',
            hintStyle: TextStyle(color: Color.fromARGB(202, 69, 69, 69),),
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color:Color.fromARGB(255, 67, 146, 125) ),
              borderRadius: BorderRadius.circular(15)
            ),
            fillColor: Color.fromARGB(24, 0, 0, 0),
            border: OutlineInputBorder(
              borderSide: BorderSide(color:Color.fromARGB(255, 67, 146, 125) ),
              borderRadius: BorderRadius.circular(15)
            )
          ),
        ),
      ),
      GetX<Recipe>(
        //init: Recipe(),
        builder: (controller) {
          return controller.loadData == true.obs
              ? Center(
                  child: CircularProgressIndicator(
                  color: Colors.deepPurple[80],
                ))
              : controller.recipedata.isEmpty
                  ? Center(
                      child: Text(
                      controller.error,
                      style: TextStyle(fontSize: 30),
                    ))
                  : Column(
                      children: List.generate(
                      controller.recipedata.length,
                      (index) {
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              InkWell(
                                splashColor:
                                    const Color.fromARGB(92, 104, 58, 183),
                                onTap: () async {
                                  controller.index = index;
                                  controller.getingerd(controller
                                      .recipedata[index].id
                                      .toString());
                                  //controller.getsteps(controller.index);
                                  await controller.getsteps(controller
                                      .recipedata[controller.index].id);
                                  controller.showingred();
                                  Get.toNamed('/ingred');
                                },
                                child: Stack(children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child: Image(
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Text('image not found');
                                        },
                                        image: NetworkImage(
                                            controller.recipedata[index].image),
                                        height: 250,
                                        width: double.infinity,
                                        fit: BoxFit.cover),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        gradient: LinearGradient(
                                          colors: [
                                            Colors.black.withOpacity(0),
                                            Colors.black.withOpacity(.5)
                                          ],
                                          begin: Alignment.centerRight,
                                          end: Alignment.bottomRight,
                                        )),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 15),
                                    height: 250,
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      controller.recipedata[index].title,
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255),
                                      ),
                                    ),
                                  ),
                                  Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.black.withOpacity(0),
                                              Colors.black.withOpacity(.1)
                                            ],
                                            begin: Alignment.centerRight,
                                            end: Alignment.topRight,
                                          )),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 10),
                                      height: 250,
                                      alignment: Alignment.topRight,
                                      child: FloatingActionButton(
                                        mini: true,
                                        shape: CircleBorder(),
                                        onPressed: () {},
                                        child: Icon(
                                            Icons.favorite_outline_rounded),
                                        foregroundColor:
                                            Color.fromARGB(255, 67, 146, 125),
                                        //iconSize: 30,
                                        backgroundColor: Colors.white,
                                      )),
                                ]),
                              ),
                            ],
                          ),
                        );
                      },
                    ));
        },
      ),
    ]));
  }
}