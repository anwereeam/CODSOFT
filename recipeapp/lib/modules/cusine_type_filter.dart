import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipeapp/control/recipe_control.dart';

class CusineType extends StatelessWidget {
  //const CusineType({super.key});
  List cusine = ['main course','side dish','appetizer', 'breakfast', 'salad', 'soup','drink','dessert','bread','snack','fingerfood'];
  Recipe controller=Get.find();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
              cusine.length,
              (index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                      onPressed: ()async {
                        await controller.makeRequest(type: cusine[index]);
                      },
                      color: Color.fromARGB(255, 243, 243, 243),
                      child: Text(
                        cusine[index],
                        style: const TextStyle(
                            color: Color.fromARGB(255, 155, 155, 155),
                            fontSize: 16),
                      ),
                    ),
              )),
        ),
      ),
    );
  }
}
