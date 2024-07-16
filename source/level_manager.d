module level_manager;

import raylib;
import game_data;
import level;
import Utilities.uid;

static class Level_Manager {

	private static Level[] levels;
	private static UID[] levelLoadOrder;
	private int currentLevelIndex;
	private Level currentlyLoadedLevel;

	//where the levels are located
	private string levelFolderPath = "/Assets/Levels";

	//delegates
	private static void delegate(int levelIndex) onLevelLoaded;
	private static void delegate(int levelIndex) onLevelUnloaded;

	static void Load() {
	}

	static void Update() {
	}

	static void Draw() {
	}

	//-----------------------------------------------

	static void LoadLevelsFromDisk() {
		//TODO: implement level loading... need level file and level file generation
	}

	static void SetLevelLoadOrder(UID[] order) {
		levelLoadOrder = order;
	}

	static void LoadLevel(int index) {
		if (onLevelLoaded) {
			onLevelLoaded(index);
		}
	}

	static void UnloadLevel(int index) {
		if (onLevelUnloaded) {
			onLevelUnloaded(index);
		}
	}

}
