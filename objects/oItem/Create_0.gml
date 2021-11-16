ID          = undefined;
Name        = undefined;
Description = undefined;
Sprite      = undefined;

SetProperties = function(_name, _description, _sprite = sNoItem) {
  Name        = _name;
  Description = _description;
  Sprite      = _sprite;
}

InitializeByID = function(_id) {
  switch (_id) {
	default: {
      SetProperties("Air", "Nothing");
      break;
    }
  }
}

GetProperties = function() {
  return {
	ID: ID,
	Name: Name,
	Description: Description,
    Sprite: Sprite,
  };
}

Init = function(_id = 0) constructor {
  if (_id < 0) {
    throw("ID cannot be less than 0.");
  }

  ID = _id;
  InitializeByID(_id);
}