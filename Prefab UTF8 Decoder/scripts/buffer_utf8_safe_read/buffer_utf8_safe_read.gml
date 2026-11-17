

/**
* UTF8 Character decoder, does validation.
* 
* This function behaves the same as buffer_utf8_read,
* but adds more validation steps to ensure safe behaviour.
* - validates bytes in the sequence.
* - checks whether it is going to exceed.
* 
* This will return decoded UTF8 character as UTF8 codepoint.
* 
* @param {Id.Buffer} _buffer 
* @returns {Real}
*/ 
function buffer_utf8_safe_read(_buffer)
{
  gml_pragma("forceinline");
  
  // Read first byte.
  var _byteA = buffer_read(_buffer, buffer_u8);
  
  // Determine how many bytes needs to advance.
  // Ensure it doesn't exceed buffer size.
  var _count = UTF8DECODER_LOOKUP_BYTECOUNT[_byteA];
  if (buffer_tell(_buffer) + _count >= buffer_get_size(_buffer))
  {
    UTF8DECODER_ERROR_ACTION(
      UTF8Decoder_ErrorType.EXCEEDS_BUFFER,
      $"[{_GMFUNCTION_}] Lead byte [{_byteA}] means {_count} bytes long character, " +
      $"not enough bytes in remaining buffer!"
    );
  }
  
  
  // Read the bytes.
  switch(_count)
  {
    case 1: {
      return _byteA;
    }
    
    case 2: {
      var _byteB = buffer_utf8_read_continuation_byte(_buffer);
      return (
        ((_byteA & 0b0001_1111) << 6) | 
        ((_byteB & 0b0011_1111))
      );
    }
    
    case 3: {
      var _byteB = buffer_utf8_read_continuation_byte(_buffer);
      var _byteC = buffer_utf8_read_continuation_byte(_buffer);
      return (
        ((_byteA & 0b0000_1111) << 12) | 
        ((_byteB & 0b0011_1111) << 6)  |
        ((_byteC & 0b0011_1111))
      );
    }
    
    case 4: {
      var _byteB = buffer_utf8_read_continuation_byte(_buffer);
      var _byteC = buffer_utf8_read_continuation_byte(_buffer);
      var _byteD = buffer_utf8_read_continuation_byte(_buffer);
      return (
        ((_byteA & 0b0000_0111) << 18) | 
        ((_byteB & 0b0011_1111) << 12) |
        ((_byteC & 0b0011_1111) << 6)  |
        ((_byteD & 0b0011_1111))
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





