import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const m15 = 900;
  static const m20 = 1200;
  static const m25 = 1500;
  static const m30 = 1800;
  static const m35 = 2100;
  int totalSeconds = m25;
  bool isRunning = false;
  late Timer timer;
  int round = 0;
  int totalRound = 4;
  int goal = 0;

  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      setState(() {
        if (round >= 4) {
          round = 0;
          goal = goal + 1;
        } else {
          round = round + 1;
        }
        isRunning = false;
        totalSeconds = m25;
      });
      timer.cancel();
    } else {
      setState(() {
        totalSeconds = totalSeconds - 1;
      });
    }
  }

  void onTimeClick(int minute) {
    timer.cancel();
    setState(() {
      isRunning = false;
      totalSeconds = minute;
    });
  }

  void onStartPressed() {
    timer = Timer.periodic(const Duration(seconds: 1), onTick);
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void onResetPressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
      totalSeconds = m25;
    });
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().substring(2, 7);
  }

  String formatTime(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().substring(2, 4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                format(totalSeconds),
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 89,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => onTimeClick(m15),
                  child: Text(
                    formatTime(m15),
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
                GestureDetector(
                  onTap: () => onTimeClick(m20),
                  child: Text(
                    formatTime(m20),
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
                GestureDetector(
                  onTap: () => onTimeClick(m25),
                  child: Text(
                    formatTime(m25),
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
                GestureDetector(
                  onTap: () => onTimeClick(m30),
                  child: Text(
                    formatTime(m30),
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
                GestureDetector(
                  onTap: () => onTimeClick(m35),
                  child: Text(
                    formatTime(m35),
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Center(
                  child: IconButton(
                    iconSize: 120,
                    color: Theme.of(context).cardColor,
                    onPressed: isRunning ? onPausePressed : onStartPressed,
                    icon: Icon(isRunning
                        ? Icons.pause_circle_outline
                        : Icons.play_circle_outline),
                  ),
                ),
                Center(
                  child: IconButton(
                    iconSize: 120,
                    color: Theme.of(context).cardColor,
                    onPressed: onResetPressed,
                    icon: const Icon(Icons.restore),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Round",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).cardColor,
                              ),
                            ),
                            Text(
                              "$round/$totalRound",
                              style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.w800,
                                color: Theme.of(context).cardColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Goal",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).cardColor,
                              ),
                            ),
                            Text(
                              "$goal",
                              style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.w800,
                                color: Theme.of(context).cardColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
