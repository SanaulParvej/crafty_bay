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
      print('Response headers: ${response.headers}');
      print('Response body length: ${response.body.length}');

      // Try to parse JSON
      try {
        final data = json.decode(response.body);
        print('Successfully parsed JSON');
        print('Response data keys: ${data.keys.toList()}');

        if (data is Map && data.containsKey('data')) {
          print('Data field exists');
          if (data['data'] is Map) {
            print(
                'Data field is a map with keys: ${data['data'].keys.toList()}');
            if (data['data'].containsKey('results')) {
              print('Results field exists');
              final results = data['data']['results'];
              print('Results type: ${results.runtimeType}');
              if (results is List) {
                print('Number of results: ${results.length}');
                if (results.isNotEmpty) {
                  print('First item: ${results.first}');
                }
              }
            }
          }
        }
      } catch (e) {
        print('Error parsing JSON: $e');
        // Print first 500 characters of response body
        print(
            'Response body (first 500 chars): ${response.body.substring(0, response.body.length > 500 ? 500 : response.body.length)}');
      }
    } else {
      print('Error status code: ${response.statusCode}');
      print('Error body: ${response.body}');
    }
  } catch (e) {
    print('Exception: $e');
  }
}
