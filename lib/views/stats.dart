import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_tracker/common/app_colors.dart';
import 'package:health_tracker/common/fade_zoom.dart';
import 'package:iconsax/iconsax.dart';

class StatsPage extends StatelessWidget {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
          background: AppColors.darkColor,
        ),
        useMaterial3: true,
        fontFamily: GoogleFonts.nunito().fontFamily,
      ),
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: MediaQuery.paddingOf(context).top + 30),
            FadeInAnimation(
              delay: 1,
              child: Row(
                children: [
                  const SizedBox(width: 16),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.all(25),
                      minimumSize: const Size(0, 0),
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Iconsax.arrow_left),
                  ),
                  const Spacer(),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.all(25),
                      minimumSize: const Size(0, 0),
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {},
                    child: const Icon(Iconsax.export_1),
                  ),
                  const SizedBox(width: 10),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.all(25),
                      minimumSize: const Size(0, 0),
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {},
                    child: const Icon(Iconsax.setting),
                  ),
                  const SizedBox(width: 16),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeInAnimation(
                      delay: 1.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Iconsax.shapes_15,
                            size: 30,
                            color: AppColors.consumeColor,
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Text(
                                "Walking Steps",
                                style: TextStyle(
                                  fontSize: 32,
                                ),
                              ),
                              const Spacer(),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.darkGreyColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Row(
                                  children: [
                                    Text(
                                      "Today",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: 4),
                                    RotatedBox(
                                      quarterTurns: 3,
                                      child: Icon(
                                        Icons.chevron_left,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const FadeInAnimation(
                      delay: 2,
                      child: SizedBox(
                        height: 400,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BarWidget(
                              value: .5,
                              steps: '1,000',
                            ),
                            BarWidget(
                              value: .8,
                              steps: '1,211',
                            ),
                            BarWidget(
                              value: .9,
                              steps: '   2,000   ',
                              isPrimary: true,
                            ),
                            BarWidget(
                              value: .4,
                              steps: '800',
                            ),
                            BarWidget(
                              value: .6,
                              steps: '1,000',
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      height: 250,
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: FadeInAnimation(
                              delay: 3,
                              child: Transform.rotate(
                                angle: -.1,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(40),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 30, sigmaY: 30),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 20,
                                        horizontal: 30,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColors.primaryColor
                                            .withOpacity(.9),
                                      ),
                                      child: Row(
                                        children: [
                                          const Expanded(
                                            flex: 2,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                FittedBox(
                                                  child: Text(
                                                    "My Goals",
                                                    style: TextStyle(
                                                      fontSize: 26,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                FractionallySizedBox(
                                                  widthFactor: .8,
                                                  child: Text(
                                                    "Keep it up, you can achieve your goals.",
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Transform.rotate(
                                                angle: -.05,
                                                child: Image.asset(
                                                    'assets/percentage.png')),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: FadeInAnimation(
                              delay: 2.5,
                              child: Transform.rotate(
                                angle: .1,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(40),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 30, sigmaY: 30),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 20,
                                        horizontal: 30,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColors.darkGreyColor
                                            .withOpacity(.1),
                                      ),
                                      child: Row(
                                        children: [
                                          const Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                FittedBox(
                                                  child: Text(
                                                    "Heart Rate",
                                                    style: TextStyle(
                                                      fontSize: 26,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                Text.rich(
                                                  TextSpan(
                                                    text: "150 ",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 24,
                                                    ),
                                                    children: [
                                                      TextSpan(
                                                        text: " bpm",
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Transform.rotate(
                                                angle: -.05,
                                                child: Image.asset(
                                                    'assets/heart.png')),
                                          ),
                                        ],
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
                    SizedBox(height: MediaQuery.paddingOf(context).bottom + 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BarWidget extends StatelessWidget {
  const BarWidget({
    super.key,
    required this.value,
    required this.steps,
    this.isPrimary = false,
  });

  final double value;
  final String steps;
  final bool isPrimary;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 20,
      ),
      height: value * 400,
      // width: 80,
      decoration: BoxDecoration(
        color: isPrimary ? AppColors.primaryColor : AppColors.darkGreyColor,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Text(
            steps,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const Text("Steps"),
        ],
      ),
    );
  }
}
