import 'dart:convert';
import 'dart:async';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class MoMoRequests {
  String baseurl = "https://sandbox.momodeveloper.mtn.com/collection";
  String subscriber = "c6ceb7ab60754b1e8ee27197d5557592";
  var log = Logger();
  final storage = new FlutterSecureStorage();

  Future<String> getToken() async {
    // String token = await storage.read(key: "token");
    //String X_Ref_ID="96b1d14b-2f66-4a55-bb71-7174a5d8d371"; //Sandbox API User Ref
    // String API_KEY="215cec9260274d4bb95d10422d25935a"; //From Sandbox for the test user
    const credentials =
        "dmFsZG9hemFubWFzc291QGdtYWlsLmNvbTpBdGxhbnRpcXVlMQ=="; //Get from Basic Auth  encoded on base64
    String url = formater("/token/");
    var response = await http.get(url, headers: {
      "Ocp-Apim-Subscription-Key": "$subscriber",
      "Authorization": "Basic $credentials"
    });

    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, dynamic> output = json.decode(response.body);
      log.i(response.body);
      String res = output["access_token"];
      return res;
    }
    log.i(response.statusCode);

    return response.statusCode.toString();
  }

  Future<http.Response> requestToPay(
       String refId, Map<String, String> body) async {
   String url = formater("/v1_0/requesttopay");
    var token = getToken();
    await storage.write(key: "requesttopayToken", value: token.toString());
    var response = await http.post(
      url,
      body: json.encode(body),
      headers: {
        "X-Target-Environment": "sandbox",
        "Authorization": "Bearer $token",
        "Ocp-Apim-Subscription-Key": "$subscriber",
        "X-Reference-Id": "$refId",
        "Content-type": "application/json"
      },
    );
    return response;
  }

  Future<http.Response> checkPaymentStatus(
      String url, String refTransaction) async {
    String token = await storage.read(key: "requesttopayToken");
    url = formater("/v1_0/requesttopay/" + refTransaction);

    var response = await http.get(
      url,
      headers: {
        "X-Target-Environment": "sandbox",
        "Authorization": "Bearer $token",
        "Ocp-Apim-Subscription-Key": "$subscriber",
        "Content-type": "application/json"
      },
    );
    return response;
  }

  String formater(String url) {
    return baseurl + url;
  }
}
