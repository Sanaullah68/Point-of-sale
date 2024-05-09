import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:point_of_sale/model/db_handler.dart';
import 'package:point_of_sale/model/model.dart';
import 'package:point_of_sale/widgets/custom_textfield.dart';

class AddSupplier extends StatefulWidget {
  const AddSupplier({Key? key}) : super(key: key);

  @override
  State<AddSupplier> createState() => _AddSupplierState();
}

class _AddSupplierState extends State<AddSupplier> {
  late TextEditingController name;
  late TextEditingController phone;
  late TextEditingController email;
  late TextEditingController address;
  late TextEditingController password;
  late DBHelper dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
    name = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
    address = TextEditingController();
    password = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.indigo, Colors.redAccent],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: GFAppBar(
          elevation: 0,
          title: const Text('Add Supplier'),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomTextField(
                    controller: name,
                    labletext: "Name",
                  ),
                  CustomTextField(
                    controller: phone,
                    labletext: "Phone",
                  ),
                  CustomTextField(
                    controller: email,
                    labletext: "Email",
                  ),
                  CustomTextField(
                    controller: address,
                    labletext: "Address",
                  ),
                  CustomTextField(
                    controller: password,
                    labletext: "Create Password",
                    obscuretext: true,
                    sufixicon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.remove_red_eye_outlined),
                    ),
                  ),
                  CustomTextField(
                    labletext: "Confirm Password",
                    obscuretext: true,
                    sufixicon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.remove_red_eye_outlined),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: const LinearGradient(
                            colors: [Colors.blue, Colors.indigo],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft),
                      ),
                      child: GFButton(
                        padding: const EdgeInsets.only(left: 60, right: 60),
                        position: GFPosition.start,
                        onPressed: () {
                          if (dbHelper != null) {
                            if (email.text.isNotEmpty) {
                              dbHelper
                                  .insert(SaleItems(
                                name: name.text,
                                phone: phone.text,
                                email: email.text,
                                address: address.text,
                                password: password.text,
                              ))
                                  .then((value) {
                                print('data is added');
                              }).catchError((error) {
                                print('Error adding data: $error');
                              });
                            } else {
                              print('Email cannot be empty');
                            }
                          } else {
                            print('dbHelper is null');
                          }
                        },
                        shape: GFButtonShape.pills,
                        color: GFColors.TRANSPARENT,
                        size: 60,
                        hoverColor: GFColors.FOCUS,
                        focusColor: GFColors.SECONDARY,
                        fullWidthButton: false,
                        child: const Text(
                          'Add Supplier',
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Jersey',
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
