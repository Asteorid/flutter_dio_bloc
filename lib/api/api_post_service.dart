import 'package:dio/dio.dart';
import 'package:flutter_dio_bloc/api/post.dart';
import 'package:retrofit/http.dart';

part 'api_post_service.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("/posts")
  Future<List<Post>> getPosts();
}
