

/**
* UTF8 Character decoder.
* 
* The input should be buffer, which contains UTF8-string.
* The character is read at buffers given offset.
* This function doesn't advance buffer.
* 
* This will return decoded UTF8 character as UTF8 codepoint.
* 
* @param {Id.Buffer}  _buffer 
* @param {Real}       _offset
* @returns {Real}
*/ 
function buffer_utf8_peek(_buffer, _offset)
{
  gml_pragma("forceinline");
  
  var _tell = buffer_tell(_buffer);
  buffer_seek(_buffer, buffer_seek_start, _offset);
  var _codepoint = buffer_utf8_read(_buffer);
  buffer_seek(_buffer, buffer_seek_start, _tell);
  return _codepoint;
}


