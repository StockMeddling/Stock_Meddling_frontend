import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class MainDashboardScreen extends StatefulWidget {
  @override
  _MainDashboardScreenState createState() => _MainDashboardScreenState();
}

class _MainDashboardScreenState extends State<MainDashboardScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('주식참견'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Implement search functionality
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: '주가 지수'),
            Tab(text: '환율'),
            Tab(text: '관심목록'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildStockIndexTab(),
          _buildExchangeRateTab(),
          _buildWatchlistTab(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.pie_chart), label: '포트폴리오'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '내 정보'),
        ],
        onTap: (index) {
          // Implement navigation
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PortfolioScreen()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          }
        },
      ),
    );
  }

  Widget _buildStockIndexTab() {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        _buildIndexCard('코스피', '2,710.65', '48.06 (1.74%)', Colors.red),
        SizedBox(height: 16),
        _buildIndexCard('코스닥', '797.29', '16.96 (2.08%)', Colors.red),
        SizedBox(height: 16),
        _buildStockList(),
      ],
    );
  }

  Widget _buildIndexCard(String name, String value, String change, Color changeColor) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(value, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                Text(change, style: TextStyle(fontSize: 18, color: changeColor)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStockList() {
    // Implement a list of stocks with their prices and changes
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 5, // Example count
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Stock Name'),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Price'),
              Text('Change %', style: TextStyle(color: Colors.green)),
            ],
          ),
        );
      },
    );
  }

  Widget _buildExchangeRateTab() {
    // Implement exchange rate tab
    return Center(child: Text('Exchange Rate Tab'));
  }

  Widget _buildWatchlistTab() {
    // Implement watchlist tab
    return Center(child: Text('Watchlist Tab'));
  }
}

class PortfolioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('포트폴리오')),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildPortfolioSection(),
          SizedBox(height: 16),
          _buildPortfolioImprovementSection(),
          SizedBox(height: 16),
          _buildRiskMatrixSection(),
        ],
      ),
    );
  }

  Widget _buildPortfolioSection() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('회원님의 포트폴리오', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            AspectRatio(
              aspectRatio: 1.5,
              child: PieChart(
                PieChartData(
                  sections: [
                    PieChartSectionData(value: 50, title: 'AAPL', color: Colors.red),
                    PieChartSectionData(value: 25, title: 'NVDA', color: Colors.blue),
                    PieChartSectionData(value: 25, title: 'KAKAO', color: Colors.yellow),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Text('총: 1,960,395 원', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('AAPL +2.3% +401,405원', style: TextStyle(color: Colors.green)),
            Text('NVDA +14.5% +2,412,142원', style: TextStyle(color: Colors.green)),
            Text('KAKAO -5.4% -853,152원', style: TextStyle(color: Colors.red)),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navigate to detailed portfolio view
              },
              child: Text('결과 보러가기'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPortfolioImprovementSection() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('회원님의 포트폴리오 개선점', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            _buildImprovementItem('AAPL 비중: 50% -> 40%', '이유: 과도한 집중 위험'),
            _buildImprovementItem('NVDA 비중: 25% -> 30%', '이유: 성장 잠재력 증가'),
            _buildImprovementItem('KAKAO 비중: 25% -> 30%', '이유: 저평가 상태'),
          ],
        ),
      ),
    );
  }

  Widget _buildImprovementItem(String title, String description) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(description),
        ],
      ),
    );
  }

  Widget _buildRiskMatrixSection() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('리스크 Matrix', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            AspectRatio(
              aspectRatio: 1,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                ),
                itemCount: 9,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      color: _getRiskColor(index),
                    ),
                    child: Center(
                      child: Text(_getRiskLabel(index)),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getRiskColor(int index) {
    if (index % 4 == 0) return Colors.red;
    if (index % 2 == 0) return Colors.yellow;
    return Colors.green;
  }

  String _getRiskLabel(int index) {
    if (index % 4 == 0) return '고위험';
    if (index % 2 == 0) return '중위험';
    return '저위험';
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('내 정보')),
      body: ListView(
        children: [
          ListTile(
            title: Text('비밀번호 변경'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to password change screen
            },
          ),
          ListTile(
            title: Text('닉네임 변경'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to nickname change screen
            },
          ),
          ListTile(
            title: Text('위험 선호도 변경'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to risk preference change screen
            },
          ),
          ListTile(
            title: Text('알림 설정'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to notification settings screen
            },
          ),
          ListTile(
            title: Text('로그아웃'),
            onTap: () {
              // Implement logout functionality
            },
          ),
        ],
      ),
    );
  }
}