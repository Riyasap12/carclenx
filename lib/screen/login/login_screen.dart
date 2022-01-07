import 'package:carclenx/constant/request_status.dart';
import 'package:carclenx/screen/login/login_controller.dart';
import 'package:carclenx/screen/main_screen/main_screen.dart';
import 'package:carclenx/shared_widget/appbar_custom.dart';
import 'package:carclenx/shared_widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  String? number;
  final _formKey = GlobalKey<FormState>();
  unfocus() {
    final currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
  @override
  Widget build(BuildContext context) {
    ref.listen(loginController, (previous, next) {
      if(next is LoginState){
        switch(next.requestStatus) {
          case RequestStatus.initial:
          // TODO: Handle this case.
            break;
          case RequestStatus.requesting:
          // TODO: Handle this case.
            break;
          case RequestStatus.success:
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
              return const MainScreen();
            }));
            break;
          case RequestStatus.error:
          // TODO: Handle this case.
            break;
        }
        }
    });
    return GestureDetector(
      onTap: unfocus,
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                ),
                Center(
                  child: Text(
                    "Verify your mobile number",
                    style: Theme.of(context).textTheme.headline4,
                    textAlign: TextAlign.center,
                  ),
                ),
                // SizedBox(
                //   height: 15.sp,
                // ),
                // if (deepLink != '')
                //   Center(
                //     child: Text(
                //       deepLink
                //           .substring(deepLink.length - 11),
                //       style: Theme.of(context).textTheme.headline3,
                //     ),
                //   ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color:
                        Colors.black.withOpacity(.1),
                        blurRadius: 23,
                        offset: Offset(0, 14),
                      )
                    ],
                  ),
                  child: Stack(
                    children: [
                      TextFormField(
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        autofocus: true,
                        maxLength: 10,
                        validator: (value) {
                              if (value!.length < 10) {
                                return 'Please enter Valid Number';
                              }
                        },
                        keyboardType: TextInputType.phone,
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 24
                        ),
                        cursorColor: Colors.red,
                        decoration: InputDecoration(
                          counterText: "",
                          contentPadding: EdgeInsets.fromLTRB(
                            16,
                            20,
                            12,
                            12,
                          ),
                          fillColor:  Colors.white,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          hintText: "Enter Your Mobile Number",
                          hintStyle: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
                              color: Colors.grey,
                              letterSpacing: .2),
                        ),
                        onChanged: (value) {
                          number = value;
                        },
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                SizedBox(height: 24),
                Padding(
                  padding: EdgeInsets.only(bottom: 24),
                  child: Consumer(
                    builder: (context, ref, child) {
                      final state = ref.watch(loginController);
                      if (state is LoginState && state.requestStatus == RequestStatus.requesting) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.red,
                          ),
                        );
                      } else {
                        return CustomButton(
                          title: "Get OTP",
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              ref
                                  .read(loginController.notifier)
                                  .login(number!);
                            }
                          },
                        );
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

