Item   = undefined;
Active = undefined;

Init = function() constructor {
  var _item = instance_create_depth(0, 0, 0, oItem);
  _item.Init();

  Item = _item.GetProperties();

  instance_destroy(_item);
  
  Active = false;
};