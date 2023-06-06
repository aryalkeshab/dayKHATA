import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/Core/resources/colors.dart';
import 'package:my_app/Screen/Payment/Controller/amount_received_controller.dart';
import 'package:my_app/Screen/Payment/Model/Response/user_list_response.dart';
import 'package:my_app/Screen/Payment/View/amount_received.dart';
import '../../../Core/utils/size_config.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final AmountReceivedController _amountReceivedController =
      Get.put(AmountReceivedController());

  final _controller = TextEditingController();
  int? selecteditem;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _clearText() {
    _controller.clear();
    selecteditem = null;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              CustomContainer(
                child: Row(
                  children: [
                    InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(Icons.arrow_back)),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: TextFormField(
                        onChanged: (value) {
                          // controller.getUserList(value.toString());
                          _amountReceivedController
                              .getUserList(value.toString());
                          print(value);
                        },
                        autofocus: true,
                        controller: _controller,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              onPressed: () {
                                _clearText();
                              },
                              icon: const Icon(
                                Icons.clear,
                                color: Colors.black,
                              ),
                            ),
                            hintText: 'Account name',
                            hintStyle: TextStyle(color: Colors.grey[400])
                            // label: Text(title),
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              SizeConfig(context).verticalSpaceMedium(),
              GetBuilder<AmountReceivedController>(
                init: _amountReceivedController,
                builder: (controller) {
                  return Expanded(
                    child: Container(
                      child: ListView.builder(
                        itemCount: controller.userListResponse.length,
                        itemBuilder: (context, index) {
                          UserListResponse user =
                              controller.userListResponse[index];
                          return Card(
                            color: Colors.grey[300],
                            child: ListTile(
                              selected:
                                  selecteditem != null && selecteditem == index,
                              selectedColor: primarycolor,
                              onTap: () {
                                // setState(() {
                                //   selecteditem = index;
                                //   _controller.text = user.acname.toString();
                                // });
                              },
                              title: Text(user.acname.toString()),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
