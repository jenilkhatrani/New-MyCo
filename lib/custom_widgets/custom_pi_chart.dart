//
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
//   final double segmentWidth;
//   final double innerRadius;
//   final double connectorLength;
//
//   DonutChartPainter(
//     this.segments, {
//     this.segmentWidth = 30,
//     this.innerRadius = 80,
//     this.connectorLength = 25,
//   });
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final center = size.center(Offset.zero);
//     final radius = innerRadius;
//     final total = segments.fold<double>(0, (sum, item) => sum + item.value);
//     double startAngle = -pi / 2;
//
//     final paint = Paint()
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = segmentWidth;
//
//     final textPainter = TextPainter(
//       textAlign: TextAlign.center,
//       textDirection: TextDirection.ltr,
//     );
//
//     final leftLabels = <(ChartSegment, Offset)>[];
//     final rightLabels = <(ChartSegment, Offset)>[];
//
//     for (var segment in segments) {
//       final sweepAngle = (segment.value / total) * 2 * pi;
//       paint.color = segment.color;
//
//       canvas.drawArc(
//         Rect.fromCircle(center: center, radius: radius),
//         startAngle,
//         sweepAngle,
//         false,
//         paint,
//       );
//
//       final midAngle = startAngle + sweepAngle / 2;
//       final dx = cos(midAngle) * (radius + segmentWidth / 2);
//       final dy = sin(midAngle) * (radius + segmentWidth / 2);
//       final pointOnArc = Offset(center.dx + dx, center.dy + dy);
//
//       final isRightSide = midAngle < pi / 2 || midAngle > 3 * pi / 2;
//       final connectorEndX = isRightSide
//           ? pointOnArc.dx + connectorLength
//           : pointOnArc.dx - connectorLength;
//       final connectorEnd = Offset(connectorEndX, pointOnArc.dy);
//
//       final connectorPaint = Paint()
//         ..color = segment.color
//         ..strokeWidth = 2;
//
//       canvas.drawLine(pointOnArc, connectorEnd, connectorPaint);
//
//       if (isRightSide) {
//         rightLabels.add((segment, connectorEnd));
//       } else {
//         leftLabels.add((segment, connectorEnd));
//       }
//
//       startAngle += sweepAngle;
//     }
//
//     // ==== Center Text ====
//     final totalLeave = segments.fold<int>(0, (sum, e) => sum + e.value.toInt());
//     final paidLeave = segments
//         .where((e) => e.label.toLowerCase() == 'paid')
//         .fold<int>(0, (sum, e) => sum + e.value.toInt());
//
//     final centerTextStyle = const TextStyle(
//       color: Colors.black,
//       fontWeight: FontWeight.w400,
//       fontSize: 12,
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
//       style: const TextStyle(
//         fontSize: 16,
//         color: Colors.black,
//         fontWeight: FontWeight.bold,
//       ),
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
//       style: const TextStyle(
//         fontSize: 16,
//         color: Colors.black,
//         fontWeight: FontWeight.bold,
//       ),
//     );
//     textPainter.layout();
//     textPainter.paint(
//       canvas,
//       Offset(center.dx - textPainter.width / 2, center.dy + 35),
//     );
//
//     List<double> generateYPositions(int count, double height) {
//       final spacing = (height - 100) / (count - 1); // 60 margin top/bottom
//       return List.generate(count, (i) => 60 + spacing * i);
//     }
//
//     void drawFixedLabelBoxes(
//       List<(ChartSegment, Offset)> entries,
//       bool isRight,
//     ) {
//       final ySlots = generateYPositions(entries.length, size.height);
//
//       for (int i = 0; i < entries.length && i < ySlots.length; i++) {
//         final (segment, connectorEnd) = entries[i];
//         final y = ySlots[i];
//
//         final fixedOffset = Offset(isRight ? size.width - 10 : 10, y);
//
//         final labelText =
//             '${segment.label}\n${segment.value.toString().padLeft(2, '0')}';
//         final labelStyle = const TextStyle(
//           color: Colors.black,
//           fontSize: 14,
//           fontWeight: FontWeight.w600,
//           height: 1.4,
//         );
//
//         textPainter.text = TextSpan(text: labelText, style: labelStyle);
//         textPainter.layout();
//
//         final boxWidth = 75.0;
//         final boxHeight = 50.0;
//
//         final boxX = isRight ? fixedOffset.dx - boxWidth : fixedOffset.dx;
//         final boxY = fixedOffset.dy - boxHeight / 2;
//
//         final labelRect = Rect.fromLTWH(boxX, boxY, boxWidth, boxHeight);
//         final rRect = RRect.fromRectAndRadius(
//           labelRect,
//           const Radius.circular(8),
//         );
//         final paintBox = Paint()..color = segment.color.withOpacity(0.6);
//         canvas.drawRRect(rRect, paintBox);
//
//         final textOffset = Offset(
//           boxX + 8,
//           boxY + (boxHeight - textPainter.height) / 2,
//         );
//         textPainter.paint(canvas, textOffset);
//
//         final linePaint = Paint()
//           ..color = segment.color
//           ..strokeWidth = 1.5;
//
//         final lineStart = Offset(
//           isRight ? boxX : boxX + boxWidth,
//           boxY + boxHeight / 2,
//         );
//         canvas.drawLine(lineStart, connectorEnd, linePaint);
//       }
//     }
//
//     // Final draw call
//     drawFixedLabelBoxes(leftLabels.reversed.toList(), false);
//     drawFixedLabelBoxes(rightLabels, true);
//   }
//
//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => true;
// }

