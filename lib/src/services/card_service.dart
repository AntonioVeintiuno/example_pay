import 'package:example_pay/src/models/card.dart';
import 'package:example_pay/src/services/open_pay_base_service.dart';
import 'package:example_pay/src/utils/openpay_client.dart';

class CardService extends OpenPayBaseService<PayCard,PayCard> {

  OpenPayClient _client;

  CardService(OpenPayClient httpClient) : super(httpClient);

  @override
  String get resourceName => "customers";

  Future<List<PayCard>> getCustomerCards(String customerId){
    String endpoint = getEndpoint(reference:customerId);
    endpoint+="/cards";
    return  getList(PayCard(), endpoint:endpoint );
  }

  Future<PayCard> getCustomerCard(String customerId, String cardId ){
    String endpoint = getEndpoint(reference:customerId);
    endpoint+="/cards/$cardId";
    return get(PayCard(),"",endpoint:endpoint);
  }


  Future<PayCard> createCard(PayCard entity, {String endpoint = null})  {
    endpoint = getEndpoint(reference:entity.customerId);
    endpoint+="/cards";
    return create(entity, endpoint:endpoint);
  }

  Future<bool> removeCard(PayCard entity, {String endpoint = null})  {
    endpoint = getEndpoint(reference:entity.customerId);
    endpoint+="/cards/${entity.id}.";
    return delete("", endpoint:endpoint);
  }

}