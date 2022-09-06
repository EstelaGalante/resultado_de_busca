import 'package:cep_app_de_busca/endereco/endereco_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myController = TextEditingController();
  bool _isTapped = false;
  bool light = true;

  @override
  void initState() {
    _myController.addListener(() {
      setState(() {
        _isTapped = true;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              Container(
                width: 500,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(300),
                    bottomRight: Radius.circular(300),
                  ),
                ),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 40),
                        const Center(
                          child: Text(
                            'Busca de CEP',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            'assets/images/mapa.jpeg',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.center,
                  children: [
                    TextField(
                      style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Roboto',
                          fontSize: 25,
                          height: 1.0),
                      controller: _myController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        labelText: 'Digite aqui o CEP',
                        errorText: _isTapped ? _getErrorMessage() : null,
                        hintStyle: TextStyle(
                          fontFamily: 'Montserrat-Bold',
                          fontSize: 6,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      autofocus: false,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      maxLength: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 40),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13),
                          ),
                        ),
                        onPressed:
                            _getErrorMessage() != null ? null : _changePage,
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Text(
                            'Buscar',
                            style: TextStyle(
                              fontFamily: 'Montserrat-Bold',
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 120),
              TextButton(
                onPressed: () {},
                child: Text(
                  'dark/light',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 15,
                    fontStyle: FontStyle.italic,
                    color: Colors.black45,
                  ),
                ),
              ),
              Switch(
                value: light,
                onChanged: (state) {
                  setState(
                    () {},
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _changePage() {
    if (_getErrorMessage() != null) {
      return null;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EnderecoPage(numeroCep: _myController.text),
      ),
    );
  }

  String? _getErrorMessage() {
    if (_myController.text.isEmpty) {
      return 'Campo obrigatorio';
    }
    if (_myController.text.length != 8) {
      return 'Digite o CEP com 8 digitos';
    }
    return null;
  }
}
