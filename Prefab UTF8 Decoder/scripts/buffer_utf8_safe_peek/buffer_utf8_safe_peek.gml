

/**
* UTF8 Character decoder, does validation.
* 
* Does practically the same as buffer_utf8_safe_read,
* but adds more validation steps to ensure safe behaviour.
* - validates bytes in the sequence.
* - checks whether it is going to exceed.
* This doesn't advance the buffer seek-position.
* 
* This will return decoded UTF8 character as UTF8 codepoint.
* 
* @param {Id.Buffer} _buffer 
* @returns {Real}
*/ 
function buffer_utf8_safe_peek(_buffer, _offset)
{
  gml_pragma("forceinline");
  
  var _tell = buffer_tell(_buffer);
  buffer_seek(_buffer, buffer_seek_start, _offset);
  var _codepoint = buffer_utf8_read(_buffer);
  buffer_seek(_buffer, buffer_seek_start, _tell);
  return _codepoint;
}


