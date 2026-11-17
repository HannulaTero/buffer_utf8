

/**
* Pokes UTF8 codepoint to given offset.
* Input should be UTF8 codepoint.
* 
* This is basically wrapper for poking chr(codepoint)
* 
* @param {Id.Buffer}  _buffer 
* @param {Real}       _offset
* @param {Real}       _codepoint
*/ 
function buffer_utf8_poke(_buffer, _offset, _codepoint)
{
  gml_pragma("forceinline");
  
  buffer_poke(_buffer, _offset, buffer_text, chr(_codepoint));
}


