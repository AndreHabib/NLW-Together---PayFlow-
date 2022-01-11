import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class BilletInfoWidget extends StatelessWidget {
  const BilletInfoWidget({Key? key, required this.size}) : super(key: key);
  final int size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset(
              AppImages.logomini,
              color: AppColors.background,
              width: 56,
              height: 34,
            ),
            Container(
              width: 1,
              height: 32,
              color: AppColors.background,
            ),
            Text.rich(
              TextSpan(
                text: 'Você tem ',
                style: TextStyles.captionBackground,
                children: [
                  TextSpan(
                    text: size == 0
                        ? '$size  boletos\n'
                        : size > 1
                            ? '$size  boletos\n'
                            : '$size boleto\n',
                    style: TextStyles.captionBoldBackground,
                  ),
                  TextSpan(
                    text: size == 0
                        ? 'cadastrados para pagar'
                        : size > 1
                            ? 'cadastrados para pagar'
                            : 'cadastrado para pagar\n',
                    style: TextStyles.captionBackground,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
