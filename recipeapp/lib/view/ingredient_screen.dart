// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../control/recipe_control.dart';

class MyIngred extends StatelessWidget {
  Recipe controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          //print(controller.i);
          //print(controller.ingradientdata.first.name);
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
                        AppBar(
                            title: Text(
                                '${controller.recipedata[controller.index].title}')),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(25),
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
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: List.generate(
                              controller.ingradientdata.length,
                              (index) {
                                return SingleChildScrollView(
                                  
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Text(
                                          '${controller.ingradientdata[index].amount.metric.value}  ${controller.ingradientdata[index].amount.metric.unit}  ${controller.ingradientdata[index].name}',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ),
                                      SizedBox(
                                        
                                        child: Divider(
                                          color:
                                              Color.fromARGB(255, 79, 67, 67),
                                          thickness: .5,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    );
        },
      ),
    );
  }
}
