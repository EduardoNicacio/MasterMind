function startNewGame() {
    window.location = "/MasterMind/Game?multiplayer=false&totalColors=8&playerName=" + $("#txtName").val();
}