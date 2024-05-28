import 'package:flutter/material.dart';

class KomunitasPage extends StatefulWidget {
  @override
  _KomunitasPageState createState() => _KomunitasPageState();
}

class _KomunitasPageState extends State<KomunitasPage> {
  List<String> profileImages = [
    "assets/profile1.jpg",
    "assets/profile2.jpg",
    "assets/profile3.jpg",
    "assets/profile4.jpg",
    "assets/profile5.jpg",
    "assets/profile6.jpg",
    "assets/profile7.jpg",
    "assets/profile8.jpg",
  ];

  List<String> posts = [
    "assets/post1.jpg",
    "assets/post2.jpg",
    "assets/post3.jpg",
    "assets/post4.jpg",
    "assets/post5.jpg",
    "assets/post6.jpg",
    "assets/post7.jpg",
    "assets/post8.jpg",
  ];

  Future<void> onRefresh() async {
    await Future.delayed(
      Duration(seconds: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.only(top: 5, bottom: 20),
          width: MediaQuery.of(context).size.width,
          height: 55,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Search here...",
              hintStyle: TextStyle(
                color: Colors.black.withOpacity(0.5),
              ),
              prefixIcon: Icon(
                Icons.search,
                size: 25,
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.create),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: onRefresh,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Divider(),
              Column(
                children: List.generate(
                  8,
                  (index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //HEADER POST
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            child: CircleAvatar(
                              radius: 14,
                              backgroundImage: AssetImage(
                                "assets/white.jpeg",
                              ),
                              child: CircleAvatar(
                                radius: 12,
                                backgroundImage: AssetImage(
                                  profileImages[index],
                                ),
                              ),
                            ),
                          ),
                          Text("Profile Name"),
                          Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.more_vert),
                          ),
                        ],
                      ),
                      // IMAGE POST
                      Image.asset(posts[index]),
                      // FOOTER POST
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.favorite_border),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.chat_bubble_outline),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
