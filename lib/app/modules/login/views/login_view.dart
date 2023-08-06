import 'package:aqarat_admin/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetX(
      init: LoginController(),
      builder: (controller) {
        return Scaffold(
            body: Container(
          height: Get.height,
          width: Get.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: Get.height * 0.4,
                  width: Get.width,
                  child: Center(
                    child: Text(
                      controller.title.value,
                      style: const TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: Get.height * 0.6,
                  width: Get.width,
                  child: Column(
                    children: [
                      Container(
                        width: Get.width * 0.8,
                        child: TextFormField(
                          controller: controller.emailController,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        width: Get.width * 0.8,
                        child: TextFormField(
                          controller: controller.passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        width: Get.width * 0.8,
                        height: 50.0,
                        child: ElevatedButton(
                          onPressed: () {
                            controller.Login();
                          },
                          child: const Text('Login'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 255, 189, 74),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      // Container(
                      //   width: Get.width * 0.8,
                      //   height: 50.0,
                      //   child: ElevatedButton(
                      //     onPressed: () {
                      //       controller.register();
                      //     },
                      //     style: ElevatedButton.styleFrom(
                      //       backgroundColor: const Color.fromARGB(255, 255, 189, 74),
                      //       shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(10.0),
                      //       ),
                      //     ),
                      //     child: const Text('Register'),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
      },
    );
  }
}
