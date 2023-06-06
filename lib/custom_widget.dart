import 'package:flutter/material.dart';

class CustomWidget extends StatefulWidget {
  final String text;
  bool isSelected;

  CustomWidget({super.key, required this.text, required this.isSelected});

  @override
  State<CustomWidget> createState() => _CustomWidgetState();
}

class _CustomWidgetState extends State<CustomWidget> {
  final double _checkboxSize = 24.0;

  bool _shouldShowLine() {
    final textPainter = TextPainter(
      text: TextSpan(text: widget.text, style: const TextStyle(fontSize: 16)),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();

    final textWidth = textPainter.width;
    final lineWidth =
        MediaQuery.of(context).size.width - textWidth - _checkboxSize;

    return lineWidth > 10;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _shouldShowLine()
            ? Text(
                widget.text,
                maxLines: 1,
                style: const TextStyle(fontSize: 16),
              )
            : Flexible(
                child: Text(
                  widget.text,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
        if (_shouldShowLine()) Expanded(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final boxWidth = constraints.maxWidth;
              const dashWidth = 7.0;
              const dashHeight = 2.0;
              final dashCount = (boxWidth / (2 * dashWidth)).ceil();
              print(dashCount);
              return Flex(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                direction: Axis.horizontal,
                children: List.generate(dashCount, (_) {
                  return const SizedBox(
                    width: dashWidth,
                    height: dashHeight,
                    child: DecoratedBox(
                      decoration: BoxDecoration(color: Colors.black),
                    ),
                  );
                }),
              );
            },
          ),
        ),
        SizedBox(
          height: _checkboxSize,
          width: _checkboxSize,
          child: Checkbox(
            value: widget.isSelected,
            onChanged: (value) {
              setState(() {
                widget.isSelected = value!;
              });
            },
          ),
        ),
      ],
    );
  }
}
