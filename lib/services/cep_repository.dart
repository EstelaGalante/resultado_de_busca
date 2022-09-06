import 'package:cep_app_de_busca/model/endereco_model.dart';
import 'package:dio/dio.dart';

class CepRepository {
  final dio = Dio();
  late EnderecoModel cepModel;

  Future buscaCep({required String cep}) async {
    try {
      final res = await dio.get('https://viacep.com.br/ws/$cep/json/');
      cepModel = EnderecoModel.fromMap(res.data);
    } on DioError catch (e) {
      if (e.response != null) {
        throw 'Não foi encontrado nenhum endereço!';
      } else {
        throw Exception(e.message);
      }
    }

    return cepModel;
  }
}
