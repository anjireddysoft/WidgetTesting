import 'package:flutter/material.dart';
import 'package:flutter_test_practice/password_controller.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PasswordController controller = Get.put(PasswordController());


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Widget Testing"),
        ),
        body: Column(
          children: [
            const Text("Password"),
            Obx(
              () => TextField(
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: controller.passwordVisble.value
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                      onPressed: () {
                        controller.showPassword();
                      },
                    )),
              ),
            ),
            Obx(() => controller.isLoading.value
                ? CircularProgressIndicator()
                : Expanded(
                  child: ListView.builder(
              shrinkWrap: true,
              itemCount: controller.albumList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title:Text(controller.albumList[index].title) ,
                          subtitle: Text(controller.albumList[index].userId.toString()),
                        );
                      },
                    ),
                ))
          ],
        ),
      ),
    );
  }
}
