Item   = undefined;
Active = undefined;

Init = function() constructor {
  var _item = instance_create_depth(0, 0, 0, oItem);
  _item.Init(irandom_range(1, 255));

  Item = _item.GetProperties();

  instance_destroy(_item);
  
  Active = false;
};