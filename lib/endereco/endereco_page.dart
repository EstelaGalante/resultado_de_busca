import 'package:cep_app_de_busca/model/endereco_model.dart';
import 'package:cep_app_de_busca/services/cep_repository.dart';
import 'package:flutter/material.dart';

class EnderecoPage extends StatefulWidget {
  final String numeroCep;

  const EnderecoPage({Key? key, required this.numeroCep}) : super(key: key);

  @override
  State<EnderecoPage> createState() => _EnderecoPageState();
}

class _EnderecoPageState extends State<EnderecoPage> {
  final CepRepository service = CepRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Resultado da busca',
          style: TextStyle(
              fontFamily: 'Montserrat-Bold',
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.black),
        ),
      ),
      body: Container(
        child: Center(child: futureBuilderRequest()),
      ),
    );
  }

  Widget _buildTable(EnderecoModel endereco) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Table(
          border: TableBorder.all(),
          children: [
            _buildTableRow(endereco.cep),
            _buildTableRow(endereco.logradouro),
            _buildTableRow(endereco.bairro),
            _buildTableRow(endereco.localidade),
            _buildTableRow(endereco.uf),
          ],
        ),
      ),
    );
  }

  FutureBuilder futureBuilderRequest() {
    return FutureBuilder(
      future: service.buscaCep(cep: widget.numeroCep),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return _buildTable(snapshot.data!);
        }
        if (snapshot.hasError) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              snapshot.error.toString(),
            ),
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }

  TableRow _buildTableRow(String value) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Text(
            value,
            style: TextStyle(
                fontFamily: 'Montserrat-Bold',
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black),
          ),
        ),
      ],
    );
  }
}
