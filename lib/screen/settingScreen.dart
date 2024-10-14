import 'package:flutter/material.dart';
import 'package:random_number_generator/constant/color.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  double maxNumber = 1000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _Number(maxNumber: maxNumber,),
                _Slider(),
                _Button(),
              ],
            ),
          ),
        ));
  }
}

class _Number extends StatefulWidget {
  final double maxNumber;

  const _Number({
    super.key,
    required this.maxNumber,
  });

  @override
  State<_Number> createState() => _NumberState();
}

class _NumberState extends State<_Number> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Row(
          children: widget.maxNumber.toInt().toString().split('')
              .map((number) => Image.asset(
                    'asset/img/${number}.png',
                    width: 50,
                    height: 50,
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class _Button extends StatefulWidget {
  const _Button({super.key});

  @override
  State<_Button> createState() => _ButtonState();
}

class _ButtonState extends State<_Button> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: redColor,
        foregroundColor: Colors.white,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: Text('저장'),
    );
  }
}

class _Slider extends StatefulWidget {
  const _Slider({super.key});

  @override
  State<_Slider> createState() => _SliderState();
}

class _SliderState extends State<_Slider> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
