import 'package:flutter/material.dart';
import 'package:flutter_news/models/news_model.dart';
import 'package:flutter_news/screens/news_details_screen.dart'; // Import the NewsDetailsScreen

class HomeScreen extends StatelessWidget {
  final List<NewsModel> newsList = [
    // Example list of news
    NewsModel(
      title: 'News 1',
      imageUrl:
          'https://images.pexels.com/photos/3669735/pexels-photo-3669735.jpeg',
      description: 'News 1 description',
      author: 'Author 1',
    ),
    NewsModel(
      title: 'News 2',
      imageUrl:
          'https://images.pexels.com/photos/902194/pexels-photo-902194.jpeg',
      description: 'News 2 description',
      author: 'Author 1',
    ),
    NewsModel(
      title: 'News 3',
      imageUrl:
          'https://images.pexels.com/photos/97050/pexels-photo-97050.jpeg',
      description: 'News 3 description',
      author: 'Author 1',
    ),
    NewsModel(
      title: 'News 4',
      imageUrl:
          'https://images.pexels.com/photos/2495160/pexels-photo-2495160.jpeg',
      description: 'News 4 description',
      author: 'Author 1',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: ListView(
        children: [
          // First Section: Horizontally Scrollable Cards
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: newsList.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    // Handle tap on card to navigate to a separate news page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewsDetailsScreen(
                          news: newsList[index],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.all(8),
                    width: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: NetworkImage(newsList[index].imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.black54,
                      ),
                      child: Center(
                        child: Text(
                          newsList[index].title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // Add other sections here
        ],
      ),
    );
  }
}
