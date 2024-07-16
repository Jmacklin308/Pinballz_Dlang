module level;

import enums.difficulty;
import Utilities.uid;
import raylib;
import asset;

//we are going to have alot
class Level {
	public UID id;
	public string name;
	public Difficulty difficulty;

	//world data
	private Asset[] _worldEntities;

	this(string name) {
		this.name = name;
		//create a new UID
		this.id = new UID();
	}

	//-----------Getters-----------
	string getName() const {
		return name;
	}

	string getID() const {
		return id.UidToString();
	}
	//----------------------------
	
	
	
	
	
	
	

}
