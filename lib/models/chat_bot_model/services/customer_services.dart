import 'dart:convert';

import 'package:capstone_project/models/chat_bot_model/constant/open_ai.dart';
import 'package:capstone_project/models/chat_bot_model/open_ai.dart';
import 'package:http/http.dart' as http;

class CustomerServices {
  static Future<GptData> getCustomerServices({
    required String prompt,
  }) async {
    late GptData gptData = GptData(
      id: "",
      object: "",
      created: 0,
      model: "",
      choices: [],
      usage: Usage(
        promptTokens: 0,
        completionTokens: 0,
        totalTokens: 0,
      ),
    );
    try {
      var url = Uri.parse('https://api.openai.com/v1/completions');

      Map<String, String> headers = {
        'Content-Type': 'application/json;charset=UTF-8',
        'Charset': 'utf-8',
        'Authorization': 'Bearer $apiKey',
      };

      String promptData = prompt;

      final data = jsonEncode({
        {
          "model": "text-davinci-003",
          "prompt": promptData,
          "temperature": 0.4,
          "max_tokens": 64,
          "top_p": 1,
          "frequency_penalty": 0,
          "presence_penalty": 0
        }
      });

      var response = await http.post(url, headers: headers, body: data);
      if (response.statusCode == 200) {
        gptData = gptDataFromJson(response.body);
      }
    } catch (e) {
      throw Exception('Error occured when sending request');
    }

    return gptData;
  }
}
