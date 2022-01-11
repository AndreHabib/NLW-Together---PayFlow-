import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:payflow/shared/models/billet_model.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/billet_info/billet_info_widget.dart';
import 'package:payflow/shared/widgets/billet_list/billet_list_controller.dart';
import 'package:payflow/shared/widgets/billet_list/billet_list_widget.dart';

class MyBilletsPage extends StatefulWidget {
  const MyBilletsPage({Key? key}) : super(key: key);

  @override
  State<MyBilletsPage> createState() => _MyBilletsPageState();
}

class _MyBilletsPageState extends State<MyBilletsPage> {
  final controller = BilletListController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Stack(
            children: [
              Container(
                color: AppColors.primary,
                height: 40,
                width: double.maxFinite,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ValueListenableBuilder<List<BilletModel>>(
                  valueListenable: controller.billetsNotifier,
                  builder: (_, billets, __) => AnimatedCard(
                      direction: AnimatedCardDirection.top,
                      child: BilletInfoWidget(size: billets.length)),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24.0, left: 24.0, right: 24.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Meus boletos',
                style: TextStyles.titleBoldHeading,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24.0),
            child: Divider(
              color: AppColors.stroke,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: BilletListWidget(
              controller: controller,
            ),
          ),
        ],
      ),
    );
  }
}
