class EnderecoFields {
  static final String TABLE_NAME = 'Endereco';
  static final String CEP = 'cep';
  static final String LOGRADOURO = 'logradouro';
  static final String BAIRRO = 'bairro';
  static final String LOCALIDATE = 'localidade';
  static final String UF = 'uf';
}

class EnderecoModel {
  final String cep;
  final String logradouro;
  final String bairro;
  final String localidade;
  final String uf;

  const EnderecoModel({
    required this.cep,
    required this.logradouro,
    required this.bairro,
    required this.localidade,
    required this.uf,
  });

  Map<String, dynamic> toMap(EnderecoModel endereco) {
    return {
      'cep': cep,
      'logradouro': logradouro,
      'bairro': bairro,
      'localidade': localidade,
      'uf': uf,
    };
  }

  factory EnderecoModel.fromMap(Map<String, dynamic> map) {
    return EnderecoModel(
      cep: map['cep'] as String,
      logradouro: map['logradouro'] as String,
      bairro: map['bairro'] as String,
      localidade: map['localidade'] as String,
      uf: map['uf'] as String,
    );
  }
}
