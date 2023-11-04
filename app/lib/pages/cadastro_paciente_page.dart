import 'package:app2/models/paciente.dart';
import 'package:app2/states/paciente_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CadastroPacientePage extends StatefulWidget {
  const CadastroPacientePage({super.key});

  @override
  State<CadastroPacientePage> createState() => _CadastroPacientePageState();
}

class _CadastroPacientePageState extends State<CadastroPacientePage> {
  late PacienteState pacienteState;
  final _formKey = GlobalKey<FormState>();

  final nomeController = TextEditingController();
  final cpfController = TextEditingController();
  final logradouroController = TextEditingController();
  final bairroController = TextEditingController();
  final telefoneController = TextEditingController();
  final dataDeNascimentoController = TextEditingController();
  final pessoasResidenciaController = TextEditingController();
  final pessoasResidenciaQueTrabalhamController = TextEditingController();
  final rendaFamiliaController = TextEditingController();
  final comoConheceuController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    pacienteState = context.watch<PacienteState>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Cadastro Paciente'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: nomeController,
                  decoration: const InputDecoration(
                    labelText: 'Nome*',
                  ),
                  validator: (nome) {
                    if (nome == null || nome.isEmpty) {
                      return 'Digite seu nome.';
                    }
                    return null;
                  },
                ),
                _separador(),
                TextFormField(
                  controller: cpfController,
                  keyboardType: TextInputType.number,
                  maxLength: 11,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: const InputDecoration(
                    labelText: 'CPF*',
                  ),
                  validator: (cpf) {
                    if (cpf == null) {
                      return 'Digite seu CPF.';
                    } else if (cpf.length < 11) {
                      return 'CPF inválido.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: logradouroController,
                  decoration: const InputDecoration(
                    labelText: 'Endereço',
                  ),
                ),
                _separador(),
                TextFormField(
                  controller: bairroController,
                  decoration: const InputDecoration(
                    labelText: 'Bairro',
                  ),
                ),
                _separador(),
                TextFormField(
                  controller: telefoneController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: const InputDecoration(
                    labelText: 'Telefone',
                  ),
                ),
                _separador(),
                TextFormField(
                  controller: dataDeNascimentoController,
                  decoration: const InputDecoration(
                    labelText: 'Data de Nascimento',
                  ),
                  onTap: () async {
                    FocusScope.of(context).requestFocus(FocusNode());

                    DateTime? data = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100));

                    if (data != null) {
                      dataDeNascimentoController.text =
                          "${data.toLocal()}".split(' ')[0];
                    }
                  },
                ),
                _separador(),
                TextFormField(
                  controller: pessoasResidenciaController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: const InputDecoration(
                    labelText: 'Quantas pessoas moram em sua residência',
                  ),
                ),
                _separador(),
                TextFormField(
                  controller: pessoasResidenciaQueTrabalhamController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: const InputDecoration(
                    labelText: 'Quantas pessoas trabalham em sua residência',
                  ),
                ),
                _separador(),
                DropdownButtonFormField(
                  decoration: const InputDecoration(
                    labelText: 'Renda mensal familiar',
                  ),
                  items: <String>['A', 'B', 'C'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    rendaFamiliaController.text = value!;
                  },
                ),
                _separador(),
                DropdownButtonFormField(
                  decoration: const InputDecoration(
                    labelText: 'Como conheceu o instituto?',
                  ),
                  items: <String>['A', 'B', 'C'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    comoConheceuController.text = value!;
                  },
                ),
                _separador(),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        cadastrarPaciente();
                      }
                    },
                    child: const Text('Cadastrar'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  cadastrarPaciente() async {
    Paciente paciente = Paciente(
      id: 0,
      nome: nomeController.text,
      cpf: cpfController.text,
      logradouro: logradouroController.text,
      bairro: bairroController.text,
      telefone: telefoneController.text,
      dataDeNascimento: dataDeNascimentoController.text,
      pessoasResidencia: int.parse(pessoasResidenciaController.text),
      pessoasResidenciaQueTrabalham:
          int.parse(pessoasResidenciaQueTrabalhamController.text),
      rendaFamilia: rendaFamiliaController.text,
      comoConheceu: comoConheceuController.text,
    );

    int pacienteId = await pacienteState.cadastrarPaciente(paciente);
    mostrarDetalhes(pacienteId);
  }

  mostrarDetalhes(int pacienteId) {
    context.pop();
    context.push('/paciente', extra: pacienteId);
  }

  _separador() {
    return const SizedBox(
      height: 20,
    );
  }
}
