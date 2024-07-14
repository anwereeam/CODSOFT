// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../control/recipe_control.dart';

class MyIngred extends StatelessWidget {
  Recipe controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('${controller.recipedata[controller.index].title}')),
      body: Obx(
        () {
          return controller.loadData1 == true.obs
              ? Center(
                  child: CircularProgressIndicator(
                  color: Colors.deepPurple[80],
                ))
              : controller.ingradientdata.isEmpty
                  ? Center(
                      child: Text(
                      controller.error,
                      style: TextStyle(fontSize: 30),
                    ))
                  : ListView(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image(
                              errorBuilder: (context, error, stackTrace) {
                                return Text('image not found');
                              },
                              image: NetworkImage(controller
                                  .recipedata[controller.index].image),
                              height: 250,
                              width: double.infinity,
                              fit: BoxFit.cover),
                        ),
                        SizedBox(height: 15,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Ingredients (${controller.ingradientdata.length})',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 69, 69, 69)),),
                              MaterialButton(onPressed: (){},color: Color.fromARGB(255, 67, 146, 125),minWidth: 150, child: Text('Start Cooking',style: TextStyle(color: Colors.white,fontSize:18,fontWeight: FontWeight.bold ),),)
                            ],
                          ),
                        ),
                        SizedBox(height: 15,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: List.generate(
                            controller.ingradientdata.length,
                            (index) {
                              return Card(
                                surfaceTintColor:
                                    Color.fromARGB(255, 255, 255, 255),
                                child: ListTile(
                                  leading: Container(
                                      width: 50,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle),
                                      child: Icon(Icons.restaurant_menu)),
                                  title: Text(
                                    '${controller.ingradientdata[index].name}',
                                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Color.fromARGB(255, 69, 69, 69)),
                                  ),
                                  trailing: Text('${controller.ingradientdata[index].amount.metric.value} ${controller.ingradientdata[index].amount.metric.unit}',
                                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Color.fromARGB(255, 69, 69, 69)),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
        },
      ),
    );
  }
}
