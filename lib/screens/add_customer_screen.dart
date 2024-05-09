import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:point_of_sale/widgets/custom_textfield.dart';

class AddCustomer extends StatelessWidget {
  const AddCustomer({super.key});

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
          title: const Text('Add Customer'),
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
                  const CustomTextField(
                    labletext: "Name",
                  ),
                  CustomTextField(
                    labletext: "Phone",
                  ),
                  const CustomTextField(
                    labletext: "Email",
                  ),
                  const CustomTextField(
                    labletext: "Address",
                  ),
                  CustomTextField(
                    labletext: "Create Password",
                    obscuretext: true,
                    sufixicon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.remove_red_eye_outlined),
                    ),
                  ),
                  CustomTextField(
                    labletext: "Confirm Password",
                    obscuretext: true,
                    sufixicon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.remove_red_eye_outlined),
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
                        onPressed: () {},
                        shape: GFButtonShape.pills,
                        color: GFColors.TRANSPARENT,
                        size: 60,
                        hoverColor: GFColors.FOCUS,
                        focusColor: GFColors.SECONDARY,
                        fullWidthButton: false,
                        child: const Text(
                          'Add Customer',
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
