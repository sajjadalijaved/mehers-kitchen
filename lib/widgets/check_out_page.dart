import 'package:flutter/material.dart';
import 'package:mehers_kitchen/bloc/confirmorderbloc/bloc/confirm_order_bloc.dart';
import 'package:mehers_kitchen/modelclasses/confirm_order_page.dart';
import 'package:mehers_kitchen/widgets/client_id.dart';
import 'package:provider/provider.dart';

class CheckoutScreenInitialUI extends StatelessWidget {
  CheckoutScreenInitialUI({Key? key}) : super(key: key);
  final TextEditingController phoneNoTextEditingController =
      TextEditingController();
  final TextEditingController specialInstructionTextEditingController =
      TextEditingController();
  final TextEditingController addressTextEditingController =
      TextEditingController();

  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: const Color(0Xff342b26),
      child: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Column(
            children: [
              //row......logo and text
              SizedBox(
                height: height * 0.1,
                child: Row(
                  children: [
                    //icon
                    SizedBox(
                      width: width * 0.15,
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    //Text
                    SizedBox(
                      width: width * 0.85,
                      child: Center(
                        child: Text(
                          'Secure CheckOut',
                          style: TextStyle(
                              color: Colors.yellow, fontSize: height * 0.03),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //space
              SizedBox(
                height: height * 0.02,
              ),
              //textField for Phone Number
              SizedBox(
                width: width * 0.8,
                height: height * 0.1,
                child: TextFormField(
                  // key: _phoneNumberKey,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Phone Number is Must';
                    } else if (value.length != 11) {
                      return 'Enter a Valid Phone No';
                    }
                    return null;
                  },
                  //controller: phoneNoTextEditingController,

                  controller: phoneNoTextEditingController,
                  decoration: InputDecoration(
                      hintText: 'Phone Number',
                      hintStyle: const TextStyle(color: Colors.white),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.yellow),
                          borderRadius: BorderRadius.circular(width * 0.03)),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(width * 0.03))),
                ),
              ),

              //space
              SizedBox(
                height: height * 0.02,
              ),
              //address
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: Container(
                  height: height * 0.15,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(width * 0.05),
                  ),
                  child: Row(
                    children: [
                      //textField
                      SizedBox(
                        width: width * 0.70,
                        child: Padding(
                          padding: EdgeInsets.only(left: width * 0.03),
                          child: TextFormField(
                            controller: addressTextEditingController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Correct Address';
                              }
                              return null;
                            },
                            readOnly: true,
                            maxLines: 3,
                            style: TextStyle(
                                color: Colors.white, fontSize: height * 0.02),
                            //key: _addressKey,
                            decoration: const InputDecoration(
                              hintText:
                                  'Tap on Icon,To Get your Current Location',
                              hintStyle: TextStyle(color: Colors.white),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      //space
                      SizedBox(
                        width: width * 0.03,
                      ),
                      //icon
                      SizedBox(
                        width: width * 0.12,
                        child: GestureDetector(
                          onTap: () {
                            // Provider.of<ConfirmOrderBloc>(context,
                            //         listen: false)
                            //     .add(
                            //         GetCurrentLocationOfUserSuccessfullyEvent());
                            addressTextEditingController.text =
                                'Dahranwala  Punjab Pakistan';
                          },
                          child: const Icon(
                            Icons.location_on,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //space
              SizedBox(
                height: height * 0.02,
              ),
              //text
              SizedBox(
                height: height * 0.05,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: width * 0.05),
                    child: Text(
                      'Specially Instruction',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: height * 0.03,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              //space
              SizedBox(
                height: height * 0.02,
              ),
              SizedBox(
                height: height * 0.05,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: width * 0.05),
                    child: Text(
                      '''Any specific preferences? Let us Know                      ''',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: height * 0.02,
                      ),
                    ),
                  ),
                ),
              ),
              //textField for special instruction
              //space
              SizedBox(
                height: height * 0.02,
              ),
              //textField
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: Container(
                  height: height * 0.12,
                  width: width * 0.8,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(width * 0.03),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                    child: TextField(
                      maxLines: 4,
                      controller: specialInstructionTextEditingController,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'e.g tasty or chatpata etc',
                          hintStyle: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ),
              //space
              SizedBox(
                height: height * 0.01,
              ),
              //text price
              SizedBox(
                height: height * 0.05,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                  child: Row(
                    children: [
                      SizedBox(
                        width: width * 0.2,
                        child: Text(
                          'Total',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: height * 0.03),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.52,
                      ),
                      SizedBox(
                        width: width * 0.2,
                        child: Text(
                          ClientId.orderTotalAmount.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: height * 0.03,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //space
              SizedBox(
                height: height * 0.04,
              ),
              //button
              InkWell(
                onTap: () {
                  if (_key.currentState!.validate()) {
                    Provider.of<ConfirmOrderBloc>(context, listen: false).add(
                        ConfirmOrderSuccessfullyEvent(
                            model: ConfirmOrderModel(
                                clientId: ClientId.clientId,
                                orderTotalAmount: ClientId.orderTotalAmount,
                                orderAmount: ClientId.orderAmount,
                                orderDescription:
                                    specialInstructionTextEditingController
                                        .text,
                                deliveryAddress:
                                    addressTextEditingController.text,
                                deliveryPhoneNumber:
                                    phoneNoTextEditingController.text,
                                taxPercentage: ClientId.taxPercentage,
                                deliveryCharges: ClientId.deliveryCharges,
                                taxAmount: ClientId.taxAmount)));
                  }
                },
                child: Container(
                  width: width * 0.75,
                  height: height * 0.07,
                  decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(width * 0.03)),
                  child: Center(
                    child: Text(
                      'Order Now',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: height * 0.025),
                    ),
                  ),
                ),
              ),
              //space
              SizedBox(
                height: height * 0.15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
