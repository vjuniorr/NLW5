import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  final String title;
  final String completed;
  final double percent;
  final VoidCallback onTap;
  const QuizCardWidget({
    Key? key,
    required this.title,
    required this.percent,
    required this.completed,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border:
                  Border.fromBorderSide(BorderSide(color: AppColors.border)),
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 40,
                width: 40,
                child: Image.asset(AppImages.data),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: AppTextStyles.heading15,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      completed,
                      style: AppTextStyles.body11,
                    ),
                  ),
                  Expanded(
                      flex: 4,
                      child: ProgressIndicatorWidget(
                        value: percent,
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
