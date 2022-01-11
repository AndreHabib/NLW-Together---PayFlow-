import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payflow/modules/insert_billet/insert_billet_controller.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/input_text/input_text_widget.dart';
import 'package:payflow/shared/widgets/set_label_buttons/set_label_buttons.dart';

class InsertBilletPage extends StatefulWidget {
  const InsertBilletPage({Key? key, this.barcode}) : super(key: key);
  final String? barcode;

  @override
  State<InsertBilletPage> createState() => _InsertBilletPageState();
}

class _InsertBilletPageState extends State<InsertBilletPage> {
  final controller = InsertBilletController();
  final moneyInputTextController =
      MoneyMaskedTextController(leftSymbol: "R\$", decimalSeparator: ",");
  final dueDateInputTextController = MaskedTextController(mask: "00/00/0000");
  final barcodeInputTextController = TextEditingController();

  @override
  void initState() {
    if (widget.barcode != null) {
      barcodeInputTextController.text = widget.barcode!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: BackButton(color: AppColors.input),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 69,
                ),
                child: Text(
                  'Preencha os dados do boleto',
                  style: TextStyles.titleBoldHeading,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Form(
                key: controller.formKey,
                child: Column(
                  children: <Widget>[
                    InputTextWidget(
                      label: 'Nome do boleto',
                      icon: Icons.description_outlined,
                      validator: controller.validateName,
                      onChanged: (value) {
                        controller.onChanged(name: value);
                      },
                    ),
                    InputTextWidget(
                      controller: dueDateInputTextController,
                      label: 'Vencimento',
                      icon: FontAwesomeIcons.timesCircle,
                      validator: controller.validateDueDate,
                      onChanged: (value) {
                        controller.onChanged(dueDate: value);
                      },
                    ),
                    InputTextWidget(
                      controller: moneyInputTextController,
                      label: 'Valor',
                      icon: FontAwesomeIcons.wallet,
                      validator: (_) => controller
                          .validateValue(moneyInputTextController.numberValue),
                      onChanged: (value) {
                        controller.onChanged(
                            value: moneyInputTextController.numberValue);
                      },
                    ),
                    InputTextWidget(
                      controller: barcodeInputTextController,
                      label: 'Código',
                      icon: FontAwesomeIcons.barcode,
                      validator: controller.validateCode,
                      onChanged: (value) {
                        controller.onChanged(
                            barcode: barcodeInputTextController.text);
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: SetLabelButtons(
        primaryLabel: 'Cancelar',
        primaryOnPressed: () {
          Navigator.pop(context);
        },
        secondaryLabel: 'Cadastrar',
        secondaryOnPressed: () async {
          if (controller.formKey.currentState!.validate()) {
            await controller.saveBillet();
            Navigator.pop(context);
          }
        },
        enableSecondaryColor: true,
      ),
    );
  }
}
