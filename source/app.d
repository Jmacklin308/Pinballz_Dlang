module app;

import std.stdio;
import raylib;
import config;
import game;

void main() {
	validateRaylibBinding();
	Game.Load();
	while (!WindowShouldClose()) {
		Game.Update();
		Game.Draw();
	}
	Game.Close();
}
