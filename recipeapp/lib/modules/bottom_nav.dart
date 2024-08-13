import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipeapp/control/recipe_control.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
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
                  onPressed: controller.fav_cond.value == false
                      ? ()async {
                          await controller.addToFavorites(
                              controller.recipedata[controller.index].id.toString(), {
                            'image':
                                controller.recipedata[controller.index].image,
                            'title':
                                controller.recipedata[controller.index].title
                          });
                          controller.fav_cond = true.obs;
                          setState(() {});
                        }
                      : ()async {
                          await controller.removeFromFavorites(controller.recipedata[controller.index].id.toString());
                          controller.fav_cond = false.obs;
                          setState(() {});
                        },
                  icon: controller.fav_cond.value == false
                      ? const Icon(Icons.favorite_border_rounded)
                      : Icon(
                          Icons.favorite_rounded,
                          color: const Color.fromARGB(255, 67, 146, 125),
                        )),
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
