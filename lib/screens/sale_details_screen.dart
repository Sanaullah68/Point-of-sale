import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:point_of_sale/widgets/custom_textfield.dart';

class SaleDetails extends StatelessWidget {
  const SaleDetails({super.key});

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
          title: const Text("Sales Details"),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                const CustomTextField(labletext: "Item Code"),
                const CustomTextField(labletext: "Item Name"),
                CustomTextField(
                  labletext: "Quantity",
                  sufixicon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add),
                  ),
                ),
                const CustomTextField(labletext: "Unit"),
                const CustomTextField(labletext: "Discount%"),
                const CustomTextField(labletext: "Price"),
                const CustomTextField(labletext: "Total Price"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
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
                      size: 50,
                      hoverColor: GFColors.FOCUS,
                      focusColor: GFColors.SECONDARY,
                      fullWidthButton: false,
                      child: const Text(
                        'Save',
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
    );
  }
}
