import '../model/post.dart';
import 'endpoints.dart';

class ApiCalls {

  var client = http.Client();

  static get http => null;
  //get user list

  //get post list
  Future <Response> getAllPosts() async {
    var uri = Uri.parse(EndPoints.getAllPosts);
    var response = await client.get(uri);

    return response;
  }
}