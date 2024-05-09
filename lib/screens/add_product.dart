import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/getwidget.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:point_of_sale/widgets/custom_textfield.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  List dropDownListData = [
    {"title": "Shoes", "value": "1"},
    {"title": "Watches", "value": "2"},
    {"title": "Mobiles", "value": "3"},
    {"title": "Laptops", "value": "4"},
    {"title": "Pens", "value": "5"},
  ];

  String? defualtvalue;
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
          title: const Text("Add Product"),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  const CustomTextField(
                    labletext: 'Product Name',
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10, right: 10, left: 10, bottom: 15),
                    child: InputDecorator(
                      decoration: const InputDecoration(
                        filled: false,
                        isDense: true,
                      ),
                      child: DropdownButton(
                          value: defualtvalue,
                          isExpanded: true,
                          isDense: true,
                          padding: const EdgeInsets.all(20),
                          menuMaxHeight: 400,
                          hint: const Text('Select Category'),
                          items: [
                            const DropdownMenuItem(
                              value: "",
                              child: Text(
                                "Select Category",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            ...dropDownListData
                                .map<DropdownMenuItem<String>>((e) {
                              return DropdownMenuItem(
                                value: e['value'],
                                child: Text(e['title']),
                              );
                            }),
                          ],
                          onChanged: (value) {
                            setState(() {
                              defualtvalue = value!;
                            });
                            // print("Selected product is $value");
                          }),
                    ),
                  ),
                  const CustomTextField(
                    labletext: "Description",
                  ),
                  CustomTextField(
                    labletext: "Price",
                    inputformatters: [FilteringTextInputFormatter.digitsOnly],
                    keyboardtype: TextInputType.number,
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
                        onPressed: () {},
                        shape: GFButtonShape.pills,
                        color: GFColors.TRANSPARENT,
                        size: 60,
                        hoverColor: GFColors.FOCUS,
                        focusColor: GFColors.SECONDARY,
                        fullWidthButton: false,
                        child: const Text(
                          'Add Product',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Jersey',
                            color: Colors.white,
                          ),
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
