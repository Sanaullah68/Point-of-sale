import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class CashLedger extends StatelessWidget {
  const CashLedger({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController inAmountController = TextEditingController();
    TextEditingController OutAmountController = TextEditingController();
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.indigo, Colors.cyanAccent],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: GFAppBar(
          elevation: 0,
          title: Text("Cash Ledger"),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                'Item Name',
                style: TextStyle(fontFamily: "Jersey", fontSize: 25),
              ),
              subtitle: Text(
                "Amount",
                style: TextStyle(fontFamily: "Jersey", fontSize: 25),
              ),
              //Here is every thing which yu need for example on change or icon validator etc.
              trailing: Text(
                "In/out",
                style: TextStyle(fontFamily: "Jersey", fontSize: 25),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
