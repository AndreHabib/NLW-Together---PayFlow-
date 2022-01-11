import 'package:flutter/material.dart';
import 'package:payflow/shared/models/billet_model.dart';

import 'package:payflow/shared/widgets/billet_list/billet_list_controller.dart';
import 'package:payflow/shared/widgets/billet_tile/billet_tile_widget.dart';

class BilletListWidget extends StatefulWidget {
  const BilletListWidget({Key? key, required this.controller})
      : super(key: key);
  final BilletListController controller;

  @override
  _BilletListWidgetState createState() => _BilletListWidgetState();
}

class _BilletListWidgetState extends State<BilletListWidget> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<BilletModel>>(
      valueListenable: widget.controller.billetsNotifier,
      builder: (_, billets, __) => Column(
        children: billets.map((e) => BilletTileWidget(data: e)).toList(),
      ),
    );
  }
}
