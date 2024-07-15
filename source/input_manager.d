module input_manager;

import raylib;
import game_data;

static class Input_Manager {
	static void Update() {
		if (IsKeyPressed(KeyboardKey.KEY_F1))
			Game_Data.bIsEditorRunning = !Game_Data.bIsEditorRunning;
	}
}
