import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import 'package:point_of_sale/classes/dashboard_items.dart';
import 'package:point_of_sale/classes/screens.dart';
import 'package:point_of_sale/screens/add_supplier.dart';
import 'package:point_of_sale/screens/profile_screen.dart';
import 'package:point_of_sale/screens/sale_details_screen.dart';

import 'add_customer_screen.dart';
import 'add_product.dart';
import 'all_customer.dart';
import 'all_supplier.dart';
import 'cash_in_hand.dart';
import 'cash_ledger.dart';
import 'sale_screen.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List _items = [
    Data(images: "assets/direct-marketing.png", text: "Sale"),
    Data(images: "assets/queue.png", text: "Add Customer"),
    Data(images: "assets/supplier.png", text: "Add Supplier"),
    Data(images: "assets/shopping-cart.png", text: "Add Product"),
    Data(images: "assets/journal.png", text: "Cash Ledger"),
    Data(images: "assets/money.png", text: "Cash in Hand"),
    Data(images: "assets/analytics.png", text: "Sale Details"),
    Data(images: "assets/consultant.png", text: "All Customer"),
    Data(images: "assets/inventory.png", text: "All All Supplier"),
  ];

  final List _screens = [
    Screen(page: const SaleScreen()),
    Screen(page: const AddCustomer()),
    Screen(page: const AddSupplier()),
    Screen(page: const AddProduct()),
    Screen(page: const CashLedger()),
    Screen(page: const CashInHand()),
    Screen(page: const SaleDetails()),
    Screen(page: const AllCustomer()),
    Screen(page: const AllSupplier()),
  ];

  @override
  Widget build(BuildContext context) {
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
          leading: Builder(
            builder: (context) => IconButton(
              icon: new Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          title: const Text('Dashboard'),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
        ),
        drawer: GFDrawer(
          child: ListView(
            children: [
              const GFDrawerHeader(
                centerAlign: false,
                currentAccountPicture: GFAvatar(
                  radius: 80.0,
                  backgroundImage: AssetImage("assets/me.jpg"),
                  size: 100,
                ),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.purple, Colors.red],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft)),
                otherAccountsPictures: <Widget>[
                  GFAvatar(
                    backgroundImage: AssetImage("assets/me.jpg"),
                  )
                ],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Sanaullah@gmail.com',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ],
                ),
              ),
              const ListTile(
                leading: Icon(
                  Icons.home_outlined,
                  size: 30,
                ),
                title: Text(
                  'Home',
                  style: TextStyle(fontFamily: "jersey", fontSize: 20),
                ),
                onTap: null,
                iconColor: Colors.indigo,
              ),
              ListTile(
                leading: const Icon(
                  Icons.perm_identity,
                  size: 30,
                ),
                title: const Text(
                  'Profile',
                  style: TextStyle(fontFamily: "jersey", fontSize: 20),
                ),
                onTap: () {
                  Get.to(() => const ProfileScreen());
                },
                iconColor: Colors.indigo,
              ),
              const ListTile(
                leading: Icon(
                  Icons.dashboard,
                  size: 30,
                ),
                title: Text(
                  'Dashboard',
                  style: TextStyle(fontFamily: "jersey", fontSize: 20),
                ),
                onTap: null,
                iconColor: Colors.indigo,
              ),
              const ListTile(
                leading: Icon(
                  Icons.logout,
                  size: 30,
                ),
                title: Text(
                  'Logout',
                  style: TextStyle(fontFamily: "jersey", fontSize: 20),
                ),
                onTap: null,
                iconColor: Colors.indigo,
              ),
              ListTile(
                leading: const Icon(
                  Icons.dark_mode_outlined,
                  size: 30,
                ),
                title: const Text(
                  'Dark Mode',
                  style: TextStyle(fontFamily: "jersey", fontSize: 20),
                ),
                onTap: () {
                  Get.changeTheme(ThemeData.dark());
                },
                iconColor: Colors.indigo,
              ),
              ListTile(
                leading: const Icon(
                  Icons.light_mode_outlined,
                  size: 30,
                ),
                title: const Text(
                  'Light Mode',
                  style: TextStyle(fontFamily: "jersey", fontSize: 20),
                ),
                onTap: () {
                  Get.changeTheme(ThemeData.light());
                },
                iconColor: Colors.indigo,
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconSize: 30,
          currentIndex: 0,
          items: [
            BottomNavigationBarItem(
              label: "Home",
              icon: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.home_filled,
                ),
              ),
            ),
            BottomNavigationBarItem(
              label: "Cart",
              icon: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_cart,
                ),
              ),
            ),
            BottomNavigationBarItem(
              label: "Wallet",
              icon: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.wallet,
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: GridView.builder(
            itemCount: _items.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(_screens[index].page);
                    },
                    child: GFAvatar(
                      size: 100,
                      backgroundColor: Colors.lightBlue,
                      backgroundImage: AssetImage(_items[index].images),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    _items[index].text,
                    style: const TextStyle(fontFamily: "Jersey", fontSize: 17),
                  ),
                ],
              );
            },
            //controller: PageController(),
          ),
        ),
      ),
    );
  }
}
