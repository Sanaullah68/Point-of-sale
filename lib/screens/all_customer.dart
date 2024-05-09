import 'package:flutter/material.dart';
import 'package:getwidget/components/appbar/gf_appbar.dart';
import 'package:getwidget/getwidget.dart';

class AllCustomer extends StatefulWidget {
  const AllCustomer({super.key});

  @override
  State<AllCustomer> createState() => _AllCustomerState();
}

class _AllCustomerState extends State<AllCustomer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        title: Text("All Customer"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const GFAvatar(
              backgroundImage: AssetImage("assets/user.png"),
            ),
            title: const Text("Name"),
            subtitle: const Text("Contact Number"),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.delete),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const GFAvatar(
              backgroundImage: AssetImage("assets/user.png"),
            ),
            title: const Text("Name"),
            subtitle: const Text("Contact Number"),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.delete),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const GFAvatar(
              backgroundImage: AssetImage("assets/user.png"),
            ),
            title: const Text("Name"),
            subtitle: const Text("Contact Number"),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.delete),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
