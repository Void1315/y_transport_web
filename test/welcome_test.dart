// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ytransportweb/main.dart';

void main() {
  testWidgets('welcome页面应该正常工作', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    expect(find.text('Y出行'), findsOneWidget);
    expect(find.text('陪伴您出行的最好方式'), findsOneWidget);
  });
}