//
// import 'dart:math';
// import 'package:flutter/material.dart';
//
// import '../themes_colors/colors.dart';
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
//   final double segmentWidth;
//   final double innerRadius;
//   final double connectorLength;
//
//   DonutChartPainter(
//     this.segments, {
//     this.segmentWidth = 30,
//     this.innerRadius = 80,
//     this.connectorLength = 25,
//   });
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final center = size.center(Offset.zero);
//     final radius = innerRadius;
//     final total = segments.fold<double>(0, (sum, item) => sum + item.value);
//     double startAngle = -pi / 2;
//
//     final paint = Paint()
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = segmentWidth;
//
//     final textPainter = TextPainter(
//       textAlign: TextAlign.center,
//       textDirection: TextDirection.ltr,
//     );
//
//     final leftLabels = <(ChartSegment, Offset)>[];
//     final rightLabels = <(ChartSegment, Offset)>[];
//
//     for (var segment in segments) {
//       final sweepAngle = (segment.value / total) * 2 * pi;
//       // Draw base segment
//       paint.color = segment.color;
//       canvas.drawArc(
//         Rect.fromCircle(center: center, radius: radius),
//         startAngle,
//         sweepAngle,
//         false,
//         paint,
//       );
//
//       // Simulated top-to-bottom light reflection (inner-like shadow overlay)
//       final shadowPaint = Paint()
//         ..style = PaintingStyle.stroke
//         ..strokeWidth = segmentWidth * 0.10
//         ..color = Colors
//             .black // soft top light shadow
//         ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5);
//
//       final shadowRect = Rect.fromCircle(center: center, radius: radius);
//       canvas.drawArc(shadowRect, startAngle, sweepAngle, false, shadowPaint);
//
//       final midAngle = startAngle + sweepAngle / 2;
//       final dx = cos(midAngle) * (radius + segmentWidth / 2);
//       final dy = sin(midAngle) * (radius + segmentWidth / 2);
//       final pointOnArc = Offset(center.dx + dx, center.dy + dy);
//
//       final isRightSide = midAngle < pi / 2 || midAngle > 3 * pi / 2;
//       final connectorEndX = isRightSide
//           ? pointOnArc.dx + connectorLength
//           : pointOnArc.dx - connectorLength;
//       final connectorEnd = Offset(connectorEndX, pointOnArc.dy);
//
//       final connectorPaint = Paint()
//         ..color = segment.color
//         ..strokeWidth = 2;
//
//       canvas.drawLine(pointOnArc, connectorEnd, connectorPaint);
//
//       if (isRightSide) {
//         rightLabels.add((segment, connectorEnd));
//       } else {
//         leftLabels.add((segment, connectorEnd));
//       }
//
//       startAngle += sweepAngle;
//     }
//
//     // ==== Center Circular Container ====
//     final totalLeave = segments.fold<int>(0, (sum, e) => sum + e.value.toInt());
//     final paidLeave = segments
//         .where((e) => e.label.toLowerCase() == 'paid')
//         .fold<int>(0, (sum, e) => sum + e.value.toInt());
//
//     const double circleRadius = 55;
//
//     // Draw circular background
//     final Paint fillPaint = Paint()..color = AppColors.removeBackground;
//     canvas.drawCircle(center, circleRadius, fillPaint);
//
//     // Draw circular border
//     final Paint borderPaint = Paint()
//       ..color = Colors.grey.shade400
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 8;
//     canvas.drawCircle(center, circleRadius, borderPaint);
//
//     // Draw centered text
//     final String centerText =
//         'Total Pair Leave\n$paidLeave\n Total Leave\n$totalLeave';
//
//     final TextPainter centerTextPainter = TextPainter(
//       textAlign: TextAlign.center,
//       textDirection: TextDirection.ltr,
//       text: TextSpan(
//         text: centerText,
//         style: const TextStyle(
//           fontSize: 12,
//           fontWeight: FontWeight.w600,
//           color: Colors.black,
//           height: 1.5,
//         ),
//       ),
//     );
//     centerTextPainter.layout();
//
//     final Offset textOffset = Offset(
//       center.dx - centerTextPainter.width / 2,
//       center.dy - centerTextPainter.height / 2,
//     );
//     centerTextPainter.paint(canvas, textOffset);
//
//     // ==== Label Drawing ====
//     List<double> generateYPositions(int count, double height) {
//       final spacing = (height - 100) / (count - 1); // 60 margin top/bottom
//       return List.generate(count, (i) => 60 + spacing * i);
//     }
//
//     void drawFixedLabelBoxes(
//       List<(ChartSegment, Offset)> entries,
//       bool isRight,
//     ) {
//       final ySlots = generateYPositions(entries.length, size.height);
//
//       for (int i = 0; i < entries.length && i < ySlots.length; i++) {
//         final (segment, connectorEnd) = entries[i];
//         final y = ySlots[i];
//
//         final fixedOffset = Offset(isRight ? size.width - 10 : 10, y);
//
//         final labelText =
//             '${segment.label}\n${segment.value.toString().padLeft(2, '0')}';
//         final labelStyle = const TextStyle(
//           color: Colors.black,
//           fontSize: 14,
//           fontWeight: FontWeight.w600,
//           height: 1.4,
//         );
//
//         textPainter.text = TextSpan(text: labelText, style: labelStyle);
//         textPainter.layout();
//
//         final boxWidth = 75.0;
//         final boxHeight = 50.0;
//
//         final boxX = isRight ? fixedOffset.dx - boxWidth : fixedOffset.dx;
//         final boxY = fixedOffset.dy - boxHeight / 2;
//
//         final labelRect = Rect.fromLTWH(boxX, boxY, boxWidth, boxHeight);
//         final rRect = RRect.fromRectAndRadius(
//           labelRect,
//           const Radius.circular(8),
//         );
//         final paintBox = Paint()..color = segment.color.withOpacity(0.6);
//         canvas.drawRRect(rRect, paintBox);
//
//         final textOffset = Offset(
//           boxX + 8,
//           boxY + (boxHeight - textPainter.height) / 2,
//         );
//         textPainter.paint(canvas, textOffset);
//
//         final linePaint = Paint()
//           ..color = segment.color
//           ..strokeWidth = 1.5;
//
//         final lineStart = Offset(
//           isRight ? boxX : boxX + boxWidth,
//           boxY + boxHeight / 2,
//         );
//         canvas.drawLine(lineStart, connectorEnd, linePaint);
//       }
//     }
//
//     drawFixedLabelBoxes(leftLabels.reversed.toList(), false);
//     drawFixedLabelBoxes(rightLabels, true);
//   }
//
//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => true;
// }
import 'dart:math';
import 'package:flutter/material.dart';

