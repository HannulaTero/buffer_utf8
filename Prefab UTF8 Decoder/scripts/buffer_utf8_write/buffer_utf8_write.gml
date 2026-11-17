

/**
* Writes UTF8 codepoint.
* This is basically wrapper
* 
* This is basically wrapper for writing chr(codepoint)
* 
* @param {Id.Buffer}  _buffer 
* @param {Real}       _codepoint
*/ 
function buffer_utf8_write(_buffer, _codepoint)
{
  gml_pragma("forceinline");
  
  buffer_write(_buffer, buffer_text, chr(_codepoint));
}


