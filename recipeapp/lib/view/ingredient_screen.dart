// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipeapp/modules/bottom_nav.dart';

import '../control/recipe_control.dart';

class MyIngred extends StatelessWidget {
  Recipe controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<Recipe>(
        builder: (controller) {
          return controller.loadData1 == true.obs
              ? Center(
                  child: CircularProgressIndicator(
                  color: Colors.deepPurple[80],
                ))
              : /*controller.ingradientdata.isEmpty
                  ? Center(
                      child: Text(
                      controller.error,
                      style: TextStyle(fontSize: 30),
                    ))
                  : */ListView(
                      children: [
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Get.back();
                                },
                                icon: Icon(Icons.arrow_back_rounded)),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width * .3,
                            ),
                            Text(
                              'Recipe',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: ClipRRect(
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
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            '${controller.recipedata[controller.index].title}',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 69, 69, 69)),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            controller.instruction_condition == false.obs
                                ? 'Ingredients (${controller.ingradientdata.length})'
                                : 'Instructions (${controller.instrucdata[0].steps!.length})',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 69, 69, 69)),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: List.generate(
                            controller.instruction_condition == false.obs
                                ? controller.ingradientdata.length
                                : controller.instrucdata[0].steps!.length,
                            (index) {
                              return Card(
                                surfaceTintColor:
                                    Color.fromARGB(255, 255, 255, 255),
                                child: ListTile(
                                  leading: Container(
                                      width: 50,
                                      decoration:
                                          BoxDecoration(shape: BoxShape.circle),
                                      child: Icon(Icons.restaurant_menu)),
                                  title: Text(
                                    controller.instruction_condition ==
                                            false.obs
                                        ? '${controller.ingradientdata[index].name}'
                                        : '${controller.instrucdata[0].steps![index].step}',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromARGB(255, 69, 69, 69)),
                                  ),
                                  trailing: Text(
                                    controller.instruction_condition ==
                                            false.obs
                                        ? '${controller.ingradientdata[index].amount.metric.value} ${controller.ingradientdata[index].amount.metric.unit}'
                                        : 'step ${controller.instrucdata[0].steps![index].number}',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromARGB(255, 69, 69, 69)),
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
      bottomNavigationBar: BottomNav(),
    );
  }
}
