import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  Function onDrawerClick;

  DrawerWidget(this.onDrawerClick);

  static int CATEGORY = 1;
  static int Settings = 2;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width * .6,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .1,
              color: Color(0xFF39A552),
              child: Text(
                "News App!",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: InkWell(
                onTap: () {
                  onDrawerClick(CATEGORY);
                },
                child: Row(
                  children: const [
                    Icon(
                      Icons.list,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Categories",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: InkWell(
                onTap: () {
                  onDrawerClick(Settings);
                },
                child: Row(
                  children: const [
                    Icon(
                      Icons.settings,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Settings",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
