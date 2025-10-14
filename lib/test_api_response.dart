import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  // Test the Popular products API
  final popularUrl = 'https://ecom-rs8e.onrender.com/api/products?tag=Popular';
  print('Testing Popular Products API: $popularUrl');

  try {
    final response = await http.get(Uri.parse(popularUrl));
    print('Status Code: ${response.statusCode}');

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print('Response Data:');
      print(json.encode(data, toEncodable: (item) => item.toString()));

      // Check if data has the expected structure
      if (data is Map && data.containsKey('data')) {
        print('Data key exists');
        if (data['data'] is Map && data['data'].containsKey('results')) {
          print('Results key exists');
          final results = data['data']['results'];
          print(
              'Number of results: ${results is List ? results.length : "Not a list"}');

          if (results is List && results.isNotEmpty) {
            print(
                'First item keys: ${results.first is Map ? (results.first as Map).keys.toList() : "Not a map"}');
          }
        }
      }
    } else {
      print('Error: ${response.body}');
    }
  } catch (e) {
    print('Exception: $e');
  }
}
