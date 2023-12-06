import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MazeWidget(),
    );
  }
}

class MazeWidget extends StatelessWidget {
  const MazeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: CustomPaint(
          painter: MazePainter(),
          size: Size(screenSize.width, screenSize.height),
        ),
      ),
    );
  }
}

class MazePainter extends CustomPainter {
  // 迷路の各セルが壁か通路かを表す整数の配列
  // 1が壁、0が通路
  final List<List<int>> mazeData = [
    [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
    [1, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1],
    [1, 0, 1, 1, 0, 1, 1, 0, 0, 1, 0, 1, 0, 1, 1],
    [1, 0, 1, 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 1, 1],
    [1, 0, 0, 1, 0, 1, 0, 1, 1, 1, 0, 1, 0, 1, 1],
    [1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 1, 1],
    [1, 1, 1, 1, 0, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1],
    [1, 1, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 0, 1, 1],
    [1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 1, 0, 1, 1],
    [1, 1, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 1],
    [1, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1],
    [1, 0, 1, 1, 0, 1, 0, 0, 0, 1, 1, 1, 0, 0, 1],
    [1, 0, 1, 1, 0, 1, 1, 1, 0, 1, 0, 1, 1, 0, 1],
    [1, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 1],
    [1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 1, 1],
    [1, 1, 0, 0, 0, 1, 0, 1, 1, 1, 0, 1, 0, 1, 1],
    [1, 1, 1, 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 1, 1],
    [1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 1],
    [1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 0, 0, 1],
    [1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1],
    [1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1],
    [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
  ];

  @override
  // 描画ロジック
  void paint(Canvas canvas, Size size) {
    // どのように図形を描画するか定義
    final paint = Paint()..color = Colors.green;
    // スクリーン幅を列の数で割ることで、各セルの幅を計算（mazeData[0]:最初の行、mazeData[0].length:最初の行の長さ、つまり列の数）
    final cellWidth = size.width / mazeData[0].length;
    // スクリーンの高さを行の数で割ることで、各セルの高さを計算（mazeData.length:配列の長さ、つまり行の数）
    final cellHeight = size.height / mazeData.length;
    // 迷路の描画
    for (int i = 0; i < mazeData.length; i++) {
      for (int j = 0; j < mazeData[i].length; j++) {
        if (mazeData[i][j] == 1) {
          // 描画する四角形の位置とサイズを定義
          final rect = Rect.fromLTWH(
              j * cellWidth, i * cellHeight, cellWidth, cellHeight);
          // 四角形をキャンバスに描画
          canvas.drawRect(rect, paint);
        }
      }
    }
  }

  @override
  // 再描画するか定義
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
