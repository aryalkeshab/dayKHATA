import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:my_app/Core/widgets/buttons.dart';
import 'package:my_app/Screen/Drawer/drawer.dart';
import '../../../Core/resources/colors.dart';
import 'package:intl/intl.dart';
import 'package:masked_text_field/masked_text_field.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../Core/utils/size_config.dart';

import 'package:dropdown_search/dropdown_search.dart';

import '../Controller/amount_received_controller.dart';

class AmountReceived extends StatefulWidget {
  AmountReceived({Key? key}) : super(key: key);

  @override
  State<AmountReceived> createState() => _AmountReceivedState();
}

class _AmountReceivedState extends State<AmountReceived> {
  TextEditingController dateController = TextEditingController();

  TextEditingController playrNameController = TextEditingController();

//for search functionality
  FocusNode searchFocusNode = FocusNode();
  TextEditingController searchController = TextEditingController();

  // final dropdownItems = ['Cash', 'Bank'];
  // String? value;
  @override
  void initState() {
    Get.put(AmountReceivedController());
    super.initState();
  }

  final selecteditem = null;

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
        padding: const EdgeInsets.only(bottom: 50),
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
                                child: MaskedTextField(
                                  textFieldController: dateController,
                                  inputDecoration: const InputDecoration(
                                      border: InputBorder.none,
                                      // enabledBorder: OutlineInputBorder(
                                      //     borderRadius: BorderRadius.zero,
                                      //     borderSide: BorderSide(
                                      //         color: Colors.transparent)),
                                      hintText: 'DD/MM/YYYY',
                                      counterText: ""),
                                  autofocus: true,
                                  mask: 'xx/xx/xxxx',
                                  maxLength: 10,
                                  keyboardType: TextInputType.number,
                                  onChange: (String value) {
                                    print(value);
                                  },
                                ),

                                // TextFormField(
                                //   onTap: () async {
                                //     DateTime? pickeddate = await showDatePicker(
                                //         context: context,
                                //         initialDate: DateTime.now(),
                                //         firstDate: DateTime(2000),
                                //         lastDate: DateTime(2101));

