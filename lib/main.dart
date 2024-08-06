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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 여기에 로고 이미지 위젯을 추가합니다.
              // Image.asset('assets/logo.png'), // 로고 이미지 경로에 맞게 수정하세요
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: '아이디',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: '비밀번호',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Checkbox(
                    value: true, // 아이디 저장 초기값 설정
                    onChanged: (bool? value) {
                      // 아이디 저장 체크박스 로직 구현
                    },
                  ),
                  Text('아이디 저장'),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text('로그인'),
                onPressed: () {
                  // 로그인 로직을 구현한 후 메인 대시보드로 이동
                  Navigator.pushReplacementNamed(context, '/main_dashboard');
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    child: Text('아이디 찾기'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/find_account');
                    },
                  ),
                  Text('|'),
                  TextButton(
                    child: Text('비밀번호 찾기'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/find_account');
                    },
                  ),
                  Text('|'),
                  TextButton(
                    child: Text('회원가입'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              Divider(),
              SizedBox(height: 20),
              Text(
                'SNS 로그인',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Image.asset('assets/google_logo.png'), // 구글 로고 이미지 경로에 맞게 수정하세요
                    iconSize: 50,
                    onPressed: () {
                      // 구글 로그인 로직 구현
                    },
                  ),
                  IconButton(
                    icon: Image.asset('assets/kakao_logo.png'), // 카카오 로고 이미지 경로에 맞게 수정하세요
                    iconSize: 50,
                    onPressed: () {
                      // 카카오 로그인 로직 구현
                    },
                  ),
                  IconButton(
                    icon: Image.asset('assets/naver_logo.png'), // 네이버 로고 이미지 경로에 맞게 수정하세요
                    iconSize: 50,
                    onPressed: () {
                      // 네이버 로그인 로직 구현
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text('비회원 로그인'),
                onPressed: () {
                  // 비회원 로그인 로직 구현
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  backgroundColor: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
