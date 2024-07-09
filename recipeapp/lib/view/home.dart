// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipeapp/control/recipe_control.dart';

class RecipeList extends StatelessWidget {
  //const RecipeList({super.key});
  Recipe controller=Get.put(Recipe(),permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.restaurant_menu_rounded),
              Text(' Food Recipe'),
            ],
          ),
        ),
        body:
         Obx(
          //init: Recipe(),
           () {
            //controller.getrecipes();
            return controller.loadData==true.obs?Center(child: CircularProgressIndicator(color: Colors.deepPurple[80],)):
            controller.recipedata.isEmpty?Center(child: Text(controller.error,style: TextStyle(fontSize: 30),)):
            ListView.builder(
              itemCount: controller.recipedata.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      InkWell(
                        splashColor: const Color.fromARGB(92, 104, 58, 183),
                        onTap: (){
                          controller.index=index;
                          
                          controller.set_i(controller.recipedata[controller.index].id.toString());
                          //controller.get_ingred();
                          Get.toNamed('/ingred');
                        
                        },
                        child: Stack(children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image(
                              errorBuilder: (context, error, stackTrace) {
                                return Text('image not found');
                              },
                                image:NetworkImage(controller.recipedata[index].image),
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
                            padding:
                                EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                            height: 250,
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              controller.recipedata[index].title,
                              style: TextStyle(fontSize: 25, color: const Color.fromARGB(255, 255, 255, 255),),
                            ),
                          ),
                        ]),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        ));
  }
}
