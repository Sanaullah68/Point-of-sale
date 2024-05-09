import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:getwidget/components/image/gf_image_overlay.dart';
import 'package:getwidget/getwidget.dart';

class SaleScreen extends StatelessWidget {
  const SaleScreen({super.key});

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
          title: const Text('Sales'),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              StaggeredGrid.count(
                crossAxisCount: 4,
                mainAxisSpacing: 6,
                crossAxisSpacing: 6,
                children: [
                  StaggeredGridTile.count(
                    crossAxisCellCount: 4,
                    mainAxisCellCount: 2,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            //border: Border.all(color: Colors.black),
                            ),
                        child: Image.asset(
                          "assets/shoes.png",
                        ),
                      ),
                    ),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 2,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            //border: Border.all(color: Colors.black),
                            ),
                        child: Image.asset('assets/watch.png'),
                      ),
                    ),
                  ),
                  StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 3,
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              //border: Border.all(color: Colors.black),
                              ),
                          child: Image.asset(
                            "assets/glasses.png",
                          ),
                        ),
                      )),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 2,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            //border: Border.all(color: Colors.black),
                            ),
                        child: Image.asset(
                          "assets/phone.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 2,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            //border: Border.all(color: Colors.black),
                            ),
                        child: Image.asset("assets/laptop.png"),
                      ),
                    ),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 2,
                    child: Container(
                      decoration: BoxDecoration(
                          //border: Border.all(color: Colors.black),
                          ),
                      child: Image.asset("assets/pen.png"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
