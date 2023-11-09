import 'package:counter_app/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
      'given counter is 0 when increment button is clicked then counter should be 1',
      (tester) async {
    await tester
        .pumpWidget(const MaterialApp(home: MyHomePage(title: 'title')));
    final ctr1 = find.text('0');
    expect(ctr1, findsOneWidget);

    final ctr2 = find.text('1');
    expect(ctr2, findsNothing);

    // 위젯 안에서 타입에 해당하는 하위 위젯 찾기
    // byWidget을 사용하면 인스턴스를 호출해야하지만, byType은 타입명만 지정해줘도 된다.
    final incrementBtn = find.byType(FloatingActionButton);
    await tester.tap(incrementBtn);
    await tester.pump();

    final ctr3 = find.text('1');
    expect(ctr3, findsOneWidget);

    final ctr4 = find.text('0');
    expect(ctr4, findsNothing);
  });
}
