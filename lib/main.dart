import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'find_account_screen.dart';
import 'signup_screen.dart';
import 'notification_permission_screen.dart';
import 'main_dashboard_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '주식참견',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/find_account': (context) => FindAccountScreen(),
        '/signup': (context) => SignupScreen(),
        '/notification_permission': (context) => NotificationPermissionScreen(),
        '/main_dashboard': (context) => MainDashboardScreen(),
      },
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 여기에 로그인 화면 위젯을 추가합니다.
            ElevatedButton(
              child: Text('로그인'),
              onPressed: () {
                // 로그인 로직을 구현한 후 메인 대시보드로 이동
                Navigator.pushReplacementNamed(context, '/main_dashboard');
              },
            ),
            TextButton(
              child: Text('아이디/비밀번호 찾기'),
              onPressed: () {
                Navigator.pushNamed(context, '/find_account');
              },
            ),
            TextButton(
              child: Text('회원가입'),
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
            ),
          ],
        ),
      ),
    );
  }
}

// FindAccountScreen, SignupScreen, NotificationPermissionScreen, MainDashboardScreen은
// 각각의 파일에서 정의된 대로 사용합니다.