import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipeapp/control/recipe_control.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});
  
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Recipe>(
      builder: (controller) {
        return BottomAppBar(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.favorite_border_rounded)),
              MaterialButton(
                onPressed: controller.instruction_condition == false.obs
                    ? () async {
                        controller.showdetails();
                      }
                    : () {
                        controller.showingred();
                      },
                color: const Color.fromARGB(255, 67, 146, 125),
                minWidth: MediaQuery.sizeOf(context).width * .80,
                height: 45,
                child: Text(
                  controller.instruction_condition == false.obs
                      ? 'Start Cooking'
                      : 'Ingredient',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
