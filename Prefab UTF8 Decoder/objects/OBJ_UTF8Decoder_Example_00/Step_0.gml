/// @desc TAKE INPUTS.

var _text   = self.text;
var _buffer = self.buffer;

if (keyboard_check_pressed(ord("Z")) == true)
{
  var _timeBegin = get_timer();
  {
    // Although buffer does have the contents already,
    // it is rewritten to include writing to timing.
    //buffer_write(_buffer, buffer_string, self.text);
    buffer_seek(_buffer, buffer_seek_start, 0);
    var _bytes = buffer_get_size(_buffer);
    while(buffer_tell(_buffer) < _bytes)
    {
      var _codepoint = buffer_utf8_read(_buffer);
      // var _character = chr(_codepoint);
    }
  }
  var _timeEnd = get_timer();
  self.timeBuffer = (_timeEnd - _timeBegin) / 1000;
}



if (keyboard_check_pressed(ord("X")) == true)
{
  var _timeBegin = get_timer();
  {
    var _length = self.textLength;
    for(var i = 1; i < _length; i++)
    {
      var _character = string_char_at(_text, i);
    }
  }
  var _timeEnd = get_timer();
  self.timeString = (_timeEnd - _timeBegin) / 1000;
}



if (keyboard_check_pressed(ord("C")) == true)
{
  var _timeBegin = get_timer();
  {
    string_foreach(self.text, function(_character, _index)
    {
      
    });
  }
  var _timeEnd = get_timer();
  self.timeForeach = (_timeEnd - _timeBegin) / 1000;
}


if (keyboard_check_pressed(ord("V")) == true)
{
  var _timeBegin = get_timer();
  {
    self.isValid = true; // Assume valid.
    
    buffer_seek(_buffer, buffer_seek_start, 0);
    var _length = self.textLength;
    for(var i = 1; i < _length; i++)
    {
      var _codepoint = buffer_utf8_read(_buffer);
      var _character = string_char_at(_text, i);
      if (_character != chr(_codepoint))
      {
        self.isValid = false; // Something doesn't work.
        break;
      }
    }
  }
  var _timeEnd = get_timer();
  self.timeValidate = (_timeEnd - _timeBegin) / 1000;
}


