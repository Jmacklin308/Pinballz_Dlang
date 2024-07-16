module editor_ui;

import raylib;
import raygui;
import game_data;
import config;
import camera_manager;

static class Editor_UI {

	//Menu items
	private static int _spinner001Value = 0;
	private static bool _spinnerEditMode = false;
	private static int _valueBox002Value = 0;
	private static bool _valueBoxEditMode = false;
	private static char[64] _textBoxText = "Text box";
	private static bool _textBoxEditMode = false;

	//asset menu 
	private static float _assetMenuXLocation = 10;
	private static float _assetMenuYLocation = 100;
	private static float _assetMenuWidth = 200;
	private static float _assetMenuHeight = 400;
	private static float _assetMenuMargin = 20;

	//properties menu

	static void Update() {

	}

	static void Draw() {
		if (!Game_Data.bIsEditorRunning)
			return; //do nothing

		GuiSetStyle(TEXTBOX, TEXT_ALIGNMENT, TEXT_ALIGN_CENTER);

		GuiGroupBox(
			Rectangle(
				_assetMenuXLocation,
				_assetMenuYLocation,
				_assetMenuWidth + _assetMenuMargin,
				_assetMenuHeight + _assetMenuMargin),
			"Assets"
		);

		//GuiSetStyle(VALUEBOX, TEXT_ALIGNMENT, TEXT_ALIGN_LEFT);
		if (GuiSpinner(
				Rectangle(_assetMenuXLocation + 25,
				_assetMenuYLocation + 25, 125, 30),
				null,
				&_spinner001Value,
				0,
				100,
				_spinnerEditMode)
			) {
			_spinnerEditMode = !_spinnerEditMode;

		}

		if (GuiValueBox(Rectangle(25, 175, 125, 30), null, &_valueBox002Value, 0, 100, _valueBoxEditMode)) {
			_valueBoxEditMode = !_valueBoxEditMode;
		}

		GuiSetStyle(TEXTBOX, TEXT_ALIGNMENT, TEXT_ALIGN_LEFT);

		if (GuiTextBox(Rectangle(25, 215, 125, 30), _textBoxText.ptr, 64, _textBoxEditMode)) {
			_textBoxEditMode = !_textBoxEditMode;
		}

		//Anything here will not follow the camera. It will be overlayed on the world
		BeginMode2D(Camera_Manager.camera);
		{
			//draw a grid
			rlPushMatrix();
			rlTranslatef(0, 25 * 50, 0);
			rlRotatef(90, 1, 0, 0);
			DrawGrid(100, 50);
			rlPopMatrix();
		}
		EndMode2D();

	}
}
