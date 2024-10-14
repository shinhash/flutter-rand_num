import 'package:flutter/material.dart';
import 'package:random_number_generator/constant/color.dart';
import 'dart:math';

import 'package:random_number_generator/screen/settingScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> numbers = [
    123,
    456,
    789,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /// title and icon button
              _Header(
                onPressSetting: settingIconClick,
              ),

              /// number area
              _Body(
                numbers: numbers,
              ),

              /// button area
              _Footer(
                settingIconClick: generateRandomNumber,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void generateRandomNumber() {
    final rand = Random();
    final Set<int> numSet = {};

    while (numSet.length < 3) {
      final randNum = rand.nextInt(1000);
      if (randNum >= 100) {
        numSet.add(randNum);
      }
    }

    setState(() {
      numbers = numSet.toList();
    });
  }

  void settingIconClick() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context){
          return SettingScreen();
        },
      ),
    );
  }
}

class _Header extends StatefulWidget {
  final VoidCallback onPressSetting;

  const _Header({
    super.key,
    required this.onPressSetting,
  });

  @override
  State<_Header> createState() => _HeaderState();
}

class _HeaderState extends State<_Header> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'lotto',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
        ),
        IconButton(
          color: redColor,
          onPressed: widget.onPressSetting,
          icon: Icon(
            Icons.settings,
          ),
        ),
      ],
    );
  }
}

class _Body extends StatefulWidget {
  final List<int> numbers;

  const _Body({
    super.key,
    required this.numbers,
  });

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.numbers
                .map((e) => e.toString().split(''))
                .map((row) => Row(
                      children: row
                          .map((number) => Image.asset(
                                'asset/img/${number}.png',
                                width: 50,
                                height: 50,
                              ))
                          .toList(),
                    ))
                .toList()),
      ),
    );
  }
}

class _Footer extends StatefulWidget {
  final VoidCallback settingIconClick;

  const _Footer({
    required this.settingIconClick,
    super.key,
  });

  @override
  State<_Footer> createState() => _FooterState();
}

class _FooterState extends State<_Footer> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.settingIconClick,
      style: ElevatedButton.styleFrom(
        backgroundColor: redColor,
        foregroundColor: Colors.white,
      ),
      child: Text(
        '생성하기!',
      ),
    );
  }
}
