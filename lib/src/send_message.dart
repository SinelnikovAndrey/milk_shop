import 'package:dio/dio.dart';

void SendMessageToTelegram(message) async{
  try {String token = '7756999639:AAGS3ePPNRg5jT7XXm396U4-MYpp7chhup4';
  String id = '842840344';
  String url = 'https://api.telegram.org/bot$token/sendMessage?chat_id=$id&text=$message';
  final response = await Dio().post(url);
  print(response);
  }catch(e){print(e.toString());}
}