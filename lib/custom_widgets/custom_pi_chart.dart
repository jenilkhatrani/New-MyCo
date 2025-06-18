// import 'dart:math';
// import 'package:flutter/material.dart';
//
// class ChartSegment {
//   final String label;
//   final double value;
//   final Color color;
//
//   const ChartSegment({
//     required this.label,
//     required this.value,
//     required this.color,
//   });
// }
//
// class DonutChartPainter extends CustomPainter {
//   final List<ChartSegment> segments;
//   final double donutWidth = 35;
//   final double connectorLength = 25;
//   final double labelSpacing = 90;
//
//   DonutChartPainter(this.segments);
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final center = size.center(Offset.zero);
//     const radius = 100.0;
//
//     final total = segments.fold<double>(0, (sum, item) => sum + item.value);
//     double startAngle = -pi / 2;
//
//     final paint = Paint()
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = donutWidth;
//
//     final textPainter = TextPainter(
//       textAlign: TextAlign.center,
//       textDirection: TextDirection.ltr,
//     );
//
//     // Draw donut segments and collect mid angles for lines
//     final labelOffsets = <Offset>[];
//     final labelTexts = <ChartSegment>[];
//     for (var segment in segments) {
//       final sweepAngle = (segment.value / total) * 2 * pi;
//
//       paint.color = segment.color;
//       canvas.drawArc(
//         Rect.fromCircle(center: center, radius: radius),
//         startAngle,
//         sweepAngle,
//         false,
//         paint,
//       );
//
//       final midAngle = startAngle + sweepAngle / 2;
//       final dx = cos(midAngle) * (radius + donutWidth / 2);
//       final dy = sin(midAngle) * (radius + donutWidth / 2);
//       final pointOnArc = Offset(center.dx + dx, center.dy + dy);
//
//       final connectorEndX = midAngle < pi / 2 || midAngle > 3 * pi / 2
//           ? pointOnArc.dx + connectorLength
//           : pointOnArc.dx - connectorLength;
//       final connectorEnd = Offset(connectorEndX, pointOnArc.dy);
//
//       // Draw connector line
//       final connectorPaint = Paint()
//         ..color = segment.color
//         ..strokeWidth = 2;
//
//       canvas.drawLine(pointOnArc, connectorEnd, connectorPaint);
//
//       // Store label info
//       labelOffsets.add(connectorEnd);
//       labelTexts.add(segment);
//
//       startAngle += sweepAngle;
//     }
//
//     // Draw center text
//     final totalLeave = segments.fold<int>(0, (sum, e) => sum + e.value.toInt());
//     final paidLeave = segments
//         .where((e) => e.label.toLowerCase() == 'paid')
//         .fold<int>(0, (sum, e) => sum + e.value.toInt());
//
//     final centerTextStyle = const TextStyle(
//       color: Colors.black,
//       fontWeight: FontWeight.w400,
//       fontSize: 14,
//     );
//
//     textPainter.text = TextSpan(text: 'Total Leave', style: centerTextStyle);
//     textPainter.layout();
//     textPainter.paint(
//       canvas,
//       Offset(center.dx - textPainter.width / 2, center.dy - 30),
//     );
//
//     textPainter.text = TextSpan(
//       text: '$totalLeave',
//       style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//     );
//     textPainter.layout();
//     textPainter.paint(
//       canvas,
//       Offset(center.dx - textPainter.width / 2, center.dy - 10),
//     );
//
//     textPainter.text = TextSpan(
//       text: 'Total Paid Leave',
//       style: centerTextStyle,
//     );
//     textPainter.layout();
//     textPainter.paint(
//       canvas,
//       Offset(center.dx - textPainter.width / 2, center.dy + 15),
//     );
//
//     textPainter.text = TextSpan(
//       text: '$paidLeave',
//       style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//     );
//     textPainter.layout();
//     textPainter.paint(
//       canvas,
//       Offset(center.dx - textPainter.width / 2, center.dy + 35),
//     );
//
//     // Draw label boxes
//     for (int i = 0; i < labelOffsets.length; i++) {
//       final offset = labelOffsets[i];
//       final segment = labelTexts[i];
//
//       final labelText =
//           '${segment.label}\n${segment.value.toString().padLeft(2, '0')}';
//
//       final labelStyle = const TextStyle(
//         color: Colors.black,
//         fontSize: 14,
//         fontWeight: FontWeight.w600,
//         height: 1.4,
//       );
//
//       textPainter.text = TextSpan(text: labelText, style: labelStyle);
//       textPainter.layout();
//
//       final isLeft = offset.dx < center.dx;
//       final boxWidth = textPainter.width + 16;
//       final boxHeight = textPainter.height + 8;
//
//       final labelRect = Rect.fromLTWH(
//         isLeft ? offset.dx - boxWidth : offset.dx,
//         offset.dy - boxHeight / 2,
//         boxWidth,
//         boxHeight,
//       );
//
//       final rRect = RRect.fromRectAndRadius(
//         labelRect,
//         const Radius.circular(8),
//       );
//       final paintBox = Paint()..color = segment.color.withOpacity(0.6);
//       canvas.drawRRect(rRect, paintBox);
//
//       final textOffset = Offset(
//         isLeft ? offset.dx - boxWidth + 8 : offset.dx + 8,
//         offset.dy - textPainter.height / 2,
//       );
//       textPainter.paint(canvas, textOffset);
//     }
//   }
//
//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => true;
// }

