/// @desc 

draw_set_font(FNT_Courier);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
var _x = 64;
var _y = 64;
var _i = 0;
var _h = 24;
var _validity = self.isValid ? "is valid" : "validitation failed";

draw_text(_x, _y + _h * _i++, $"DECODER SPEED TEST.");
draw_text(_x, _y + _h * _i++, $"String is {self.textLength} characters long.");
draw_text(_x, _y + _h * _i++, $"---");
draw_text(_x, _y + _h * _i++, $"Press [Z] To read put text into buffer, and decode codepoints one-by-one.");
draw_text(_x, _y + _h * _i++, $"Press [X] To read characters directly from string (string_char_at).");
draw_text(_x, _y + _h * _i++, $"Press [C] To read characters directly from string (string_foreach).");
draw_text(_x, _y + _h * _i++, $"Press [V] Validate decoder results (read both, compare).");
draw_text(_x, _y + _h * _i++, $"---");
draw_text(_x, _y + _h * _i++, $"Time taken for buffer         : {self.timeBuffer} ms");
draw_text(_x, _y + _h * _i++, $"Time taken for string char at : {self.timeString} ms");
draw_text(_x, _y + _h * _i++, $"Time taken for string foreach : {self.timeForeach} ms");
draw_text(_x, _y + _h * _i++, $"Time taken for validation     : {self.timeValidate} ms");
draw_text(_x, _y + _h * _i++, $"---");
draw_text(_x, _y + _h * _i++, $"Validity check result     : {_validity}");


// Draw indicator whether is responsive.
var _dir = current_time / 3;
_x = room_width  - 64 + lengthdir_x(16, _dir);
_y = room_height - 64 + lengthdir_y(16, _dir);
draw_circle(_x, _y, 16, false);