import 'package:flutter/material.dart';

class NotificationPermissionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                '주식참견',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              Text(
                '기업 소식을 알려드릴까요?',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                '기업, 시장 변동 등 회원님을 위한\n맞춤 정보를 제공해 드릴 예정입니다.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  // Implement notification permission request
                },
                child: Text('알림 허용하기'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
              ),
              SizedBox(height: 16),
              OutlinedButton(
                onPressed: () {
                  // Handle case when user doesn't want notifications
                },
                child: Text('알림 허용 안함'),
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
              ),
              SizedBox(height: 40),
              TextButton(
                onPressed: () {
                  // Navigate to the main app screen or next step
                },
                child: Text('가입하기'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}