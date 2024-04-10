abstract class PostEvent {}

class FetchPost extends PostEvent {
  final int postId;

  FetchPost(this.postId);
}
