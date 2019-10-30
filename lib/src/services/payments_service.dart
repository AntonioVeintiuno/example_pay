
// class PaymentService  {

//   @override
//   String get resourceName => "customers";
//   OpenPayClient _httpClient;
//   PaymentService(this._httpClient);


//   Future<Transaction> performPayment(String customerId, Payment payment ) async {
//     String endpoint = getEndpoint(reference:customerId);
//     endpoint+="/charges";
//     var response = await _httpClient.post(endpoint, payment);
//     return Future<Transaction>.value(Transaction().fromJson(response));

//   }



//    String getEndpoint({String reference = null, String endpoint = null}){
//     if (endpoint!=null) return endpoint;
//     String url= "";
//     var merchandid =  _httpClient.apiMerchandId;
//     url = "$merchandid/$resourceName" ;
//     if (reference != null){
//       url += "/$reference";
//     }
//     return url;
//   }

// }