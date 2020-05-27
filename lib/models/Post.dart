import '../widgets/ChatFavContacts.dart';
import 'User.dart';
import 'Comment.dart';

List<Post> posts = [
  Post(
    title: 'buy this card!',
    imageUrl: 'https://img.scryfall.com/cards/normal/front/8/f/8f8a75da-ea3c-43e7-9d32-1c92f8ec0fd2.jpg?1562928849',
    description: 'this card will have huge price increase !! blll have huge price increase !! blll have huge price increase !! blll have huge price increase !! blah blah blah, buyt ut niw!',
    date: DateTime.now(),
    user: sam,
    nComments: 23,
    nLikes: 156,
  ),
  Post(
    title: 'do not buy this card!',
    imageUrl: 'https://img.scryfall.com/cards/normal/front/5/a/5aa90ab6-2686-4462-8725-5d4370c05437.jpg?1562488395',
    description: 'some news from nhushf, dbsjfhi this card will have huge price increase !! blah blah blah, buyt ut niw!',
    date: DateTime.now(),
    user: sophia,
    nComments: 87,
    nLikes: 1350,
  ),
  Post(
    title: 'idk what to do with this card',
    imageUrl: 'https://img.scryfall.com/cards/normal/front/b/d/bd8fa327-dd41-4737-8f19-2cf5eb1f7cdd.jpg?1562933099',
    description: 'hi guys, look at here, this card will have huge price increase !! blah blah blah, buyt ut niw!',
    date: DateTime.now(),
    user: steven,
    nComments: 55,
    nLikes: 2356,
  ),
];

class Post {
  String title;
  String imageUrl;
  String description;
  DateTime date;
  User user;

  List<User> likes;
  List<Comment> comments;
  int nLikes;
  int nComments;

  Post({this.title, this.imageUrl, this.description, this.date, this.user, this.nLikes, this.nComments});

}