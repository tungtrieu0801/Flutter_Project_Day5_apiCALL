import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  List<dynamic> users = [];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Call API") ,
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context,index,){
            final user = users[index];
            final name = user['name']['first'];
            final email = user ['dob']['date'];
            final imageUrl = user['picture']['large'];
          return ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(imageUrl),

            ),
            title: Text(name),
            subtitle: Text(email),
          );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: fetch,
      ),
    );
  }
  void fetch() async {
    const url ='https://randomuser.me/api/?results=10';
    final uri = Uri.parse(url);  //chuyển hoá URL thành đối tượng uri (uri cung cấp các thuộc tính như host, post,...
    final response = await http.get(uri); //sử dụng lib http để thưc hiện yêu cầu GET và đợi (await) kết quả hoàn thành trả về biến response
    final body = response.body;  //lấy nội dung lưu vào biến body (thường là chuỗi json).
    final json = jsonDecode(body);    // chuyển đổi thành đối tượng có thể sử dụng
    //cập nhật trạng thái của widget, khi trạng thái thay đổi flutter tự động cập nhật
    setState(() {
      users = json['results'];
    });
  }
}
