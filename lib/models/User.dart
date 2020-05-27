import 'Post.dart';

class User{
  final String uid;
  String imageUrl;
  String name;
  String email;
  User({this.uid, this.email, this.name, this.imageUrl = 'images/mask-girl.png'});
  List<Post> posts;
  List<Post> savedPosts;

}