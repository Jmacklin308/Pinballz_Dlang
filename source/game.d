module game;

import raylib;
import raygui;
import config;
import editor_ui;
import input_manager;
import level_manager;
import camera_manager;

//NOTE: AVOID adding game_data here

static class Game {

	//---------------------------------------------------
	static void Load() {
		InitWindow(Config.SCREEN_WIDTH, Config.SCREEN_HEIGHT, "Hello game!");
		SetTargetFPS(60);
		Camera_Manager.load();
		Level_Manager.Load();
	}

	//---------------------------------------------------
	static void Update() {
		//check for input
		Input_Manager.Update();

		//move the camera
		Camera_Manager.Update();

		//draw the active level
		Level_Manager.Update();

		//show the editor when applicable
		Editor_UI.Update();

	}

	//---------------------------------------------------
	static void Draw() {
		BeginDrawing();
		{
			//background clear
			ClearBackground(Colors.RAYWHITE);

			//camera view - anything in here is respective to the world and moves
			BeginMode2D(Camera_Manager.camera);
			{

				//draw a grid
				rlPushMatrix();
				rlTranslatef(0, 25 * 50, 0);
				rlRotatef(90, 1, 0, 0);
				DrawGrid(100, 50);
				rlPopMatrix();

				// Draw a reference circle
				DrawRectangle(100, 100, 50, 50, Colors.RED);

				//UI

			}
			EndMode2D();

			//UI view - Anything drawn after here moves with the camera (UI, etc.)
			Editor_UI.Draw();

		}
		EndDrawing();
	}

	//---------------------------------------------------
	static void Close() {
		CloseWindow();
	}
}
