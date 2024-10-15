import 'package:flutter/material.dart';
import 'package:random_number_generator/constant/color.dart';

import '../component/NumberToImage.dart';

class SettingScreen extends StatefulWidget {
  final int maxNumber;

  const SettingScreen({
    super.key,
    required this.maxNumber,
  });

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  double maxNumber = 1000;

  @override
  void initState() {
    super.initState();
    maxNumber = widget.maxNumber.toDouble();
  }

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
                _Number(
                  maxNumber: maxNumber,
                ),
                _Slider(
                  value: maxNumber,
                  onChanged: onSliderChanged,
                ),
                _Button(
                  onPressed: onSaveButtonClick,
                ),
              ],
            ),
          ),
        ));
  }

  onSliderChanged(double value) {
    setState(() {
      maxNumber = value;
    });
  }

  onSaveButtonClick() {
    Navigator.of(context).pop(maxNumber);
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
        child: NumberToImage(
          number: widget.maxNumber.toInt(),
        ),
      ),
    );
  }
}

class _Button extends StatefulWidget {
  final VoidCallback onPressed;

  const _Button({
    required this.onPressed,
    super.key,
  });

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
      onPressed: widget.onPressed,
      child: Text('저장'),
    );
  }
}

class _Slider extends StatefulWidget {
  final double value;
  final ValueChanged<double> onChanged;

  const _Slider({
    required this.value,
    required this.onChanged,
    super.key,
  });

  @override
  State<_Slider> createState() => _SliderState();
}

class _SliderState extends State<_Slider> {
  @override
  Widget build(BuildContext context) {
    return Slider(
      value: widget.value,
      min: 100,
      max: 100000,
      activeColor: redColor,
      onChanged: widget.onChanged,
    );
  }
}
