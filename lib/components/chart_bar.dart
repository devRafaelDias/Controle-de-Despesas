import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String? label;
  final double? value;
  final double? percentage;

  const ChartBar({
    super.key,
    this.label,
    this.value,
    this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, contrains) {
        return Column(
          children: [
            SizedBox(
              height: contrains.maxHeight * 0.15,
              child: FittedBox(
                child: Text('$value'),
              ),
            ),
            SizedBox(height: contrains.maxHeight * 0.05),
            SizedBox(
              height: contrains.maxHeight * 0.6,
              width: 15,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                        color: const Color.fromRGBO(220, 220, 220, 1),
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  FractionallySizedBox(
                    heightFactor: percentage,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: contrains.maxHeight * 0.05,
            ),
            SizedBox(
              height: contrains.maxHeight * 0.15,
              child: FittedBox(
                child: Text(label!),
              ),
            ),
          ],
        );
      },
    );
  }
}
