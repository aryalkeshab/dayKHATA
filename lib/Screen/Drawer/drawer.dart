import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/Core/resources/colors.dart';
import 'package:my_app/Core/routes/app_pages.dart';

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
        child: ListView(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text('Welcome Binayak Pokhrel'),
                InkWell(
                  onTap: () {
                    Get.toNamed(Routes.login);
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: const Offset(0, 3),
                            ),
                          ],
                          color: Colors.blue[100],
                          borderRadius: BorderRadius.circular(50)),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.logout_outlined,
                        ),
                      )),
                ),
              ],
            ),
            const Divider(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  buildDrawerItem(
                    text: 'Dashboard',
                    icon: Icons.computer_outlined,
                    textIconColor: Get.currentRoute == Routes.dashboard
                        ? Colors.white
                        : Colors.black,
                    tileColor: Get.currentRoute == Routes.dashboard
                        ? primarycolor
                        : null,
                    onTap: () => navigate(0),
                  ),
                  ExpansionTile(
                    title: const Text('Receive'),
                    leading: const Icon(Icons.window),
                    // initiallyExpanded: true,
                    initiallyExpanded:
                        Get.currentRoute == Routes.amountReceived ||
                            Get.currentRoute == Routes.amountPayment,

                    // childrenPadding: const EdgeInsets.only(left: 55),
                    children: [
                      buildDrawerItem(
                        text: 'Cash',
                        textIconColor: Get.currentRoute == Routes.amountReceived
                            ? Colors.white
                            : Colors.black,
                        tileColor: Get.currentRoute == Routes.amountReceived
                            ? primarycolor
                            : null,
                        onTap: () => navigate(1),
                      ),
                      buildDrawerItem(
                        text: 'Bank',
                        textIconColor: Get.currentRoute == Routes.amountPayment
                            ? Colors.white
                            : Colors.black,
                        tileColor: Get.currentRoute == Routes.amountPayment
                            ? primarycolor
                            : null,
                        onTap: () => navigate(2),
                      ),
                    ],
                  ),
                  buildDrawerItem(
                    text: 'Stock',
                    icon: Icons.window,
                    textIconColor: Get.currentRoute == Routes.stock
                        ? Colors.white
                        : Colors.black,
                    tileColor:
                        Get.currentRoute == Routes.stock ? primarycolor : null,
                    onTap: () => navigate(3),
                  ),
                  ExpansionTile(
                    title: const Text('Payment'),
                    leading: const Icon(Icons.window),
                    initiallyExpanded:
                        Get.currentRoute == Routes.amountPayment ||
                            Get.currentRoute == Routes.amountReceived,
                    children: [
                      buildDrawerItem(
                        text: 'Cash',
                        textIconColor: Get.currentRoute == Routes.amountPayment
                            ? Colors.white
                            : Colors.black,
                        tileColor: Get.currentRoute == Routes.amountPayment
                            ? primarycolor
                            : null,
                        onTap: () => navigate(4),
                      ),
                      buildDrawerItem(
                        text: 'Bank',
                        textIconColor: Get.currentRoute == Routes.amountReceived
                            ? Colors.white
                            : Colors.black,
                        tileColor: Get.currentRoute == Routes.amountReceived
                            ? primarycolor
                            : null,
                        onTap: () => navigate(5),
                      ),
                    ],
                  ),
                  const ExpansionTile(
                    title: Text('Sales and Income'),
                    leading: Icon(Icons.window),
                    // initiallyExpanded: true,
                    // childrenPadding: const EdgeInsets.only(left: 55),
                    children: [
                      // buildDrawerItem(
                      //   text: 'Cash Sales',
                      //   textIconColor: Get.currentRoute == Routes.purchaseCash
                      //       ? Colors.white
                      //       : Colors.black,
                      //   tileColor: Get.currentRoute == Routes.purchaseCash
                      //       ? primarycolor
                      //       : null,
                      //   onTap: () => navigate(6),
                      // ),
                      // buildDrawerItem(
                      //   text: 'Credit Sales',
                      //   textIconColor: Get.currentRoute == Routes.purchaseCredit
                      //       ? Colors.white
                      //       : Colors.black,
                      //   tileColor: Get.currentRoute == Routes.purchaseCredit
                      //       ? primarycolor
                      //       : null,
                      //   onTap: () => navigate(7),
                      // ),
                    ],
                  ),
                  ExpansionTile(
                    title: const Text('Purchase / Expenses'),
                    // initiallyExpanded: true,
                    leading: const Icon(Icons.window),
                    initiallyExpanded:
                        Get.currentRoute == Routes.purchaseCash ||
                            Get.currentRoute == Routes.purchaseCredit,
                    // childrenPadding: const EdgeInsets.only(left: 55),
                    children: [
                      buildDrawerItem(
                        text: 'Cash Purchase',
                        textIconColor: Get.currentRoute == Routes.purchaseCash
                            ? Colors.white
                            : Colors.black,
                        tileColor: Get.currentRoute == Routes.purchaseCash
                            ? primarycolor
                            : null,
                        onTap: () => navigate(8),
                      ),
                      buildDrawerItem(
                        text: 'Credit Purchase',
                        textIconColor: Get.currentRoute == Routes.purchaseCredit
                            ? Colors.white
                            : Colors.black,
                        tileColor: Get.currentRoute == Routes.purchaseCredit
                            ? primarycolor
                            : null,
                        onTap: () => navigate(9),
                      ),
                    ],
                  ),
                  const ExpansionTile(
                    title: Text('Bank'),
                    // initiallyExpanded: true,
                    leading: Icon(Icons.window),
                    // childrenPadding: const EdgeInsets.only(left: 55),
                    children: [
                      // buildDrawerItem(
                      //   text: 'Withdrawal',
                      //   textIconColor: Get.currentRoute == Routes.purchaseCash
                      //       ? Colors.white
                      //       : Colors.black,
                      //   tileColor: Get.currentRoute == Routes.purchaseCash
                      //       ? primarycolor
                      //       : null,
                      //   onTap: () => navigate(8),
                      // ),
                      // buildDrawerItem(
                      //   text: 'Deposit',
                      //   textIconColor: Get.currentRoute == Routes.purchaseCredit
                      //       ? Colors.white
                      //       : Colors.black,
                      //   tileColor: Get.currentRoute == Routes.purchaseCredit
                      //       ? primarycolor
                      //       : null,
                      //   onTap: () => navigate(9),
                      // ),
                    ],
                  ),
                  buildDrawerItem(
                    text: 'Journal Voucher',
                    icon: Icons.window,
                    textIconColor: Get.currentRoute == Routes.journalVoucher
                        ? Colors.white
                        : Colors.black,
                    tileColor: Get.currentRoute == Routes.journalVoucher
                        ? primarycolor
                        : null,
                    onTap: () => navigate(12),
                  ),
                  ExpansionTile(
                    title: const Text('Account Report'),
                    leading: const Icon(Icons.settings_outlined),
                    childrenPadding: const EdgeInsets.only(left: 5),
                    children: [
                      buildDrawerItem(
                        text: 'Profit/Losss',
                        textIconColor: Get.currentRoute == Routes.profitAndLoss
                            ? Colors.white
                            : Colors.black,
                        tileColor: Get.currentRoute == Routes.profitAndLoss
                            ? primarycolor
                            : null,
                        onTap: () => navigate(13),
                      ),
                      buildDrawerItem(
                        text: 'Balance Sheet',
                        textIconColor: Get.currentRoute == Routes.balanceSheet
                            ? Colors.white
                            : Colors.black,
                        tileColor: Get.currentRoute == Routes.balanceSheet
                            ? primarycolor
                            : null,
                        onTap: () => navigate(14),
                      ),
                      buildDrawerItem(
                        text: 'Trail Balance',
                        textIconColor: Get.currentRoute == Routes.trailBalance
                            ? Colors.white
                            : Colors.black,
                        tileColor: Get.currentRoute == Routes.trailBalance
                            ? primarycolor
                            : null,
                        onTap: () => navigate(14),
                      ),
                      buildDrawerItem(
                        text: 'Day Book',
                        textIconColor: Get.currentRoute == Routes.dayBook
                            ? Colors.white
                            : Colors.black,
                        tileColor: Get.currentRoute == Routes.dayBook
                            ? primarycolor
                            : null,
                        onTap: () => navigate(14),
                      ),
                    ],
                  ),
                  buildDrawerItem(
                    text: 'About Us',
                    icon: Icons.help,
                    textIconColor: Get.currentRoute == Routes.aboutUs
                        ? Colors.white
                        : Colors.black,
                    tileColor: Get.currentRoute == Routes.aboutUs
                        ? primarycolor
                        : null,
                    onTap: () => navigate(15),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildDrawerItem({
    required String text,
    final IconData? icon,
    required Color textIconColor,
    required Color? tileColor,
    required VoidCallback onTap,
  }) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      leading: Icon(icon, color: textIconColor),
      title: Text(
        text,
        style: TextStyle(color: textIconColor),
      ),
      tileColor: tileColor,
      onTap: onTap,
    );
  }

  navigate(int index) {
    if (index == 0) {
      Get.toNamed(Routes.dashboard);
    } else if (index == 1) {
      Get.toNamed(Routes.amountReceived);
    } else if (index == 2) {
      Get.toNamed(Routes.amountPayment);
    } else if (index == 3) {
      // Get.toNamed(Routes.stock);
    } else if (index == 4) {
      Get.toNamed(Routes.amountPayment);
    } else if (index == 5) {
      Get.toNamed(Routes.purchaseCredit);
    } else if (index == 6) {
      // Get.toNamed(Routes.purchaseCash);
    } else if (index == 7) {
      // Get.toNamed(Routes.purchaseCredit);
    } else if (index == 8) {
      Get.toNamed(Routes.purchaseCash);
    } else if (index == 9) {
      Get.toNamed(Routes.purchaseCredit);
    } else if (index == 10) {
      // Get.toNamed(Routes.purchaseCash);
    } else if (index == 11) {
      // Get.toNamed(Routes.purchaseCredit);
    } else if (index == 12) {
      Get.toNamed(Routes.journalVoucher);
    } else if (index == 13) {
      // Get.toNamed(Routes.purchaseCredit);
    } else if (index == 14) {
      // Get.toNamed(Routes.purchaseCash);
    } else if (index == 15) {
      // Get.toNamed(Routes.purchaseCredit);
    }
  }
}
