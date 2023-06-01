import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_app/Screen/Journal/journal_voucher2.dart';

import '../../Core/resources/colors.dart';
import '../../Core/utils/size_config.dart';
import '../../Core/widgets/buttons.dart';
import '../Drawer/drawer.dart';
import '../Payment/View/amount_received.dart';

class JournalVoucherScreen extends StatefulWidget {
  const JournalVoucherScreen({Key? key}) : super(key: key);

  @override
  State<JournalVoucherScreen> createState() => _JournalVoucherScreenState();
}

class _JournalVoucherScreenState extends State<JournalVoucherScreen> {
  TextEditingController dateController = TextEditingController();

  final dropdownItems = ['Debit', 'Credit'];
  String? value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text('Journal Voucher'),
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
                      'Journal Voucher',
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
                          text: 'Voucher Number:',
                        ),
                        SizeConfig(context).verticalSpaceSmall(),
                        CustomContainer(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Expanded(
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
                                    hintText: 'Enter Voucher Number',

                                    // label: Text(title),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: primarycolor),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 10),
                                  child: Icon(
                                    Icons.search,
                                    size: 26,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizeConfig(context).verticalSpaceSmall(),
                        const CustomContainer(
                          text: 'Voucher Date:',
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
                          text: 'Account Name:',
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
                              hintText: 'Enter Account Name',

                              // label: Text(title),
                            ),
                          ),
                        ),
                        SizeConfig(context).verticalSpaceSmall(),
                        const CustomContainer(
                          text: 'Dr / Cr:',
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
                                  hint: const Text('Dr or Cr'),
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
                              hintText: 'Enter Amount',

                              // label: Text(title),
                            ),
                          ),
                        ),
                        SizeConfig(context).verticalSpaceSmall(),
                        const CustomContainer(
                          text: 'Short Narration: ',
                        ),
                        SizeConfig(context).verticalSpaceSmall(),
                        CustomContainer(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Expanded(
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
                                    hintText: 'Short Narration',

                                    // label: Text(title),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: primarycolor),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 10),
                                  child: Icon(
                                    Icons.add,
                                    size: 26,
                                  ),
                                ),
                              )
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
}

DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
    value: item,
    child: Text(
      item,
      style: const TextStyle(),
    ));

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

