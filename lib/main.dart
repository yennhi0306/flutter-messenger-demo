import 'package:flutter/material.dart';
import 'package:chatview/chatview.dart';

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
                buildProfileAvatar('https://cdn.pixabay.com/photo/2016/11/18/23/38/child-1837375_1280.png', 'Tuyen'),
                buildProfileAvatar('https://cdn.pixabay.com/photo/2016/11/18/23/38/child-1837375_1280.png', 'Truc'),
                buildProfileAvatar('https://cdn.pixabay.com/photo/2016/11/18/23/38/child-1837375_1280.png', 'Phu'),
                buildProfileAvatar('https://cdn.pixabay.com/photo/2016/11/18/23/38/child-1837375_1280.png', 'Tien'),
                buildProfileAvatar('https://cdn.pixabay.com/photo/2016/11/18/23/38/child-1837375_1280.png', 'Mom'),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                buildConversationTile('Yen Nhi', 'ok??', '9:30 am', 'https://cdn.pixabay.com/photo/2016/11/18/23/38/child-1837375_1280.png', context),
                buildConversationTile('Tran Long Phu', 'You sent a sticker.', 'Mon', 'https://cdn.pixabay.com/photo/2016/11/18/23/38/child-1837375_1280.png', context),
                buildConversationTile('Le Duc Tien', 'Ok?', 'Mon', 'https://cdn.pixabay.com/photo/2016/11/18/23/38/child-1837375_1280.png', context),
                buildConversationTile('Mom', '?', 'Sun', 'https://cdn.pixabay.com/photo/2016/11/18/23/38/child-1837375_1280.png', context),
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
      String name, String message, String time, String imageUrl, BuildContext context) {
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
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatScreen(name: name, imageUrl: imageUrl)),
        );
      },
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

class ChatScreen extends StatefulWidget {
  final String name;
  final String imageUrl;

  ChatScreen({required this.name, required this.imageUrl});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _chatController = ChatController(
    initialMessageList: [],
    scrollController: ScrollController(),
    currentUser: ChatUser(
      id: '1',
      name: 'You',
      profilePhoto: 'https://cdn.pixabay.com/photo/2016/11/18/23/38/child-1837375_1280.png',
    ),
    otherUsers: [
      ChatUser(
        id: '2',
        name: 'Yen Nhi',
        profilePhoto: 'https://cdn.pixabay.com/photo/2016/11/18/23/38/child-1837375_1280.png',
      ),
      ChatUser(
        id: '3',
        name: 'Thanh Tuyen',
        profilePhoto: 'https://cdn.pixabay.com/photo/2016/11/18/23/38/child-1837375_1280.png',
      ),
      ChatUser(
        id: '4',
        name: 'Thanh Truc',
        profilePhoto: 'https://cdn.pixabay.com/photo/2016/11/18/23/38/child-1837375_1280.png',
      ),
      ChatUser(
        id: '5',
        name: 'Tran Long Phu',
        profilePhoto: 'https://cdn.pixabay.com/photo/2016/11/18/23/38/child-1837375_1280.png',
      ),
      ChatUser(
        id: '6',
        name: 'Le Duc Tien',
        profilePhoto: 'https://cdn.pixabay.com/photo/2016/11/18/23/38/child-1837375_1280.png',
      ),
      ChatUser(
        id: '7',
        name: 'Mom',
        profilePhoto: 'https://cdn.pixabay.com/photo/2016/11/18/23/38/child-1837375_1280.png',
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChatView(
        chatController: _chatController,
        onSendTap: (message, replyMessage, messageType) {
          _onSendTap(message);
        },
        featureActiveConfig: const FeatureActiveConfig(
          lastSeenAgoBuilderVisibility: true,
          receiptsBuilderVisibility: true,
        ),
        chatViewState: ChatViewState.hasMessages,
        appBar: ChatViewAppBar(
          profilePicture: widget.imageUrl,
          chatTitle: widget.name,
          chatTitleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            letterSpacing: 0.25,
          ),
          userStatus: "online",
          userStatusTextStyle: const TextStyle(color: Colors.grey),
        ),
        sendMessageConfig: SendMessageConfiguration(
          textFieldConfig: TextFieldConfiguration(
            onMessageTyping: (status) {
              /// Do with status
              debugPrint(status.toString());
            },
            compositionThresholdTime: const Duration(seconds: 1),
            textStyle: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  void _onSendTap(String message) {
    final ChatUser currentUser = _chatController.currentUser;
    final messageObject = Message(
      id: DateTime.now().toString(),
      message: message,
      createdAt: DateTime.now(),
      sentBy: currentUser.id,
    );
    _chatController.addMessage(messageObject);
  }

  void receiveMessage() {
    final ChatUser sender = _chatController.otherUsers.firstWhere((user) => user.id == '2');
    final message = Message(
      id: DateTime.now().toString(),
      message: 'Hello!',
      createdAt: DateTime.now(),
      sentBy: sender.id,
    );
    _chatController.addMessage(message);
  }
}