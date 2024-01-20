import 'package:flutter/material.dart';
import 'package:quotemaker/Core/utils/app_colors.dart';

class ErrorWidget extends StatelessWidget {
  final VoidCallback? onPressed;

  const ErrorWidget({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Icon(
            Icons.warning,
            color: AppColors.primary,
            size: 150,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(
            vertical: 12,
          ),
          child: const Text(
            'Somethings went Wrong',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(
            vertical: 12,
          ),
          child: Text(
            'Please Try Again',
            style: TextStyle(
              color: AppColors.hint,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(
            vertical: 12,
          ),
          child: ElevatedButton(
            onPressed: () {
              if (onPressed != null) {
                onPressed;
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              elevation: 500,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            child: const Text('Reload Screen'),
          ),
        ),
      ],
    );
  }
}
