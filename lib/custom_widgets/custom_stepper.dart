import 'package:flutter/material.dart';

import '../themes_colors/colors.dart';
import 'custom_inner_shadow.dart';

enum StepStatus { pending, approved, completed, denied, authorized }

class StepDetail {
  final String title;
  final String description;

  StepDetail({required this.title, required this.description});
}

class StepData {
  final String title;
  final StepStatus status;
  final List<StepDetail>? details;
  final Color? statusColor;
  final Color? titleColor;
  final bool isStepDisabled;
  final bool isStepIconShow;

  StepData({
    required this.title,
    required this.status,
    this.details,
    this.statusColor,
    this.titleColor,
    this.isStepDisabled = false,
    this.isStepIconShow = true,
  });
}

class CustomVerticalStepper extends StatelessWidget {
  final List<StepData> steps;

  // final bool isHorizontal;
  final StepStatus? globalStatus;

  const CustomVerticalStepper({
    super.key,
    required this.steps,
    // this.isHorizontal = false,
    this.globalStatus,
  });

  StepStatus? get effectiveGlobalStatus =>
      globalStatus ?? (steps.isNotEmpty ? steps.last.status : null);

  Widget getIconWidgetForStatus(StepStatus status) {
    switch (status) {
      case StepStatus.approved:
      case StepStatus.completed:
        return Icon(Icons.check, color: AppColors.white, size: 17);
      case StepStatus.denied:
        return Icon(Icons.close, color: AppColors.white, size: 17);
      case StepStatus.authorized:
        return Icon(Icons.lock_outline, color: AppColors.white, size: 17);
      case StepStatus.pending:
        return Icon(Icons.hourglass_top, color: AppColors.white, size: 17);
    }
  }

  Color getColorForStatus(StepStatus status) {
    switch (status) {
      case StepStatus.completed:
        return AppColors.stepperCompleted;
      case StepStatus.approved:
        return AppColors.stepperApproved;
      case StepStatus.pending:
        return AppColors.stepperPending;
      case StepStatus.denied:
        return AppColors.stepperDenied;
      case StepStatus.authorized:
        return AppColors.stepperAuthorized;
    }
  }

  Widget _buildCircle(StepData step, int index) {
    final color = step.isStepDisabled
        ? AppColors.stepperDisabled
        : effectiveGlobalStatus != null
        ? getColorForStatus(effectiveGlobalStatus!)
        : step.statusColor ?? getColorForStatus(step.status);

    return Stack(
      alignment: Alignment.center,
      children: [
        InnerShadowContainer(
          height: 40,
          width: 40,
          borderRadius: 20,
          backgroundColor: AppColors.white,
          isShadowTopLeft: true,
        ),
        InnerShadowContainer(
          height: 30,
          width: 30,
          borderRadius: 15,
          backgroundColor: color,
          isShadowBottomLeft: true,
          child: step.isStepIconShow
              ? Center(child: getIconWidgetForStatus(step.status))
              : const SizedBox.shrink(),
        ),
      ],
    );
  }

  Widget _buildLine(int index) {
    final bool isNextStepDisabled =
        (index + 1 < steps.length) && steps[index + 1].isStepDisabled;

    final Color color = isNextStepDisabled
        ? AppColors.stepperDisabled
        : effectiveGlobalStatus != null
        ? getColorForStatus(effectiveGlobalStatus!)
        : AppColors.stepperDisabled;

    //   indent: 5,
    //   endIndent: 10,
    //   thickness: 3,
    //   // height: 3,
    //   color: color,
    // )
    // return //isHorizontal
    //     ? Container(width: 50, height: 3, color: color)
    //     :
    return Container(width: 3, height: 50, color: color);
  }

  Widget _buildStep(BuildContext context, StepData step, int index) {
    final isLast = index == steps.length - 1;
    final titleColor = step.isStepDisabled
        ? AppColors.stepperDisabled
        : effectiveGlobalStatus != null
        ? getColorForStatus(effectiveGlobalStatus!)
        : step.titleColor ?? getColorForStatus(step.status);
    // if (isHorizontal) {
    //   return Column(
    //     children: [
    //       Stack(
    //         fit: StackFit.loose,
    //         // mainAxisSize: MainAxisSize.min,
    //         children: [
    //           Row(
    //             mainAxisSize: MainAxisSize.min,
    //             // crossAxisAlignment: CrossAxisAlignment.center,
    //             children: [
    //               _buildCircle(step, index),
    //               if (!isLast) _buildLine(index),
    //             ],
    //           ),
    //         ],
    //       ),
    //
    //       const SizedBox(height: 6),
    //       Positioned(
    //         // top: 30,
    //         left: -100,
    //         bottom: 0,
    //         child: Text(
    //           step.title,
    //           textAlign: TextAlign.center,
    //           maxLines: 2,
    //           overflow: TextOverflow.ellipsis,
    //           style: TextStyle(
    //             fontSize: 12,
    //             fontWeight: FontWeight.w600,
    //             fontFamily: 'Gilroy-SemiBold',
    //             color: titleColor,
    //           ),
    //         ),
    //       ),
    //     ],
    //   );
    // }
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              _buildCircle(step, index),
              if (!isLast) Expanded(child: _buildLine(index)),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    step.title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Gilroy-SemiBold',
                      color: titleColor,
                    ),
                  ),
                  if (step.details != null && step.details!.isNotEmpty)
                    Container(
                      margin: const EdgeInsets.only(top: 6),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xffFAFAFF),
                        border: Border.all(color: AppColors.stepperDataBorder),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: step.details!.map((item) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 6),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 140,
                                  child: Text(
                                    item.title,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Gilroy-SemiBold',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                const Text(
                                  ' : ',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Gilroy-SemiBold',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Text(
                                      item.description,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'Gilroy-Medium',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // return isHorizontal
    //     ? SizedBox(
    //       height: 100,
    //       child: SingleChildScrollView(
    //         scrollDirection: Axis.horizontal,
    //         child: Row(
    //           // crossAxisAlignment: CrossAxisAlignment.start,
    //           children: List.generate(
    //             steps.length,
    //             (index) => Padding(
    //               padding: const EdgeInsets.symmetric(horizontal: 0),
    //               child: _buildStep(context, steps[index], index),
    //             ),
    //           ),
    //         ),
    //       ),
    //     )
    //     :
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        steps.length,
        (index) => _buildStep(context, steps[index], index),
      ),
    );
  }
}
