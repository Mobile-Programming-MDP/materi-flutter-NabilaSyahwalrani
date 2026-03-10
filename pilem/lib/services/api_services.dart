import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiServices {
    static const String baseurl = "https://api.themoviedb.org/3";
    //ganti dengan APIKey masing-masing
    static const String apiKey =
    "c01f32a7ad5579a402d8ccdddec6767e";
    //1. mengambil list movie yang saat ini tayang
    Future<List<Map<String, dynamic>>> getAllMovies() 
    async {
        final response = await http.get(Uri.parse("$baseurl/movie/now_playing?api_key=$apiKey"));
        final data = jsonDecode(response.body);
        return List<Map<String, dynamic>>.from(data['results']);
    }
    //2. mengambil list movie yang sedang trending minggu ini
    Future<List<Map<String, dynamic>>> getTrendingMovies() async {
        final response = await http.get(Uri.parse("$baseurl/trending/movie/week?api_key=$apiKey"));
        final data = jsonDecode(response.body);
        return List<Map<String, dynamic>>.from(data['results']);
    }
    //3. mengambil list popular movies
        Future<List<Map<String, dynamic>>> getPopularMovies() async {
        final response = await http.get(Uri.parse("$baseurl/movie/popular?api_key=$apiKey"));
        final data = jsonDecode(response.body);
        return List<Map<String, dynamic>>.from(data['results']);
    }
    //4. mengambil list movie melalui pencarian
        Future<List<Map<String, dynamic>>> searchMovies(String query) async {
        final response = await http.get(Uri.parse("$baseurl/search/movie?api_key=$apiKey"));
        final data = jsonDecode(response.body);
        return List<Map<String, dynamic>>.from(data['results']);
    }
}
