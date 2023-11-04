import 'package:app2/models/atendimento.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class DetalheAtendimentoPage extends StatefulWidget {
  final Atendimento atendimento;

  const DetalheAtendimentoPage({super.key, required this.atendimento});

  @override
  State<DetalheAtendimentoPage> createState() => _DetalheAtendimentoPageState();
}

class _DetalheAtendimentoPageState extends State<DetalheAtendimentoPage> {
  late List<String> atendimentoDataList = widget.atendimento.toStringList();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Atendimento'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ExpandablePanel(
          theme: const ExpandableThemeData(
            headerAlignment: ExpandablePanelHeaderAlignment.center,
          ),
          header: const Text('Informações do Atendimento'),
          collapsed: const Text(''),
          expanded: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (_, index) {
              final String data = atendimentoDataList[index];
              return ListTile(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                title: Text(data),
              );
            },
            padding: const EdgeInsets.all(12),
            itemCount: atendimentoDataList.length,
          ),
        ),
      ),
    );
  }

  a() {}
}
