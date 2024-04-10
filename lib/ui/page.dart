import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dio_bloc/api/api_post_service.dart';
import 'package:flutter_dio_bloc/api/post.dart';
import 'package:flutter_dio_bloc/bloc/post_bloc.dart';
import 'package:flutter_dio_bloc/bloc/post_event.dart';
import 'package:flutter_dio_bloc/bloc/post_state.dart';

class PostPage extends StatelessWidget {
  final int postId;
  final ApiService apiService = ApiService(Dio());

  PostPage({required this.postId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Page'),
      ),
      body: BlocProvider(
        create: (context) =>
            PostBloc(apiService: apiService)..add(FetchPost(postId)),
        child: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            if (state is PostLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is PostLoaded) {
              return _buildPostView(state.posts);
            } else if (state is PostError) {
              return Center(child: Text('Error: ${state.message}'));
            } else {
              return Center(child: Text('Unknown state'));
            }
          },
        ),
      ),
    );
  }

  Widget _buildPostView(List<Post> posts) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return ListTile(
          title: Text('ID: ${post.id}'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('User ID: ${post.userId}'),
              Text('Title: ${post.title}'),
              Text('Body: ${post.body}'),
            ],
          ),
        );
      },
    );
  }
}
