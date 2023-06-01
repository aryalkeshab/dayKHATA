import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:my_app/Core/widgets/buttons.dart';
import 'package:my_app/Screen/Drawer/drawer.dart';
import '../../../Core/resources/colors.dart';
import 'package:intl/intl.dart';

import '../../../Core/utils/size_config.dart';

class AmountReceived extends StatefulWidget {
  AmountReceived({Key? key}) : super(key: key);

  @override
  State<AmountReceived> createState() => _AmountReceivedState();
}

class _AmountReceivedState extends State<AmountReceived> {
  TextEditingController dateController = TextEditingController();
  TextEditingController playrNameController = TextEditingController();

  final dropdownItems = ['Cash', 'Bank'];
  String? value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text('Amount Received'),
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
                      'Amount Received',
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
                    // height: 500,
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
                          text: 'Cash Or Bank:',
                        ),
                        SizeConfig(context).verticalSpaceSmall(),
                        CustomContainer(
                          padding: const EdgeInsets.all(5),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              border: Border.all(
                                style: BorderStyle.solid,
                                width: 1,
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                  hint: const Text('Select an option'),
                                  items:
                                      dropdownItems.map(buildMenuItem).toList(),
                                  value: value,
                                  isExpanded: true,
                                  onChanged: (value) => setState(() {
                                        this.value = value;
                                      })),
                            ),
                          ),
                        ),
                        SizeConfig(context).verticalSpaceSmall(),
                        const CustomContainer(
                          text: 'Total Amount: ',
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
                          text: 'Receipt: ',
                        ),
                        SizeConfig(context).verticalSpaceSmall(),
                        CustomContainer(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                      context: context,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(18))),
                                      builder: (context) {
                                        return Wrap(
                                          children: [
                                            ListTile(
                                              onTap: () {},
                                              leading: Container(
                                                decoration: BoxDecoration(
                                                    color: primarycolor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50)),
                                                padding:
                                                    const EdgeInsets.all(5),
                                                child: Icon(
                                                  Icons.camera_alt_outlined,
                                                  color: whiteColor,
                                                ),
                                              ),
                                              title: const Text('Camera'),
                                            ),
                                            ListTile(
                                              onTap: () {},
                                              leading: Container(
                                                decoration: BoxDecoration(
                                                    color: primarycolor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50)),
                                                padding:
                                                    const EdgeInsets.all(5),
                                                child: Icon(
                                                  Icons.photo_library_outlined,
                                                  color: whiteColor,
                                                ),
                                              ),
                                              title: const Text('Gallery'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: Text('Browse')),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text('No Files is selected'),
                            ],
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

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: const TextStyle(),
      ));
}

class CustomContainer extends StatelessWidget {
  final String? text;
  final Widget? child;
  final EdgeInsetsGeometry? padding;

  const CustomContainer({Key? key, this.text, this.child, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(
          style: BorderStyle.solid,
          width: 1,
          color: const Color.fromARGB(255, 195, 195, 195),
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: child ??
          (text != null
              ? Text(
                  text!,
                  style: TextStyle(
                    color: primarycolor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : const SizedBox()),
    );
  }
}