//     );
//     // return Scaffold(
//     //   backgroundColor: Colors.grey[300],
//     //   appBar: AppBar(
//     //       automaticallyImplyLeading: false,
//     //       backgroundColor: const Color.fromRGBO(49, 26, 187, 1),
//     //       leading: IconButton(
//     //         icon: const Icon(Icons.menu),
//     //         onPressed: () {},
//     //       ),
//     //       actions: [
//     //         IconButton(
//     //           icon: const Icon(Icons.arrow_back),
//     //           onPressed: () {
//     //             Navigator.of(context).pop();
//     //           },
//     //         )
//     //       ]),
//     //   body: SingleChildScrollView(
//     //     child: Center(
//     //       child: Column(
//     //         children: [
//     //           Row(
//     //             children: [
//     //               Container(
//     //                 margin: const EdgeInsets.all(10),
//     //                 width: 35,
//     //                 height: 30,
//     //                 decoration: BoxDecoration(
//     //                   color: const Color.fromRGBO(49, 26, 187, 1),
//     //                   shape: BoxShape.rectangle,
//     //                   borderRadius: BorderRadius.circular(9),
//     //                 ),
//     //                 child: const Icon(
//     //                   Icons.attach_money_outlined,
//     //                   color: Colors.white,
//     //                 ),
//     //               ),
//     //               const Text(
//     //                 'Journal Voucher',
//     //                 style: TextStyle(
//     //                   color: Color.fromRGBO(49, 26, 187, 1),
//     //                   fontSize: 25,
//     //                   fontWeight: FontWeight.bold,
//     //                   fontFamily: 'Poppins',
//     //                 ),
//     //               )
//     //             ],
//     //           ),
//     //           SizedBox(
//     //             height: MediaQuery.of(context).size.height * 0.89,
//     //             child: Container(
//     //               margin: const EdgeInsets.all(8),
//     //               padding: const EdgeInsets.all(10),
//     //               height: 560,
//     //               width: 400,
//     //               color: Colors.white,
//     //               child: Column(
//     //                 children: [
//     //                   Container(
//     //                     margin: const EdgeInsets.all(6),
//     //                     padding: const EdgeInsets.all(12),
//     //                     width: 345,
//     //                     height: 46,
//     //                     decoration: BoxDecoration(
//     //                       border: Border.all(
//     //                         style: BorderStyle.solid,
//     //                         color: const Color.fromARGB(255, 195, 195, 195),
//     //                       ),
//     //                     ),
//     //                     child: Row(
//     //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     //                       children: const [
//     //                         Text(
//     //                           'Voucher Number :',
//     //                           style: TextStyle(
//     //                             fontSize: 13,
//     //                             fontWeight: FontWeight.bold,
//     //                             fontFamily: 'Poppins',
//     //                             color: Color.fromRGBO(102, 0, 255, 1),
//     //                           ),
//     //                         ),
//     //                       ],
//     //                     ),
//     //                   ),
//     //                   Container(
//     //                     height: 50,
//     //                     width: 345,
//     //                     padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
//     //                     margin: const EdgeInsets.fromLTRB(6, 4, 1, 4),
//     //                     decoration: BoxDecoration(
//     //                       border: Border.all(
//     //                         style: BorderStyle.solid,
//     //                         color: const Color.fromARGB(255, 195, 195, 195),
//     //                       ),
//     //                     ),
//     //                     child: Row(
//     //                       children: [
//     //                         Expanded(
//     //                           child: TextFormField(
//     //                             decoration: const InputDecoration(
//     //                               contentPadding: EdgeInsets.all(6),
//     //                               fillColor: Colors.grey,
//     //                               border: OutlineInputBorder(
//     //                                 borderRadius: BorderRadius.all(Radius.zero),
//     //                               ),
//     //                               hintText: 'Enter Voucher Number',
//     //                               hintStyle: TextStyle(
//     //                                 fontFamily: 'Poppins',
//     //                                 fontSize: 12,
//     //                                 fontWeight: FontWeight.bold,
//     //                               ),
//     //                             ),
//     //                           ),
//     //                         ),
//     //                         Container(
//     //                           decoration: const BoxDecoration(
//     //                               color: Color.fromRGBO(49, 26, 187, 1)),
//     //                           child: IconButton(
//     //                             onPressed: () {},
//     //                             icon: const Icon(
//     //                               Icons.search,
//     //                               color: Colors.white,
//     //                             ),
//     //                           ),
//     //                         ),
//     //                       ],
//     //                     ),
//     //                   ),
//     //                   Container(
//     //                     margin: const EdgeInsets.all(6),
//     //                     padding: const EdgeInsets.all(12),
//     //                     width: 345,
//     //                     height: 46,
//     //                     decoration: BoxDecoration(
//     //                       border: Border.all(
//     //                         style: BorderStyle.solid,
//     //                         color: const Color.fromARGB(255, 195, 195, 195),
//     //                       ),
//     //                     ),
//     //                     child: const Text(
//     //                       'Voucher Date :',
//     //                       style: TextStyle(
//     //                         fontSize: 13,
//     //                         fontWeight: FontWeight.bold,
//     //                         fontFamily: 'Poppins',
//     //                         color: Color.fromRGBO(102, 0, 255, 1),
//     //                       ),
//     //                     ),
//     //                   ),
//     //                   Row(
//     //                     children: [
//     //                       Container(
//     //                         height: 50,
//     //                         width: 345,
//     //                         padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
//     //                         margin: const EdgeInsets.fromLTRB(6, 4, 1, 4),
//     //                         decoration: BoxDecoration(
//     //                           border: Border.all(
//     //                             style: BorderStyle.solid,
//     //                             color: const Color.fromARGB(255, 195, 195, 195),
//     //                           ),
//     //                         ),
//     //                         child: Row(
//     //                           children: [
//     //                             Expanded(
//     //                               child: TextFormField(
//     //                                 decoration: const InputDecoration(
//     //                                   contentPadding: EdgeInsets.all(6),
//     //                                   fillColor: Colors.grey,
//     //                                   border: OutlineInputBorder(
//     //                                     borderRadius:
//     //                                         BorderRadius.all(Radius.zero),
//     //                                   ),
//     //                                   hintText: 'mm / dd / yyyy',
//     //                                   hintStyle: TextStyle(
//     //                                     fontFamily: 'Poppins',
//     //                                     fontSize: 12,
//     //                                     fontWeight: FontWeight.bold,
//     //                                   ),
//     //                                 ),
//     //                               ),
//     //                             ),
//     //                             IconButton(
//     //                               onPressed: () {},
//     //                               icon: const Icon(Icons.calendar_month),
//     //                             ),
//     //                           ],
//     //                         ),
//     //                       ),
//     //                     ],
//     //                   ),
//     //                   Container(
//     //                     margin: const EdgeInsets.all(6),
//     //                     padding: const EdgeInsets.all(12),
//     //                     width: 345,
//     //                     height: 46,
//     //                     decoration: BoxDecoration(
//     //                       border: Border.all(
//     //                         style: BorderStyle.solid,
//     //                         color: const Color.fromARGB(255, 195, 195, 195),
//     //                       ),
//     //                     ),
//     //                     child: const Text(
//     //                       'Account Name :',
//     //                       style: TextStyle(
//     //                         fontSize: 13,
//     //                         fontWeight: FontWeight.bold,
//     //                         fontFamily: 'Poppins',
//     //                         color: Color.fromRGBO(102, 0, 255, 1),
//     //                       ),
//     //                     ),
//     //                   ),
//     //                   Container(
//     //                     height: 50,
//     //                     width: 345,
//     //                     padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
//     //                     margin: const EdgeInsets.all(2),
//     //                     decoration: BoxDecoration(
//     //                       border: Border.all(
//     //                         style: BorderStyle.solid,
//     //                         color: const Color.fromARGB(255, 195, 195, 195),
//     //                       ),
//     //                     ),
//     //                     child: TextFormField(
//     //                       decoration: const InputDecoration(
//     //                           contentPadding: EdgeInsets.all(6),
//     //                           fillColor: Colors.grey,
//     //                           border: OutlineInputBorder(
//     //                               borderRadius: BorderRadius.all(Radius.zero)),
//     //                           hintText: 'Enter Account Name',
//     //                           hintStyle: TextStyle(
//     //                             fontFamily: 'Poppins',
//     //                             fontSize: 12,
//     //                             fontWeight: FontWeight.bold,
//     //                           )),
//     //                     ),
//     //                   ),
//     //                   Container(
//     //                     margin: const EdgeInsets.all(6),
//     //                     padding: const EdgeInsets.all(12),
//     //                     width: 345,
//     //                     height: 46,
//     //                     decoration: BoxDecoration(
//     //                       border: Border.all(
//     //                         style: BorderStyle.solid,
//     //                         color: const Color.fromARGB(255, 195, 195, 195),
//     //                       ),
//     //                     ),
//     //                     child: const Text(
//     //                       'Cr / Dr :',
//     //                       style: TextStyle(
//     //                         fontSize: 13,
//     //                         fontWeight: FontWeight.bold,
//     //                         fontFamily: 'Poppins',
//     //                         color: Color.fromRGBO(102, 0, 255, 1),
//     //                       ),
//     //                     ),
//     //                   ),
//     //                   Container(
//     //                     height: 50,
//     //                     width: 345,
//     //                     padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
//     //                     margin: const EdgeInsets.all(2),
//     //                     decoration: BoxDecoration(
//     //                       border: Border.all(
//     //                         style: BorderStyle.solid,
//     //                         color: const Color.fromARGB(255, 195, 195, 195),
//     //                       ),
//     //                     ),
//     //                     child: Container(
//     //                       padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
//     //                       margin: const EdgeInsets.all(2),
//     //                       decoration: BoxDecoration(
//     //                         border: Border.all(
//     //                           color: Colors.grey,
//     //                         ),
//     //                       ),
//     //                       child: Row(
//     //                         children: [
//     //                           SizedBox(
//     //                             width: 305,
//     //                             child: DropdownButtonHideUnderline(
//     //                               child: DropdownButton(
//     //                                 items: const [
//     //                                   DropdownMenuItem(
//     //                                     value: 'Cr',
//     //                                     child: Text('Cr'),
//     //                                   ),
//     //                                   DropdownMenuItem(
//     //                                     value: 'Dr',
//     //                                     child: Text('Dr'),
//     //                                   )
//     //                                 ],
//     //                                 onChanged: (String? value) {},
//     //                                 hint: const Text(
//     //                                   'Cr or Dr',
//     //                                   style: TextStyle(
//     //                                     fontFamily: 'Poppins',
//     //                                     fontSize: 13,
//     //                                   ),
//     //                                 ),
//     //                               ),
//     //                             ),
//     //                           ),
//     //                         ],
//     //                       ),
//     //                     ),
//     //                   ),
//     //                   Container(
//     //                     margin: const EdgeInsets.all(6),
//     //                     padding: const EdgeInsets.all(12),
//     //                     width: 345,
//     //                     height: 46,
//     //                     decoration: BoxDecoration(
//     //                       border: Border.all(
//     //                         style: BorderStyle.solid,
//     //                         color: const Color.fromARGB(255, 195, 195, 195),
//     //                       ),
//     //                     ),
//     //                     child: const Text(
//     //                       'Amount :',
//     //                       style: TextStyle(
//     //                         fontSize: 13,
//     //                         fontWeight: FontWeight.bold,
//     //                         fontFamily: 'Poppins',
//     //                         color: Color.fromRGBO(102, 0, 255, 1),
//     //                       ),
//     //                     ),
//     //                   ),
//     //                   Container(
//     //                     height: 50,
//     //                     width: 345,
//     //                     padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
//     //                     margin: const EdgeInsets.all(2),
//     //                     decoration: BoxDecoration(
//     //                       border: Border.all(
//     //                         style: BorderStyle.solid,
//     //                         color: const Color.fromARGB(255, 195, 195, 195),
//     //                       ),
//     //                     ),
//     //                     child: TextFormField(
//     //                       decoration: const InputDecoration(
//     //                           contentPadding: EdgeInsets.fromLTRB(10, 6, 6, 6),
//     //                           border: OutlineInputBorder(
//     //                               borderRadius: BorderRadius.all(Radius.zero)),
//     //                           hintText: 'Enter Amount',
//     //                           hintStyle: TextStyle(
//     //                             fontFamily: 'Poppins',
//     //                             fontSize: 12,
//     //                             fontWeight: FontWeight.bold,
//     //                           )),
//     //                     ),
//     //                   ),
//     //                   Container(
//     //                     width: 100,
//     //                     margin: const EdgeInsets.fromLTRB(250, 5, 6, 5),
//     //                     child: ElevatedButton(
//     //                       style: ElevatedButton.styleFrom(
//     //                           backgroundColor:
//     //                               const Color.fromRGBO(49, 26, 187, 1)),
//     //                       onPressed: () {
//     //                         Navigator.of(context).push(
//     //                           MaterialPageRoute(
//     //                               builder: (BuildContext context) {
//     //                             return const JournalVoucher2();
//     //                           }),
//     //                         );
//     //                       },
//     //                       child: const Text(
//     //                         'Submit',
//     //                         style: TextStyle(
//     //                           fontFamily: 'Poppins',
//     //                           fontSize: 14,
//     //                           fontWeight: FontWeight.bold,
//     //                         ),
//     //                       ),
//     //                     ),
//     //                   )
//     //                 ],
//     //               ),
//     //             ),
//     //           ),
//     //         ],
//     //       ),
//     //     ),
//     //   ),
//     // );
//   }
// }
