import 'package:flutter/material.dart';

class FindAccountScreen extends StatefulWidget {
  @override
  _FindAccountScreenState createState() => _FindAccountScreenState();
}

class _FindAccountScreenState extends State<FindAccountScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _verificationController = TextEditingController();
  TextEditingController _idController = TextEditingController();
  bool _isVerificationSent = false;
  int _remainingTime = 300; // 5 minutes in seconds

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _phoneController.dispose();
    _verificationController.dispose();
    _idController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('아이디 / 비밀번호 찾기'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: '아이디 찾기'),
            Tab(text: '비밀번호 찾기'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildFindIdTab(),
          _buildFindPasswordTab(),
        ],
      ),
    );
  }

  Widget _buildFindIdTab() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _phoneController,
            decoration: InputDecoration(
              labelText: '휴대폰 번호 입력 (- 제외 11자리 입력)',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.phone,
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _isVerificationSent = true;
              });
            },
            child: Text('인증번호 발송'),
          ),
          if (_isVerificationSent) ...[
            SizedBox(height: 10),
            TextField(
              controller: _verificationController,
              decoration: InputDecoration(
                labelText: '인증번호 입력',
                border: OutlineInputBorder(),
                suffixText: '${_remainingTime ~/ 60}:${(_remainingTime % 60).toString().padLeft(2, '0')}',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Implement verification logic
              },
              child: Text('확인'),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildFindPasswordTab() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _idController,
            decoration: InputDecoration(
              labelText: '아이디 입력',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            controller: _phoneController,
            decoration: InputDecoration(
              labelText: '휴대폰 번호 입력 (- 제외 11자리 입력)',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.phone,
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _isVerificationSent = true;
              });
            },
            child: Text('인증번호 발송'),
          ),
          if (_isVerificationSent) ...[
            SizedBox(height: 10),
            TextField(
              controller: _verificationController,
              decoration: InputDecoration(
                labelText: '인증번호 입력',
                border: OutlineInputBorder(),
                suffixText: '${_remainingTime ~/ 60}:${(_remainingTime % 60).toString().padLeft(2, '0')}',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Implement verification logic
              },
              child: Text('확인'),
            ),
          ],
        ],
      ),
    );
  }
}