import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_practice/album_model.dart';
import 'package:flutter_test_practice/api_provider.dart';
import 'package:flutter_test_practice/main.dart';
import 'package:flutter_test_practice/password_controller.dart';
import 'package:get/get.dart';
import 'package:mocktail/mocktail.dart';

class MockApiProvider extends Mock implements ApiProvider {}

void main() {
  late PasswordController passwordController;
  List<Album> albumList = [
    Album(userId: 1, id: 1, title: "title1"),
    Album(userId: 2, id: 2, title: "title1"),
    Album(userId: 3, id: 3, title: "title1")
  ];
  setUp(() async {
    passwordController = Get.put(PasswordController());
    passwordController.apiProvider = MockApiProvider();
  });
  testWidgets("has Password lable text", (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();
    expect(find.text("Password"), findsOneWidget);
  });

  testWidgets("has Password input field", (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();
    var textField = find.byType(TextField);
    expect(textField, findsOneWidget);
  });
  testWidgets("has Password closed icon", (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();
    // var textField = find.byType(TextField);
    expect(find.byIcon(Icons.visibility_off), findsOneWidget);
  });

  testWidgets("has Password closed icon test", (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();
    await tester.tap(find.byType(IconButton));

    await tester.pumpAndSettle();
    expect(find.byIcon(Icons.visibility), findsOneWidget);
    expect(passwordController.passwordVisble.value, true);
    await tester.tap(find.byType(IconButton));
    await tester.pumpAndSettle();

    expect(passwordController.passwordVisble.value, false);
  });

  testWidgets("has test Api call data", (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();
    expect(passwordController.isLoading.value, false);
    expect(passwordController.albumList, []);
  });

  testWidgets("has test Api call A", (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();
    when(() => passwordController.apiProvider.fetchAlbum())
        .thenAnswer((_) async =>albumList);
    final future = passwordController.getAlbumData();
    expect(passwordController.isLoading.value, true);
    await future;
    expect(passwordController.albumList, albumList);
    expect(passwordController.isLoading.value, false);
  });
}