import '../themes_colors/colors.dart';

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

class DonutChartPainter extends CustomPainter {
  final List<ChartSegment> segments;
  final double segmentWidth;
  final double innerRadius;
  final double connectorLength;

  DonutChartPainter(
    this.segments, {
    this.segmentWidth = 30,
    this.innerRadius = 80,
    this.connectorLength = 25,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = innerRadius;
    final total = segments.fold<double>(0, (sum, item) => sum + item.value);
    double startAngle = -pi / 2;

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = segmentWidth;

    final textPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    final leftLabels = <(ChartSegment, Offset)>[];
    final rightLabels = <(ChartSegment, Offset)>[];

    for (var segment in segments) {
      final sweepAngle = (segment.value / total) * 2 * pi;
      final arcRect = Rect.fromCircle(center: center, radius: radius);

      // === SHADOW FIRST ===
      final shadowPaint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = segmentWidth
        ..color = Colors.black.withOpacity(0.10)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10);
      canvas.drawArc(arcRect, startAngle, sweepAngle, false, shadowPaint);

      // === SEGMENT DRAW ===
      paint.color = segment.color;
      canvas.drawArc(arcRect, startAngle, sweepAngle, false, paint);

      // === CONNECTOR LOGIC ===
      final midAngle = startAngle + sweepAngle / 2;
      final dx = cos(midAngle) * (radius + segmentWidth / 2);
      final dy = sin(midAngle) * (radius + segmentWidth / 2);
      final pointOnArc = Offset(center.dx + dx, center.dy + dy);

      final isRightSide = midAngle < pi / 2 || midAngle > 3 * pi / 2;
      final connectorEndX = isRightSide
          ? pointOnArc.dx + connectorLength
          : pointOnArc.dx - connectorLength;
      final connectorEnd = Offset(connectorEndX, pointOnArc.dy);

      final connectorPaint = Paint()
        ..color = segment.color
        ..strokeWidth = 2;
      canvas.drawLine(pointOnArc, connectorEnd, connectorPaint);

      if (isRightSide) {
        rightLabels.add((segment, connectorEnd));
      } else {
        leftLabels.add((segment, connectorEnd));
      }

      startAngle += sweepAngle;
    }

    // ==== CENTER CIRCLE ====
    final totalLeave = segments.fold<int>(0, (sum, e) => sum + e.value.toInt());
    final paidLeave = segments
        .where((e) => e.label.toLowerCase() == 'paid')
        .fold<int>(0, (sum, e) => sum + e.value.toInt());

    const double circleRadius = 55;

    // Fill circle
    final Paint fillPaint = Paint()..color = AppColors.removeBackground;
    canvas.drawCircle(center, circleRadius, fillPaint);

    // Border circle
    final Paint borderPaint = Paint()
      ..color = Colors.grey.shade400
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;
    canvas.drawCircle(center, circleRadius, borderPaint);

    // Center Text
    final String centerText =
        'Total Leave\n$totalLeave\nTotal Paid Leave\n$paidLeave';
    final TextPainter centerTextPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
      text: TextSpan(
        text: centerText,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Colors.black,
          height: 1.5,
        ),
      ),
    );
    centerTextPainter.layout();
    final Offset textOffset = Offset(
      center.dx - centerTextPainter.width / 2,
      center.dy - centerTextPainter.height / 2,
    );
    centerTextPainter.paint(canvas, textOffset);

    // ==== LABEL DRAWING ====
    List<double> generateYPositions(int count, double height) {
      final spacing = (height - 100) / (count - 1);
      return List.generate(count, (i) => 60 + spacing * i);
    }

    void drawFixedLabelBoxes(
      List<(ChartSegment, Offset)> entries,
      bool isRight,
    ) {
      final ySlots = generateYPositions(entries.length, size.height);

      for (int i = 0; i < entries.length && i < ySlots.length; i++) {
        final (segment, connectorEnd) = entries[i];
        final y = ySlots[i];

        final fixedOffset = Offset(isRight ? size.width - 10 : 10, y);

        final labelText =
            '${segment.label}\n${segment.value.toString().padLeft(2, '0')}';
        final labelStyle = const TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          height: 1.4,
        );

        textPainter.text = TextSpan(text: labelText, style: labelStyle);
        textPainter.layout();

        final boxWidth = 75.0;
        final boxHeight = 50.0;

        final boxX = isRight ? fixedOffset.dx - boxWidth : fixedOffset.dx;
        final boxY = fixedOffset.dy - boxHeight / 2;

        final labelRect = Rect.fromLTWH(boxX, boxY, boxWidth, boxHeight);
        final rRect = RRect.fromRectAndRadius(
          labelRect,
          const Radius.circular(8),
        );
        final paintBox = Paint()..color = segment.color.withOpacity(0.6);
        canvas.drawRRect(rRect, paintBox);

        final textOffset = Offset(
          boxX + 8,
          boxY + (boxHeight - textPainter.height) / 2,
        );
        textPainter.paint(canvas, textOffset);

        final linePaint = Paint()
          ..color = segment.color
          ..strokeWidth = 1.5;
        final lineStart = Offset(
          isRight ? boxX : boxX + boxWidth,
          boxY + boxHeight / 2,
        );
        canvas.drawLine(lineStart, connectorEnd, linePaint);
      }
    }

    drawFixedLabelBoxes(leftLabels.reversed.toList(), false);
    drawFixedLabelBoxes(rightLabels, true);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
