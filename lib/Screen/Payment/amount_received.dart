import 'package:flutter/material.dart';
import 'package:my_app/Screen/Drawer/drawer.dart';
import 'package:my_app/Screen/Purchase/purchase.dart';

import '../../Core/resources/colors.dart';
import '../../Core/utils/size_config.dart';

class AmountReceived extends StatelessWidget {
  const AmountReceived({Key? key}) : super(key: key);

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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    height: 500,
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
                                child: TextFormField(
                                  cursorColor: Colors.black,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    focusedBorder: OutlineInputBorder(),
                                    enabledBorder: OutlineInputBorder(),
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 8,
                                      horizontal: 5,
                                    ),
                                    hintText: 'mm/dd/yyyy',
                                  ),
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
                      ],
                    ),
                  ),
                  // child: Container(
                  //   child: Column(children: [
                  //     Container(
                  //       decoration: BoxDecoration(
                  //         border: Border.all(
                  //           style: BorderStyle.solid,
                  //           color: const Color.fromARGB(255, 195, 195, 195),
                  //         ),
                  //       ),
                  //       child: const Text(
                  //         'Date :',
                  //         style: TextStyle(
                  //           fontSize: 13,
                  //           fontWeight: FontWeight.bold,
                  //           fontFamily: 'Poppins',
                  //           color: Color.fromRGBO(102, 0, 255, 1),
                  //         ),
                  //       ),
                  //     ),
                  //     Container(
                  //       height: 50,
                  //       width: 345,
                  //       padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                  //       margin: const EdgeInsets.fromLTRB(3, 4, 1, 4),
                  //       decoration: BoxDecoration(
                  //         border: Border.all(
                  //           style: BorderStyle.solid,
                  //           color: const Color.fromARGB(255, 195, 195, 195),
                  //         ),
                  //       ),
                  //       child: Row(
                  //         children: [
                  //           Expanded(
                  //             child: TextFormField(
                  //               decoration: const InputDecoration(
                  //                 contentPadding: EdgeInsets.all(6),
                  //                 fillColor: Colors.grey,
                  //                 border: OutlineInputBorder(
                  //                   borderRadius: BorderRadius.all(Radius.zero),
                  //                 ),
                  //                 hintText: 'mm / dd / yyyy',
                  //                 hintStyle: TextStyle(
                  //                   fontFamily: 'Poppins',
                  //                   fontSize: 12,
                  //                   fontWeight: FontWeight.bold,
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //           IconButton(
                  //             onPressed: () {},
                  //             icon: const Icon(Icons.calendar_month),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //     Container(
                  //       margin: const EdgeInsets.all(6),
                  //       padding: const EdgeInsets.all(12),
                  //       width: 345,
                  //       height: 46,
                  //       decoration: BoxDecoration(
                  //         border: Border.all(
                  //           style: BorderStyle.solid,
                  //           color: const Color.fromARGB(255, 195, 195, 195),
                  //         ),
                  //       ),
                  //       child: const Text(
                  //         'Payer Name :',
                  //         style: TextStyle(
                  //           fontSize: 13,
                  //           fontWeight: FontWeight.bold,
                  //           fontFamily: 'Poppins',
                  //           color: Color.fromRGBO(102, 0, 255, 1),
                  //         ),
                  //       ),
                  //     ),
                  //     Container(
                  //       height: 50,
                  //       width: 345,
                  //       padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                  //       margin: const EdgeInsets.all(2),
                  //       decoration: BoxDecoration(
                  //         border: Border.all(
                  //           style: BorderStyle.solid,
                  //           color: const Color.fromARGB(255, 195, 195, 195),
                  //         ),
                  //       ),
                  //       child: TextFormField(
                  //         decoration: const InputDecoration(
                  //             contentPadding: EdgeInsets.all(6),
                  //             fillColor: Colors.grey,
                  //             border: OutlineInputBorder(
                  //                 borderRadius: BorderRadius.all(Radius.zero)),
                  //             hintText: 'Enter Name of Payer',
                  //             hintStyle: TextStyle(
                  //               fontFamily: 'Poppins',
                  //               fontSize: 12,
                  //               fontWeight: FontWeight.bold,
                  //             )),
                  //       ),
                  //     ),
                  //     Container(
                  //       margin: const EdgeInsets.all(6),
                  //       padding: const EdgeInsets.all(12),
                  //       width: 345,
                  //       height: 46,
                  //       decoration: BoxDecoration(
                  //         border: Border.all(
                  //           style: BorderStyle.solid,
                  //           color: const Color.fromARGB(255, 195, 195, 195),
                  //         ),
                  //       ),
                  //       child: const Text(
                  //         'Cash or Bank :',
                  //         style: TextStyle(
                  //           fontSize: 13,
                  //           fontWeight: FontWeight.bold,
                  //           fontFamily: 'Poppins',
                  //           color: Color.fromRGBO(102, 0, 255, 1),
                  //         ),
                  //       ),
                  //     ),
                  //     Container(
                  //       height: 50,
                  //       width: 345,
                  //       padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                  //       margin: const EdgeInsets.all(2),
                  //       decoration: BoxDecoration(
                  //         border: Border.all(
                  //           style: BorderStyle.solid,
                  //           color: const Color.fromARGB(255, 195, 195, 195),
                  //         ),
                  //       ),
                  //       child: Container(
                  //         padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                  //         margin: const EdgeInsets.all(2),
                  //         decoration: BoxDecoration(
                  //           border: Border.all(
                  //             color: Colors.grey,
                  //           ),
                  //         ),
                  //         child: Row(
                  //           children: [
                  //             SizedBox(
                  //               width: 305,
                  //               child: DropdownButtonHideUnderline(
                  //                 child: DropdownButton(
                  //                   items: const [
                  //                     DropdownMenuItem(
                  //                       value: 'Cash',
                  //                       child: Text('Cash'),
                  //                     ),
                  //                     DropdownMenuItem(
                  //                       value: 'Cash',
                  //                       child: Text('Bank'),
                  //                     )
                  //                   ],
                  //                   onChanged: (String? value) {},
                  //                   hint: const Text(
                  //                     'Cash / Bank',
                  //                     style: TextStyle(
                  //                       fontFamily: 'Poppins',
                  //                       fontSize: 13,
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //     Container(
                  //       margin: const EdgeInsets.all(6),
                  //       padding: const EdgeInsets.all(12),
                  //       width: 345,
                  //       height: 46,
                  //       decoration: BoxDecoration(
                  //         border: Border.all(
                  //           style: BorderStyle.solid,
                  //           color: const Color.fromARGB(255, 195, 195, 195),
                  //         ),
                  //       ),
                  //       child: const Text(
                  //         'Total Amount :',
                  //         style: TextStyle(
                  //           fontSize: 13,
                  //           fontWeight: FontWeight.bold,
                  //           fontFamily: 'Poppins',
                  //           color: Color.fromRGBO(102, 0, 255, 1),
                  //         ),
                  //       ),
                  //     ),
                  //     Container(
                  //       height: 50,
                  //       width: 345,
                  //       padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                  //       margin: const EdgeInsets.all(2),
                  //       decoration: BoxDecoration(
                  //         border: Border.all(
                  //           style: BorderStyle.solid,
                  //           color: const Color.fromARGB(255, 195, 195, 195),
                  //         ),
                  //       ),
                  //       child: TextFormField(
                  //         decoration: const InputDecoration(
                  //             fillColor: Colors.grey,
                  //             contentPadding: EdgeInsets.all(6),
                  //             border: OutlineInputBorder(
                  //                 borderRadius: BorderRadius.all(Radius.zero)),
                  //             hintText: 'Enter Total Amount',
                  //             hintStyle: TextStyle(
                  //               fontFamily: 'Poppins',
                  //               fontSize: 12,
                  //               fontWeight: FontWeight.bold,
                  //             )),
                  //       ),
                  //     ),
                  //     Container(
                  //       margin: const EdgeInsets.all(6),
                  //       padding: const EdgeInsets.all(12),
                  //       width: 345,
                  //       height: 46,
                  //       decoration: BoxDecoration(
                  //         border: Border.all(
                  //           style: BorderStyle.solid,
                  //           color: const Color.fromARGB(255, 195, 195, 195),
                  //         ),
                  //       ),
                  //       child: const Text(
                  //         'Receipt :',
                  //         style: TextStyle(
                  //           fontSize: 13,
                  //           fontWeight: FontWeight.bold,
                  //           fontFamily: 'Poppins',
                  //           color: Color.fromRGBO(102, 0, 255, 1),
                  //         ),
                  //       ),
                  //     ),
                  //     Container(
                  //       height: 50,
                  //       width: 345,
                  //       padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                  //       margin: const EdgeInsets.all(2),
                  //       decoration: BoxDecoration(
                  //         border: Border.all(
                  //           style: BorderStyle.solid,
                  //           color: const Color.fromARGB(255, 195, 195, 195),
                  //         ),
                  //       ),
                  //       child: Row(
                  //         children: [
                  //           ElevatedButton(
                  //             onPressed: () {},
                  //             style: ElevatedButton.styleFrom(
                  //                 backgroundColor: Colors.grey.shade300),
                  //             child: const Text(
                  //               'Browse..',
                  //               style: TextStyle(
                  //                 color: Colors.black,
                  //               ),
                  //             ),
                  //           ),
                  //           const SizedBox(width: 6),
                  //           const Text('No Files Selected.')
                  //         ],
                  //       ),
                  //     ),
                  //     Row(
                  //       mainAxisAlignment: MainAxisAlignment.end,
                  //       children: [
                  //         ElevatedButton(
                  //             onPressed: () {
                  //               Navigator.of(context).push(
                  //                 MaterialPageRoute(
                  //                     builder: (BuildContext context) {
                  //                   return const Purchase();
                  //                 }),
                  //               );
                  //             },
                  //             style: ElevatedButton.styleFrom(
                  //               backgroundColor:
                  //                   const Color.fromRGBO(49, 26, 187, 1),
                  //             ),
                  //             child: const Text(
                  //               'Submit',
                  //               style: TextStyle(
                  //                 color: Colors.white,
                  //                 fontSize: 13,
                  //                 fontWeight: FontWeight.bold,
                  //               ),
                  //             )),
                  //       ],
                  //     )
                  //   ]),
                  // ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
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
      padding: padding ?? const EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(
          style: BorderStyle.solid,
          width: 2,
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
