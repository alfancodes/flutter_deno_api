import 'dart:convert';
import 'package:http/http.dart' as http;

class Quote {
  String quote;
  String author;

  Quote({
    this.quote,
    this.author,
  });

  factory Quote.createQuote(Map<String, dynamic> object) {
    return Quote(
      quote: object['quote'],
      author: object['author'],
    );
  }

  static Future<Quote> connectToAPI() async {
    String uri = 'http://192.168.100.5:3000/api/quote';
    var res = await http.get(uri);
    var jsonObject = json.decode(res.body);
    var quoteData = (jsonObject as Map<String, dynamic>)['quote'];

    return Quote.createQuote(quoteData);
  }
}
