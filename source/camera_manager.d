module camera_manager;

import raylib;

static class Camera_Manager {

	public static Camera2D camera;

	static void load() {
		camera = Camera2D(Vector2(0), Vector2(0), 0, 1);
	}

	static void Update() {

		//move camera with right mouse
		if (IsMouseButtonDown(MouseButton.MOUSE_BUTTON_RIGHT)) {
			Vector2 delta = GetMouseDelta();
			delta = Vector2Scale(delta, -1.0f / camera.zoom);

			camera.target = Vector2Add(camera.target, delta);
		}

		//zoom based off mouse wheel
		// Zoom based on mouse wheel
		float wheel = GetMouseWheelMove();
		if (wheel != 0) {
			// Get the world point that is under the mouse
			Vector2 mouseWorldPos = GetScreenToWorld2D(GetMousePosition(), camera);

			// Set the offset to where the mouse is
			camera.offset = GetMousePosition();

			// Set the target to match, so that the camera maps the world space point
			// under the cursor to the screen space point under the cursor at any zoom
			camera.target = mouseWorldPos;

			// Zoom increment
			const float zoomIncrement = 0.125f;

			camera.zoom += (wheel * zoomIncrement);
			if (camera.zoom < zoomIncrement)
				camera.zoom = zoomIncrement;
		}

	}

	static void Draw() {

	}

}
