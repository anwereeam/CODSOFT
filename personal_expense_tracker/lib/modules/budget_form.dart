import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_expense_tracker/control/add_controller.dart';
class BudgetForm extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  AddController outcontrol=Get.find();
  final TextEditingController budget=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
                    color: Color.fromARGB(255, 180, 180, 180),
                    child: Form(
                      key: formKey,
                      child: TextFormField(
                        
                        validator: (value) {
                          if(value!.isEmpty || value.removeAllWhitespace.contains(',')|| value.contains(' ') )
                            {
                              return 'budget is required, must be integer, and musn\'t contain white space';
                            }
                            else if(num.parse(value)is double)
                            {
                              return 'budget must be integer';
                            }
                            else if(int.parse(value).isNegative)
                            {
                              return 'budget must be positive';
                            }
                          return null;
                        },
                        keyboardType: TextInputType.numberWithOptions(signed: true,),
                        controller: budget,
                        decoration:  InputDecoration(
                          suffixIcon: IconButton(icon: Icon(Icons.save_rounded),
                          onPressed: (){
                            if (formKey.currentState!.validate()) {
                                  
                                  outcontrol.budget_update(int.parse(budget.text.removeAllWhitespace).obs);
                                  budget.clear();
                                }
                          },),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          hintText: 'set monthly budget',
                        ),
                      ),
                    ),
                  );
  }
}