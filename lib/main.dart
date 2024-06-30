import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Messenger ListView',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Messenger',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue[200],
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Tìm kiếm',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          Container(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                buildProfileAvatar('https://cdn.pixabay.com/photo/2016/11/18/23/38/child-1837375_1280.png', 'Nhi'),
                buildProfileAvatar('https://cdn.pixabay.com/photo/2016/11/18/23/38/child-1837375_1280.png', 'Truc'),
                buildProfileAvatar('https://cdn.pixabay.com/photo/2016/11/18/23/38/child-1837375_1280.png', 'Tuyen'),
                buildProfileAvatar('https://cdn.pixabay.com/photo/2016/11/18/23/38/child-1837375_1280.png', 'Long'),
                buildProfileAvatar('https://cdn.pixabay.com/photo/2016/11/18/23/38/child-1837375_1280.png', 'Tien'),
                buildProfileAvatar('https://cdn.pixabay.com/photo/2016/11/18/23/38/child-1837375_1280.png', 'Mom'),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                buildConversationTile('Yen Nhi', 'ok??', '9:30 am', 'https://cdn.pixabay.com/photo/2016/11/18/23/38/child-1837375_1280.png'),
                buildConversationTile('Tran Long Phu', 'You sent a sticker.', 'Mon', 'https://cdn.pixabay.com/photo/2016/11/18/23/38/child-1837375_1280.png'),
                buildConversationTile('Le Duc Tien', 'Ok?', 'Mon', 'https://cdn.pixabay.com/photo/2016/11/18/23/38/child-1837375_1280.png'),
                buildConversationTile('Mom', '?', 'Sun', 'https://cdn.pixabay.com/photo/2016/11/18/23/38/child-1837375_1280.png'),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }

  Widget buildProfileAvatar(String imageUrl, String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(imageUrl),
            radius: 30,
          ),
          SizedBox(height: 4),
          Text(name, style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  Widget buildConversationTile(
      String name, String message, String time, String imageUrl) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
        radius: 30,
      ),
      title: Text(name, maxLines: 1, overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      subtitle: Text(message, maxLines: 1, overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 16)),
      trailing: Text(time),
      onTap: () {},
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      onTap: (index) {},
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Đoạn chat'),
        BottomNavigationBarItem(icon: Icon(Icons.contacts), label: 'Danh bạ'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Cài đặt'),
      ],
    );
  }
}
