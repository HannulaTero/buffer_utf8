

/**
* UTF8 Character decoder.
* 
* The input should be buffer, which contains UTF8-string.
* The character is read at buffers current seek-position.
* This function advances buffer by the character size.
* 
* This will return decoded UTF8 character as UTF8 codepoint.
* 
* This is function is "unsafe" as it:
* - does not validate bytes in the sequence.
* - does not check whether it is going to exceed.
* -> These are left out for speed (when you know string is valid).
* -> If validation is required, use UTF8Decoder_NextSafe instead.
* 
* @param {Id.Buffer} _buffer 
* @returns {Real}
*/ 
function UTF8Decoder_Next(_buffer)
{
  gml_pragma("forceinline");
  
  // Read first byte.
  var _byteA = buffer_read(_buffer, buffer_u8);
  
  // Determine how many bytes needs to advance.
  switch(UTF8DECODER_LOOKUP_BYTECOUNT[_byteA])
  {
    case 1: {
      return _byteA;
    }
    
    case 2: {
      var _byteB = buffer_read(_buffer, buffer_u8);
      return (
        ((_byteA & 0x0001_1111) << 6) | 
        ((_byteB & 0x0011_1111))
      );
    }
    
    case 3: {
      var _byteB = buffer_read(_buffer, buffer_u8);
      var _byteC = buffer_read(_buffer, buffer_u8);
      return (
        ((_byteA & 0x0000_1111) << 12) | 
        ((_byteB & 0x0011_1111) << 6)  |
        ((_byteC & 0x0011_1111))
      );
    }
    
    case 4: {
      var _byteB = buffer_read(_buffer, buffer_u8);
      var _byteC = buffer_read(_buffer, buffer_u8);
      var _byteD = buffer_read(_buffer, buffer_u8);
      return (
        ((_byteA & 0x0000_0111) << 18) | 
        ((_byteB & 0x0011_1111) << 12) |
        ((_byteC & 0x0011_1111) << 6)  |
        ((_byteD & 0x0011_1111))
      );
    }
    
    // Otherwise raise a error.
    default: {
      UTF8DECODER_ERROR_ACTION(
        UTF8Decoder_ErrorType.INVALID_BYTE_LEAD,
        $"[{_GMFUNCTION_}] Invalid lead-byte [{_byteA}]!"
      );
      return _byteA;
    }
  }
}





