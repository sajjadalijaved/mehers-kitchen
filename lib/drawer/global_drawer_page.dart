import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GlobalDrawer extends StatefulWidget {
  const GlobalDrawer({
    super.key,
  });

  @override
  State<GlobalDrawer> createState() => _GlobalDrawerState();
}

class _GlobalDrawerState extends State<GlobalDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0Xff62554c),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // ignore: sort_child_properties_last
          children: [
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              height: 30,
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.cancel,
                      size: 30,
                      color: Colors.yellow,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black,
                  ),
                  child: const Center(
                    child: Text(
                      'data',
                      style: TextStyle(color: Colors.yellow),
                    ),
                  )),
            ),
            const ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.yellow,
              ),
              title: Text(
                'Home',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            const Divider(
              height: 5,
              thickness: 2,
            ),
            const ListTile(
              leading: Icon(
                Icons.shopping_cart,
                color: Colors.yellow,
              ),
              title: Text(
                'My Cart',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            const Divider(
              height: 5,
              thickness: 2,
            ),
            const ListTile(
              leading: Icon(
                Icons.shopping_basket,
                color: Colors.yellow,
              ),
              title: Text(
                'My Order',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            const Divider(
              height: 5,
              thickness: 2,
            ),
            const ListTile(
              leading: Icon(
                Icons.logout,
                color: Colors.yellow,
              ),
              title: Text(
                'Sign Out',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
