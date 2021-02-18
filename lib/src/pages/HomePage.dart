import 'package:flutter/material.dart';
import '../providers/HomeProvider.dart';


class HomePage extends StatelessWidget {

  final HomeProvider homeProvider = HomeProvider();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: false,
      ),
      body: getContent(),
    );
  }

  Widget getContent(){
    return FutureBuilder(
      future: homeProvider.getPosts(),
      builder: ( BuildContext context, AsyncSnapshot<List<Post>> snapshot ){

        if ( !snapshot.hasData ) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return getList( snapshot.data );
      },
    );
  }

  Widget getList( List<Post> data ){
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: ( BuildContext context, int index ){
        return getItem( data[index] );
      },
    );
  }

  Widget getItem(Post post){
    return Column(
      children: [
        Card(
            elevation: 3,
            margin: EdgeInsets.symmetric(vertical: 7), 
            child: ListTile(
                leading: Icon( Icons.check_circle, color: Colors.green ),
                title: Text('id: ${ post.id }' , style: new TextStyle(color: Colors.lightBlueAccent) ,),
                subtitle: new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                  new Text('UserId: ${ post.userId }',
                          style: new TextStyle(
                                  fontSize: 14.0, fontWeight: FontWeight.normal)),
                  new Text('Title: ${ post.title }',
                          style: new TextStyle(
                                  fontSize: 14.0, fontWeight: FontWeight.normal)),
                  new Text('Body: ${ post.body }',
                          style: new TextStyle(
                                fontSize: 12.0, fontWeight: FontWeight.normal)),
                  ]),
                
          ),
        ),
        
        //Divider( height: 0.0 )
      ],
    );
  }

}