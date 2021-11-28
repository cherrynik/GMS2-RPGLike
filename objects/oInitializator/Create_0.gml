// TODO: JSON (read/write)
// TODO: Default remap
// TODO: Remap on custom keys
// TODO: Settings and set up
// TODO: Language support
// TODO: Custom cursor
global.Resolution = {
  Width:  480,
  Height: 270,
}

display_set_gui_size(global.Resolution.Width, global.Resolution.Height);

global.Keymap = {
  MouseWheelInversed: false,
  Inventory: {
    Slot: {
	  First:  [ord(1), vk_nokey],
	  Second: [ord(2), vk_nokey],
	  Third:  [ord(3), vk_nokey],
	},
  },
  Movement: {
    Up:    [ord("W"), vk_up],
    Down:  [ord("S"), vk_down],
    Left:  [ord("A"), vk_left],
    Right: [ord("D"), vk_right],
  },
};

room_goto_next();