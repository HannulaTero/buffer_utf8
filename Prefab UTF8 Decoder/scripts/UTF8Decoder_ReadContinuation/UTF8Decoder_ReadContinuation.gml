

/**
* Reads a byte and advances buffer.
* Checks whether byte is valid continuation byte.
* If yes, then it is returned.
* If not, then error is raised.
* 
* @param {Id.Buffer} _buffer
* @returns {Real}
*/ 
function UTF8Decoder_ReadContinuation(_buffer)
{
  gml_pragma("forceinline");
  
  var _byte = buffer_read(_buffer, buffer_u8);
  
  // Check the validity. 
  if ((_byte & 0x1100_0000) != 0b1000_0000)
  {
    UTF8DECODER_ERROR_ACTION(
      UTF8Decoder_ErrorType.INVALID_BYTE_LEAD,
      $"[{_GMFUNCTION_}] Invalid continuation-byte [{_byte}]!"
    );
  }
  
  return _byte;
}