import 'package:flutter/widgets.dart';
import 'package:payflow/shared/models/billet_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InsertBilletController {
  final formKey = GlobalKey<FormState>();

  BilletModel model = BilletModel();

  String? validateName(String? value) =>
      value?.isEmpty ?? true ? "O nome não pode ser vazio" : null;
  String? validateDueDate(String? value) =>
      value?.isEmpty ?? true ? "A data de vencimento não pode ser vazio" : null;
  String? validateValue(double value) =>
      value == 0 || value < 0 ? "Insira um valor maior que R\$ 0,00" : null;
  String? validateCode(String? value) =>
      value?.isEmpty ?? true ? "O código do boleto não pode ser vazio" : null;

  void onChanged({
    String? name,
    String? dueDate,
    double? value,
    String? barcode,
  }) {
    model = model.copyWith(
      name: name,
      dueDate: dueDate,
      value: value,
      barcode: barcode,
    );
  }

  Future<void> saveBillet() async {
    final instance = await SharedPreferences.getInstance();
    final billets = instance.getStringList("billets") ?? <String>[];
    billets.add(model.toJson());
    await instance.setStringList("billets", billets);
    print(billets);
    return;
  }
}
