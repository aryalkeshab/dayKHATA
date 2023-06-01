import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../Core/resources/colors.dart';
import '../../Core/utils/size_config.dart';
import '../../Core/widgets/buttons.dart';
import '../Drawer/drawer.dart';
import '../Payment/View/amount_received.dart';

class PurchaseScreen extends StatefulWidget {
  const PurchaseScreen({Key? key}) : super(key: key);

  @override
  State<PurchaseScreen> createState() => _PurchaseScreenState();
}

class _PurchaseScreenState extends State<PurchaseScreen> {
  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text('Purchase(Cash)'),
        backgroundColor: const Color.fromRGBO(49, 26, 187, 1),
      ),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: primarycolor,
                          borderRadius: BorderRadius.circular(5)),
                      child: Icon(
                        Icons.attach_money_outlined,
                        color: whiteColor,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Purchase (Cash)',
                      style: TextStyle(
                        color: primarycolor,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                SizeConfig(context).verticalSpaceMedium(),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 1,
                        spreadRadius: 1,
                        offset: Offset(
                          1,
                          1,
                        ),
                      ),
                    ],
                    color: whiteColor,
                    shape: BoxShape.rectangle,
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 25),
                    // height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomContainer(
                          text: 'Date:',
                        ),
                        SizeConfig(context).verticalSpaceSmall(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: CustomContainer(
                                padding: const EdgeInsets.all(5),
                                child: TextFormField(
                                  onTap: () async {
                                    DateTime? pickeddate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2101));

                                    if (pickeddate != null) {
                                      dateController.text =
                                          DateFormat('yyy-MM-dd')
                                              .format(pickeddate);
                                      setState(() {
                                        dateController.text =
                                            DateFormat('yyy-MM-dd')
                                                .format(pickeddate);
                                      });
                                    }
                                  },
                                  controller: dateController,
                                  cursorColor: primarycolor,
                                  decoration: InputDecoration(
                                    // icon: Icon(Icons.calendar_month),
                                    border: const OutlineInputBorder(),
                                    focusedBorder: const OutlineInputBorder(),
                                    enabledBorder: const OutlineInputBorder(),
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 8,
                                      horizontal: 5,
                                    ),
                                    hintText: 'mm-dd-yyyy',
                                    suffixIcon: Icon(
                                      Icons.calendar_month,
                                      color: greyColor,
                                    ),
                                  ),
                                  // onChanged: () {},
                                ),
                              ),
                            ),
                            // const Icon(Icons.calendar_month)
                          ],
                        ),
                        SizeConfig(context).verticalSpaceSmall(),
                        const CustomContainer(
                          text: 'Payer Name:',
                        ),
                        SizeConfig(context).verticalSpaceSmall(),
                        CustomContainer(
                          padding: const EdgeInsets.all(5),
                          child: TextFormField(
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              focusedBorder: const OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                // borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 5),
                              hintText: 'Enter Name of Player',

                              // label: Text(title),
                            ),
                          ),
                        ),
                        SizeConfig(context).verticalSpaceSmall(),
                        const CustomContainer(
                          text: 'Particulars :',
                        ),
                        SizeConfig(context).verticalSpaceSmall(),
                        CustomContainer(
                          padding: const EdgeInsets.all(5),
                          child: TextFormField(
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              focusedBorder: const OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                // borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 5),
                              hintText: 'Particulars',

                              // label: Text(title),
                            ),
                          ),
                        ),
                        SizeConfig(context).verticalSpaceSmall(),
                        const CustomContainer(
                          text: 'Amount: ',
                        ),
                        SizeConfig(context).verticalSpaceSmall(),
                        CustomContainer(
                          padding: const EdgeInsets.all(5),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              focusedBorder: const OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                // borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 5),
                              hintText: 'Enter Total AMount',

                              // label: Text(title),
                            ),
                          ),
                        ),
                        SizeConfig(context).verticalSpaceSmall(),
                        const CustomContainer(
                          text: 'Taxable: ',
                        ),
                        SizeConfig(context).verticalSpaceSmall(),
                        CustomContainer(
                          padding: const EdgeInsets.all(5),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              focusedBorder: const OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                // borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 5),
                              hintText: 'Enter Taxable Amount',

                              // label: Text(title),
                            ),
                          ),
                        ),
                        const CustomContainer(
                          text: 'VAT: ',
                        ),
                        SizeConfig(context).verticalSpaceSmall(),
                        CustomContainer(
                          padding: const EdgeInsets.all(5),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              focusedBorder: const OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                // borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 5),
                              hintText: 'Enter VAT Amount',

                              // label: Text(title),
                            ),
                          ),
                        ),
                        SizeConfig(context).verticalSpaceSmall(),
                        PrimaryButton(
                          width: MediaQuery.of(context).size.width,
                          label: 'Submit',
                          color: primarycolor,
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