import 'dart:math';
import 'package:flutter/material.dart';

class ChartSegment {
  final String label;
  final double value;
  final Color color;

  const ChartSegment({
    required this.label,
    required this.value,
    required this.color,
  });
}

class DonutChartWithLabels extends StatelessWidget {
  final List<ChartSegment> segments;

  const DonutChartWithLabels({super.key, required this.segments});

  @override
  Widget build(BuildContext context) {
    final center = const Offset(200, 250); // Updated center

    return Center(
      child: SizedBox(
        height: 500,
        width: 400,
        child: Stack(
          children: [
            Positioned.fill(
              child: CustomPaint(painter: DonutChartPainter(segments)),
            ),
            ..._buildLabelWidgets(segments, center),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildLabelWidgets(List<ChartSegment> segments, Offset center) {
    final total = segments.fold<double>(0, (sum, item) => sum + item.value);
    double startAngle = -pi / 2;

    List<Widget> widgets = [];

    for (int i = 0; i < segments.length; i++) {
      final sweepAngle = (segments[i].value / total) * 2 * pi;
      final midAngle = startAngle + sweepAngle / 2;

      final donutEdge = Offset(
        center.dx + cos(midAngle) * 90,
        center.dy + sin(midAngle) * 90,
      );

      final labelDx = center.dx + cos(midAngle) * 160;
      final labelDy = center.dy + sin(midAngle) * 160;

      final isLeft = cos(midAngle) < 0;

      widgets.add(
        Positioned(
          left: labelDx - (isLeft ? 100 : 0),
          top: labelDy - 25,
          child: Column(
            crossAxisAlignment: isLeft
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              CustomPaint(
                size: const Size(100, 30),
                painter: ConnectorLinePainter(
                  from: donutEdge,
                  to: Offset(labelDx, labelDy),
                  color: segments[i].color,
                ),
              ),
              LabelBox(segment: segments[i]),
            ],
          ),
        ),
      );

      startAngle += sweepAngle;
    }

    return widgets;
  }
}

class DonutChartPainter extends CustomPainter {
  final List<ChartSegment> segments;
  final double donutWidth = 40;
  final double radius = 90;

  DonutChartPainter(this.segments);

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final total = segments.fold<double>(0, (sum, item) => sum + item.value);
    double startAngle = -pi / 2;

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = donutWidth;

    for (var segment in segments) {
      final sweepAngle = (segment.value / total) * 2 * pi;
      paint.color = segment.color;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        false,
        paint,
      );
      startAngle += sweepAngle;
    }

    _drawCenterText(canvas, center);
  }

  void _drawCenterText(Canvas canvas, Offset center) {
    final totalLeave = segments.fold<int>(0, (sum, e) => sum + e.value.toInt());
    final paidLeave = segments
        .where((e) => e.label.toLowerCase() == 'paid')
        .fold<int>(0, (sum, e) => sum + e.value.toInt());

    final textPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    const style1 = TextStyle(fontSize: 14, fontWeight: FontWeight.w400);
    const style2 = TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
    const style3 = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

    textPainter.text = TextSpan(text: 'Total Leave', style: style1);
    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(center.dx - textPainter.width / 2, center.dy - 35),
    );

    textPainter.text = TextSpan(text: '$totalLeave', style: style2);
    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(center.dx - textPainter.width / 2, center.dy - 10),
    );

    textPainter.text = TextSpan(text: 'Total Paid Leave', style: style1);
    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(center.dx - textPainter.width / 2, center.dy + 18),
    );

    textPainter.text = TextSpan(text: '$paidLeave', style: style3);
    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(center.dx - textPainter.width / 2, center.dy + 38),
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class LabelBox extends StatelessWidget {
  final ChartSegment segment;

  const LabelBox({super.key, required this.segment});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: segment.color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            segment.label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 2),
          Text(
            segment.value.toInt().toString().padLeft(2, '0'),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class ConnectorLinePainter extends CustomPainter {
  final Offset from;
  final Offset to;
  final Color color;

  ConnectorLinePainter({
    required this.from,
    required this.to,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final middleX = from.dx + (to.dx - from.dx) * 0.5;

    final path = Path()
      ..moveTo(from.dx, from.dy)
      ..lineTo(middleX, from.dy)
      ..lineTo(to.dx, to.dy);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
