import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../models/Post.dart';

class IdeaPost extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        //height: 50,
        decoration: BoxDecoration(
          //color: Colors.blue,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            )
        ),
        child: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (BuildContext context, int index){
            Post post = posts[index];
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 10,
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            CircleAvatar(
                              radius:15,
                              backgroundImage: AssetImage(post.user.imageUrl),
                            ),
                            SizedBox(width: 5,),
                            Text(
                              post.user.name,
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                            //Text(),
                          ],
                        ),
                        Icon(Icons.more_horiz),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    alignment: Alignment(-1.0, -1.0),
                    child: Text(
                      post.title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    child: Image.network(
                      post.imageUrl,
                      height: 100,
                      width: MediaQuery.of(context).size.width*0.9,
                      fit: BoxFit.fitWidth,
                    ),
                  ),//Image.network(),
                  Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),
                      alignment: Alignment(-1.0, 0),
                      child: Text(
                        post.description,
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      )
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(Icons.favorite, size: 18, color: Theme.of(context).primaryColor,),
                            SizedBox(width: 5,),
                            Text(
                              post.nLikes.toString(),
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 10,
                              ),
                            ),
                            SizedBox(width: 15,),
                            Icon(Icons.chat_bubble_outline, size: 18, color: Theme.of(context).primaryColor,),
                            SizedBox(width: 5,),
                            Text(
                              post.nComments.toString(),
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 10,
                              ),
                            ),
                            SizedBox(width: 15,),
                            Icon(Icons.send, size: 18, color: Theme.of(context).primaryColor,),
                          ],
                        ),
                        Icon(Icons.favorite_border, size: 18, color: Theme.of(context).primaryColor,),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
      ),
    );
  }
}
