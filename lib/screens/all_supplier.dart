import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:point_of_sale/model/db_handler.dart';
import 'package:point_of_sale/model/model.dart';

class AllSupplier extends StatefulWidget {
  const AllSupplier({Key? key}) : super(key: key);

  @override
  State<AllSupplier> createState() => _AllSupplierState();
}

class _AllSupplierState extends State<AllSupplier> {
  late DBHelper dbHelper;
  late Future<List<SaleItems>> allSupplier;

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
    loadData();
  }

  loadData() async {
    try {
      allSupplier = dbHelper.getSaleItems();
    } catch (e) {
      print('Error loading data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        title: const Text("All Supplier"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: allSupplier,
              builder: (context, AsyncSnapshot<List<SaleItems>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(0),
                          title: Text(snapshot.data![index].name.toString()),
                          subtitle:
                              Text(snapshot.data![index].phone.toString()),
                          leading: Text(snapshot.data![index].id.toString()),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
