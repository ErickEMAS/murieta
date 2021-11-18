class CoverDeck {

  String title;
  int type;

  CoverDeck({
    this.title = "",
    this.type = -1,
  });

  Map<String, dynamic> toJson() => {
    "title": title,
    "type": type,
  };

  static CoverDeck fromJson(Map<String, dynamic> json) {
    final coverDeck = new CoverDeck(
      title: json["title"] ?? "",
      type: json["type"] ?? -1,
    );

    return coverDeck;
  }

}