                                //     if (pickeddate != null) {
                                //       dateController.text =
                                //           DateFormat('yyy-MM-dd')
                                //               .format(pickeddate);
                                //       setState(() {
                                //         dateController.text =
                                //             DateFormat('yyy-MM-dd')
                                //                 .format(pickeddate);
                                //       });
                                //     }
                                //   },
                                //   controller: dateController,
                                //   cursorColor: primarycolor,
                                //   decoration: InputDecoration(
                                //     // icon: Icon(Icons.calendar_month),
                                //     border: const OutlineInputBorder(),
                                //     focusedBorder: const OutlineInputBorder(),
                                //     enabledBorder: const OutlineInputBorder(),
                                //     contentPadding: const EdgeInsets.symmetric(
                                //       vertical: 8,
                                //       horizontal: 5,
                                //     ),
                                //     hintText: 'mm-dd-yyyy',
                                //     suffixIcon: Icon(
                                //       Icons.calendar_month,
                                //       color: greyColor,
                                //     ),
                                //   ),
                                //   // onChanged: () {},
                                // ),
                              ),
                            ),
                          ],
                        ),
                        SizeConfig(context).verticalSpaceSmall(),
                        const CustomContainer(
                          text: 'Payer Name:',
                        ),
                        SizeConfig(context).verticalSpaceSmall(),
                        GetBuilder<AmountReceivedController>(
                            init: AmountReceivedController(),
                            builder: (controller) {
                              return CustomContainer(
                                padding: const EdgeInsets.all(5),
                                child: GestureDetector(
                                  onTap: () {
                                    FocusScope.of(context)
                                        .requestFocus(FocusNode());
                                    // Set focus on the search bar and open the dropdown
                                    setState(() {
                                      searchController.text =
                                          ''; // Clear the search bar text
                                      // Add any additional logic here if needed
                                    });
                                  },
                                  child: DropdownSearch<String>(
                                    onChanged: (val) {
                                      // Get.put(AmountReceivedController()
                                      //     .getUserList(val.toString()));
                                      controller.getUserList(val.toString());
                                      print(val);
                                    },
                                    // enabled: true,
                                    selectedItem: selecteditem,
                                    popupProps: PopupProps.dialog(
                                      showSelectedItems: true,
                                      showSearchBox: true,
                                      searchDelay: const Duration(seconds: 2),
                                      searchFieldProps: TextFieldProps(
                                        cursorColor: Colors.black,
                                        decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 20),
                                          hintText: "Account Name",
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                            borderSide: BorderSide(
                                                color: primarycolor,
                                                width: 2.0),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                            borderSide: BorderSide(
                                                color: primarycolor,
                                                width: 2.0),
                                          ),
                                          hoverColor: Colors.grey,
                                          border: const OutlineInputBorder(),
                                        ),
                                        autofocus: true,
                                        enableSuggestions: true,

                                        // focusNode:
                                      ),

                                      // disabledItemFn: (String s) => s.startsWith('I'),
                                    ),
                                    items: controller.usernameList,
                                    // items: const [
                                    //   "Brazil",
                                    //   "Italia (Disabled)",
                                    //   "Tunisia",
                                    //   'Canada',
                                    //   "Albania",
                                    //   "Algeria",
                                    //   "Andorra",
                                    //   "Angola",
                                    //   "Antigua and Barbuda",
                                    //   "Argentina",
                                    //   "Armenia",
                                    //   "Australia",
                                    //   "Austria",
                                    // ],p
                                    dropdownDecoratorProps:
                                        const DropDownDecoratorProps(
                                      dropdownSearchDecoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(),
                                        focusedBorder: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 5),
                                        iconColor: Colors.white,
                                        suffixIconColor: Colors.white,
                                        hintText: "Enter a payer name",
                                        border: UnderlineInputBorder(
                                          borderSide: BorderSide
                                              .none, // Removes the underline
                                        ),
                                        icon: null,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                        // GetBuilder<AmountReceivedController>(
                        //     builder: (controller) {
                        //   final response = controller.userListApiResponse;
                        //   return
                        //   CustomContainer(
                        //     padding: const EdgeInsets.all(5),
                        //     child: DropdownSearch<String>(
                        //       popupProps: const PopupProps.menu(
                        //         showSelectedItems: true,

                        //         showSearchBox: true,
                        //         // disabledItemFn: (String s) => s.startsWith('I'),
                        //       ),
                        //       // items:ListView.builder(itemBuilder: itemBuilder) ,
                        //       const items: [
                        //         "Brazil",
                        //         "Italia (Disabled)",
                        //         "Tunisia",
                        //         'Canada',
                        //         "Albania",
                        //         "Algeria",
                        //         "Andorra",
                        //         "Angola",
                        //         "Antigua and Barbuda",
                        //         "Argentina",
                        //         "Armenia",
                        //         "Australia",
                        //         "Austria",
                        //       ],
                        //       dropdownDecoratorProps:
                        //           const DropDownDecoratorProps(
                        //         dropdownSearchDecoration: InputDecoration(
                        //           enabledBorder: OutlineInputBorder(),
                        //           focusedBorder: OutlineInputBorder(),
                        //           contentPadding: EdgeInsets.symmetric(
                        //               vertical: 8, horizontal: 5),
                        //           iconColor: Colors.white,
                        //           suffixIconColor: Colors.white,
                        //           hintText: "Enter a payer name",
                        //           border: UnderlineInputBorder(
                        //             borderSide: BorderSide
                        //                 .none, // Removes the underline
                        //           ),
                        //           icon: null,
                        //           prefixIcon: null,
                        //           suffix: SizedBox.shrink(),
                        //         ),
                        //       ),
                        //       onChanged: (val) {
                        //         print(val);
                        //       },
                        //       selectedItem: selecteditem,
                        //     ),
                        //   );
                        // }),
                        SizeConfig(context).verticalSpaceSmall(),
                        // const CustomContainer(
                        //   text: 'Cash Or Bank:',
                        // ),
                        // SizeConfig(context).verticalSpaceSmall(),
                        // CustomContainer(
                        //   padding: const EdgeInsets.all(5),
                        //   child: Container(
                        //     padding: const EdgeInsets.symmetric(horizontal: 5),
                        //     decoration: BoxDecoration(
                        //       border: Border.all(
                        //         style: BorderStyle.solid,
                        //         width: 1,
                        //         color: Colors.black,
                        //       ),
                        //       borderRadius: BorderRadius.circular(5),
                        //     ),
                        //     child: DropdownButtonHideUnderline(
                        //       child: DropdownButton<String>(
                        //           hint: const Text('Select an option'),
                        //           items:
                        //               dropdownItems.map(buildMenuItem).toList(),
                        //           value: value,
                        //           isExpanded: true,
                        //           onChanged: (value) => setState(() {
                        //                 this.value = value;
                        //               })),
                        //     ),
                        //   ),
                        // ),
                        // SizeConfig(context).verticalSpaceSmall(),
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
                              hintText: 'Enter Total Amount',

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
                          padding: EdgeInsets.all(5),
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
                                              padding: const EdgeInsets.all(5),
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
                                              padding: const EdgeInsets.all(5),
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
                                child: const Text('Browse'),
                              ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        backgroundColor: Colors.blue[300],
        child: const Icon(Icons.home),
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
