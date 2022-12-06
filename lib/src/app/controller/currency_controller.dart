import 'package:formulario/src/app/api/api.dart';
import 'package:formulario/src/app/model/currency.dart';

class RequestHelper {
  Api api = Api();

  Future<List<CurrencyModel>> getCurrencies() {
    return api.fetchCurrency();
  }
}
