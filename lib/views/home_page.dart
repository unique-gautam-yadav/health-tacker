import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:health_tracker/common/app_colors.dart';
import 'package:health_tracker/common/fade_zoom.dart';
import 'package:health_tracker/common/scale_button.dart';
import 'package:health_tracker/views/stats.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> categories = [
    'All',
    'Activity',
    'Running',
    'Push Up',
    'Calculation'
  ];

  String selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              FadeInAnimation(
                delay: 1,
                child: Row(
                  children: [
                    Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(120),
                        image: const DecorationImage(
                          image: AssetImage('assets/profile.jpeg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Tanya Bansal",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Pro Account",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.all(25),
                        minimumSize: const Size(0, 0),
                        foregroundColor: AppColors.darkColor,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const StatsPage()));
                      },
                      child: const Icon(Iconsax.menu_board),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              const FadeInAnimation(
                delay: 1.5,
                child: FittedBox(
                  child: Text(
                    "Activity\nSummary",
                    style: TextStyle(
                      fontSize: 62,
                      fontWeight: FontWeight.w500,
                      height: 1.3,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              FadeInAnimation(
                delay: 1.5,
                child: SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ListView.separated(
                    itemCount: categories.length,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 10),
                    itemBuilder: (context, index) {
                      bool isSelected = selectedCategory == categories[index];
                      return ScaleButton(
                        onTap: () {
                          setState(() {
                            selectedCategory = categories[index];
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              color: isSelected
                                  ? AppColors.darkColor
                                  : Colors.white,
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(30)),
                          child: Center(
                            child: DefaultTextStyle(
                              style: TextStyle(
                                color: isSelected
                                    ? Colors.white
                                    : AppColors.darkColor,
                                fontSize: 18,
                              ),
                              child: Text(
                                categories[index],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              FadeInAnimation(
                delay: 2,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            CustomTile(
                              dotColor: AppColors.targetColor,
                              title: "2400 Kcal",
                              subtitle: "Target",
                            ),
                            const SizedBox(height: 20),
                            CustomTile(
                              dotColor: AppColors.consumeColor,
                              title: "1098 Kcal",
                              subtitle: "Consume",
                            ),
                            const SizedBox(height: 20),
                            CustomTile(
                              dotColor: AppColors.remainingColor,
                              title: "234 Kcal",
                              subtitle: "Remaining",
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 180,
                          width: 180,
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: CustomPaint(
                                  painter: GraphPainter(),
                                ),
                              ),
                              Positioned(
                                top: 10,
                                left: 20,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(1002),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 40, sigmaY: 40),
                                    child: const SizedBox(
                                      width: 35,
                                      height: 35,
                                      child: Center(
                                        child: Text(
                                          "1",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 45,
                                right: 0,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(1002),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 40, sigmaY: 40),
                                    child: const SizedBox(
                                      width: 35,
                                      height: 35,
                                      child: Center(
                                        child: Text(
                                          "2",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 50,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(1002),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 40, sigmaY: 40),
                                    child: const SizedBox(
                                      width: 35,
                                      height: 35,
                                      child: Center(
                                        child: Text(
                                          "3",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              FadeInAnimation(
                delay: 2.5,
                child: Row(
                  children: [
                    _bottomCard(
                      header: "🔥  Calories",
                      percentage: "  12.0%  ",
                      value: "234",
                      unit: "Kcal",
                      color: Colors.indigo,
                    ),
                    const SizedBox(width: 8),
                    _bottomCard(
                      header: "💪  Exercise",
                      percentage: "  9.2%  ",
                      value: "123",
                      unit: "Minutes",
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Expanded _bottomCard(
      {required String header,
      required String percentage,
      required Color color,
      required String value,
      required String unit}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Column(
          children: [
            Text(
              header,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              decoration: BoxDecoration(
                color: AppColors.creamColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                    decoration: BoxDecoration(
                      color: color.withOpacity(.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      percentage,
                      style: TextStyle(
                        color: color,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  FractionallySizedBox(
                    widthFactor: 1,
                    child: Text(
                      value,
                      style: const TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Text(
                    unit,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GraphPainter extends CustomPainter {
  final onePercentRadian = 0.06283;
  @override
  void paint(Canvas canvas, Size size) {
    final paintBackground = Paint()
      ..strokeWidth = 40
      ..color = AppColors.remainingColor
      ..style = PaintingStyle.stroke;

    final targetProgress = Paint()
      ..strokeWidth = 40
      ..color = AppColors.targetColor
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.stroke;

    final consumeProgress = Paint()
      ..strokeWidth = 40
      ..color = AppColors.consumeColor
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(
      Offset(size.height / 2, size.width / 2),
      size.width / 3,
      paintBackground,
    );

    canvas.drawArc(
        Rect.fromCenter(
          center: Offset(size.height / 2, size.width / 2),
          width: size.width - 60,
          height: size.width - 60,
        ),
        pi / 8,
        _converPercentageToRadian(.5),
        false,
        consumeProgress);

    canvas.drawArc(
        Rect.fromCenter(
          center: Offset(size.height / 2, size.width / 2),
          width: size.width - 60,
          height: size.width - 60,
        ),
        pi * .7,
        _converPercentageToRadian(.5),
        false,
        targetProgress);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  double _converPercentageToRadian(double progress) {
    return onePercentRadian * progress * 100;
  }
}

class CustomTile extends StatelessWidget {
  const CustomTile({
    super.key,
    required this.dotColor,
    required this.title,
    required this.subtitle,
  });

  final Color dotColor;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 8),
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            color: dotColor,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              subtitle,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
