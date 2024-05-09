import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class CashInHand extends StatelessWidget {
  const CashInHand({super.key});

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
          title: const Text("Cash in Hand"),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(130.0),
          child: Column(
            children: [
              Container(
                height: 100,
                width: 450,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: const Center(
                  child: Text(
                    "All Cash In Hand",
                    style: TextStyle(
                      //fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
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
                    padding: const EdgeInsets.only(left: 0, right: 0),
                    onPressed: () {},
                    shape: GFButtonShape.pills,
                    color: GFColors.TRANSPARENT,
                    size: 60,
                    hoverColor: GFColors.FOCUS,
                    focusColor: GFColors.SECONDARY,
                    fullWidthButton: false,
                    child: const Text(
                      'Update',
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
    );
  }
}
