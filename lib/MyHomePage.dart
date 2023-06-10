import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'my_wall_container.dart'; 

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> wallpapers = [];
  int currentPage = 1;
  int totalPages = 1;
  bool isLoading = false;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    fetchWallpapers();

    // Add scroll listener
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    // Dispose the scroll controller
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    // Check if the user has reached the end of the list
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      // Fetch more wallpapers if there are more pages available and not currently loading
      if (currentPage < totalPages && !isLoading) {
        fetchWallpapers();
      }
    }
  }

  Future<void> fetchWallpapers() async {
    const apiKey = 'ugkuavE2qQt4Uvhb326vUAFHySl3naXHBFl7zBokKTRDOWr8CqUCvB6m';
    final apiUrl = 'https://api.pexels.com/v1/search?query=nature&per_page=10&page=$currentPage';

    setState(() {
      isLoading = true;
    });

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {'Authorization': apiKey},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> wallpaperData = data['photos'];
        final int totalResults = data['total_results'];

        setState(() {
          wallpapers.addAll(wallpaperData.map((wallpaper) => wallpaper['src']['medium']).toList());
          currentPage++;
          totalPages = (totalResults / 10).ceil();
          isLoading = false;
        });
      } else {
        // Handle API error
        print('Failed to fetch wallpapers. Error: ${response.statusCode}');
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      // Handle network or other errors
      print('Error occurred: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GridView.builder(
          controller: _scrollController,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: wallpapers.length + 1,
          itemBuilder: (context, index) {
            if (index == wallpapers.length) {
              // Display loading indicator at the end of the list
              return _buildLoadingIndicator();
            }

            final wallpaperUrl = wallpapers[index];
            return MyWallContainer(
              imageUrl: wallpaperUrl
            );
          },
        ),
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}