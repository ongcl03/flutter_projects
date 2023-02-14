import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_projects/models/team.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  List<Team> teams = [];

  // get team
  Future getTeams() async {
    var response = await http.get(Uri.https('balldontlie.io', 'api/v1/teams'));
    var jsonData = jsonDecode(response.body);

    for (var eachTeam in jsonData['data']) {
      final team = Team(
        abbreviation: eachTeam['abbreviation'],
        city: eachTeam['city'],
      );
      teams.add(team);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text("NBA APP", style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getTeams(),
        builder: (context, snapshot){
          // is it done loading? then show data
          if (snapshot.connectionState == ConnectionState.done){
            return ListView.builder(
                itemCount: teams.length,
                itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: ListTile(
                        title: Text(teams[index].abbreviation),
                        subtitle: Text(teams[index].city),
                      ),
                    ),
                  );
                }
            );
          }

          // else it is still loading, show loading circle
          else{
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
