class TeamModel {
  TeamModel(this.team_id, this.users);

  late String team_id;
  List<String> users = [];

  TeamModel.fromDocumentSnapshot(doc) {
    try {
      team_id = doc.id;

      final List articleList = doc.data()["users"];

      articleList.forEach((element) => users.add(element.toString()));
      print(users);

      print(articleList);
    } catch (ex) {
      print(users);
    }
  }
}
