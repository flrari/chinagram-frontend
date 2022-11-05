import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'endpoints.dart';

class ApiCalls {

  //get user list

  //get post list
  Future <Response> getAllPosts() async {
    var client = http.Client();
    var uri = Uri.parse(EndPoints.getAllPosts);
    var response = await client.get(uri);

    return response;
  }
}