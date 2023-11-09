import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:users_example/home_screen.dart';
import 'package:users_example/user_model.dart';

void main() {
  testWidgets('Displays List of users with title as name and subtitle as email',
      (tester) async {
    final users = [
      User(id: 1, name: 'user1', email: 'user1@gmail.com'),
      User(id: 1, name: 'user1', email: 'user1@gmail.com'),
      User(id: 1, name: 'user1', email: 'user1@gmail.com'),
    ];
    Future<List<User>> mockFetchUser() async {
      return users;
    }

    await tester.pumpWidget(MaterialApp(
      home: HomeScreen(futureUsers: mockFetchUser()),
    ));
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    tester.pumpAndSettle();

    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(ListTile), findsNWidgets(users.length));

    for (final user in users) {
      expect(find.text(user.name), findsOneWidget);
      expect(find.text(user.email), findsOneWidget);
    }
  });
}
