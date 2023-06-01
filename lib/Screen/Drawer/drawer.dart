import 'package:flutter/material.dart';

import '../Payment/amount_received.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: Colors.blue[200],
        // backgroundColor: Colors.blue[100],
        child: ListView(
          // Important: Remove any padding from the ListView.
          // padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 100,
              child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                  ),
                  child: Image.asset(
                    'asset/images/dayimage.png',
                    height: 50,
                    fit: BoxFit.contain,
                  )),
            ),
            ListTile(
              leading: const Icon(
                Icons.desktop_mac_outlined,
              ),
              title: const Text('Dashboard'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ExpansionTile(
              title: const Text('Receive'),
              leading: const Icon(Icons.window),
              childrenPadding: const EdgeInsets.only(left: 30),
              children: [
                ListTile(
                  title: const Text('Cash'),
                  onTap: () {
                    // Get.toNamed()  AmountReceived
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AmountReceived(),
                      ),
                    );
                  },
                  // leading: const Icon(Icons.widgets),
                ),
                ListTile(
                  title: const Text('Bank'),
                  onTap: () {},
                  // leading: const Icon(Icons.widgets),
                ),
              ],
            ),
            ListTile(
              leading: const Icon(
                Icons.window_outlined,
              ),
              title: const Text('Stock'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ExpansionTile(
              title: const Text('Payment'),
              leading: const Icon(Icons.window),
              childrenPadding: const EdgeInsets.only(left: 60),
              children: [
                ListTile(
                  title: const Text('Cash'),
                  onTap: () {},
                  // leading: const Icon(Icons.widgets),
                ),
                ListTile(
                  title: const Text('Bank'),
                  onTap: () {},
                  // leading: const Icon(Icons.widgets),
                ),
              ],
            ),
            ExpansionTile(
              title: const Text('Sales and Income'),
              leading: const Icon(Icons.window),
              childrenPadding: const EdgeInsets.only(left: 60),
              children: [
                ListTile(
                  title: const Text('Cash Sales'),
                  onTap: () {},
                  // leading: const Icon(Icons.widgets),
                ),
                ListTile(
                  title: const Text('Bank Sales'),
                  onTap: () {},
                  // leading: const Icon(Icons.widgets),
                ),
              ],
            ),
            ExpansionTile(
              title: const Text('Purchase/Expenses'),
              leading: const Icon(Icons.window),
              childrenPadding: const EdgeInsets.only(left: 60),
              children: [
                ListTile(
                  title: const Text('Cash Purchase'),
                  onTap: () {},
                  // leading: const Icon(Icons.widgets),
                ),
                ListTile(
                  title: const Text('Credit Purchase'),
                  onTap: () {},
                  // leading: const Icon(Icons.widgets),
                ),
              ],
            ),
            ExpansionTile(
              title: const Text('Bank'),
              leading: const Icon(Icons.window),
              childrenPadding: const EdgeInsets.only(left: 60),
              children: [
                ListTile(
                  title: const Text('Withdrawal'),
                  onTap: () {},
                  // leading: const Icon(Icons.widgets),
                ),
                ListTile(
                  title: const Text('Deposit'),
                  onTap: () {},
                  // leading: const Icon(Icons.widgets),
                ),
              ],
            ),
            ListTile(
              leading: const Icon(
                Icons.window_outlined,
              ),
              title: const Text('Journal Voucher'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.window_outlined,
              ),
              title: const Text('Profit/Loss'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.window_outlined,
              ),
              title: const Text('Balance Sheet'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.window_outlined,
              ),
              title: const Text('Trail Balance'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ExpansionTile(
              title: const Text('Account Report'),
              leading: const Icon(Icons.settings_outlined),
              childrenPadding: const EdgeInsets.only(left: 60),
              children: [
                ListTile(
                  // title: const Text('Withdrawal'),
                  onTap: () {},
                  // leading: const Icon(Icons.widgets),
                ),
                ListTile(
                  // title: const Text('Deposit'),
                  onTap: () {},
                  // leading: const Icon(Icons.widgets),
                ),
              ],
            ),
            ExpansionTile(
              title: const Text('Day Book'),
              leading: const Icon(Icons.settings_outlined),
              childrenPadding: const EdgeInsets.only(left: 60),
              children: [
                ListTile(
                  // title: const Text('Withdrawal'),
                  onTap: () {},
                  // leading: const Icon(Icons.widgets),
                ),
                ListTile(
                  // title: const Text('Deposit'),
                  onTap: () {},
                  // leading: const Icon(Icons.widgets),
                ),
              ],
            ),
            ListTile(
              leading: const Icon(
                Icons.window_outlined,
              ),
              title: const Text('Trail Balance'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.help,
              ),
              title: const Text('About'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
