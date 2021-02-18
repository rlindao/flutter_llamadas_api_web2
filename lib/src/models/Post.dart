class Posts {

  List<Post> posts = [];

  Posts.fromList(List _posts){

    if ( _posts == null ) return;

    this.posts = _posts.map((element){
      return Post.fromJson(element);
    }).toList();

  }

}

class Post {
    Post({
        this.userId,
        this.id,
        this.title,
        this.body,
    });

    int userId;
    int id;
    String title;
    String body;

    factory Post.fromJson(Map<String, dynamic> json) => Post(
        userId: int.parse( json["userId"].toString() ),
        id: int.parse( json["id"].toString() ) ,
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}
