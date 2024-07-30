import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedRiskPreference;
  List<String> _selectedStocks = [];
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('회원 가입 (1/3)'),
    ),
    body: Form(
    key: _formKey,
    child: ListView(
    padding: EdgeInsets.all(16.0),
    children: [
    Text('회원이 되어 서비스를 이용해보세요!', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    SizedBox(height: 20),
    TextFormField(
    decoration: InputDecoration(
    labelText: '아이디 입력 (6~20자)',
    border: OutlineInputBorder(),
    suffixIcon: TextButton(
    onPressed: () {
    // Implement ID duplication check
    },
    child: Text('중복 확인'),
    ),
    ),
    validator: (value) {
    if (value == null || value.isEmpty || value.length < 6 || value.length > 20) {
    return '아이디는 6~20자 사이여야 합니다.';
    }
    return null;
    },
    ),
    SizedBox(height: 10),
    TextFormField(
    obscureText: true,
    decoration: InputDecoration(
    labelText: '비밀번호 입력 (문자, 숫자, 특수문자 포함 8~20자)',
    border: OutlineInputBorder(),
    ),
    validator: (value) {
    if (value == null || value.isEmpty || value.length < 8 || value.length > 20) {
    return '비밀번호는 8~20자 사이여야 합니다.';
    }
    // Add more complex password validation if needed
    return null;
    },
    ),
    SizedBox(height: 10),
    TextFormField(
    obscureText: true,
    decoration: InputDecoration(
    labelText: '비밀번호 재입력',
    border: OutlineInputBorder(),
    ),
    validator: (value) {
    // Implement password matching validation
    return null;
    },
    ),
    SizedBox(height: 10),
    TextFormField(
    decoration: InputDecoration(
    labelText: '이름',
    border: OutlineInputBorder(),
    ),
    validator: (value) {
    if (value == null || value.isEmpty) {
    return '이름을 입력해주세요.';
    }
    return null;
    },
    ),
    SizedBox(height: 10),
    InkWell(
    onTap: () async {
    final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1900),
    lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
    setState(() {
    _selectedDate = picked;
    });
    }
    },
    child: InputDecorator(
    decoration: InputDecoration(
    labelText: '생년월일',
    border: OutlineInputBorder(),
    ),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Text(_selectedDate == null ? '날짜를 선택하세요' : '${_selectedDate!.year}년 ${_selectedDate!.month}월 ${_selectedDate!.day}일'),
    Icon(Icons.calendar_today),
    ],
    ),
    ),
    ),
    SizedBox(height: 10),
      TextFormField(
        decoration: InputDecoration(
          labelText: '휴대폰 번호 입력 (- 제외 11자리 입력)',
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.phone,
        validator: (value) {
          if (value == null || value.isEmpty || value.length != 11) {
            return '올바른 휴대폰 번호를 입력해주세요.';
          }
          return null;
        },
      ),
      SizedBox(height: 10),
      TextFormField(
        decoration: InputDecoration(
          labelText: '이메일 주소',
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value == null || value.isEmpty || !value.contains('@')) {
            return '올바른 이메일 주소를 입력해주세요.';
          }
          return null;
        },
      ),
      SizedBox(height: 10),
      TextFormField(
        decoration: InputDecoration(
          labelText: '예상 투자 금액',
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '예상 투자 금액을 입력해주세요.';
          }
          return null;
        },
      ),
      SizedBox(height: 10),
      DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: '위험 선호도를 선택해 주세요 (추후 변경 가능)',
          border: OutlineInputBorder(),
        ),
        value: _selectedRiskPreference,
        items: ['위험 선호', '위험 중립', '위험 기피']
            .map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            _selectedRiskPreference = newValue;
          });
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '위험 선호도를 선택해주세요.';
          }
          return null;
        },
      ),
      SizedBox(height: 10),
      Text('관심 종목 (선택)', style: TextStyle(fontSize: 16)),
      Wrap(
        spacing: 8.0,
        children: [
          'AAPL', 'GOOGL', 'MSFT', 'AMZN', 'FB'
        ].map((String stock) {
          final isSelected = _selectedStocks.contains(stock);
          return FilterChip(
            label: Text(stock),
            selected: isSelected,
            onSelected: (bool selected) {
              setState(() {
                if (selected) {
                  _selectedStocks.add(stock);
                } else {
                  _selectedStocks.remove(stock);
                }
              });
            },
          );
        }).toList(),
      ),
      SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('이전으로'),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Proceed to the next step of registration
                // You can navigate to a new page or update the current page
                print('Form is valid. Proceed to next step.');
              }
            },
            child: Text('다음으로'),
          ),
        ],
      ),
      SizedBox(height: 10),
      TextButton(
        onPressed: () {
          // Handle registration cancellation
        },
        child: Text('가입 취소'),
      ),
    ],
    ),
    ),
    );
  }
}