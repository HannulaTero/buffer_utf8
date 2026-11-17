


// Small lookup-table (for every case for 8bit) 
// Leading byte of character being decoded determines,
// how many bytes character will need.
#macro UTF8DECODER_LOOKUP_BYTECOUNT \
  global.__UTF8DECODER_LOOKUP_BYTECOUNT 
  global.__UTF8DECODER_LOOKUP_BYTECOUNT = array_create_ext(256, function(_index)
  {
    // Lead byte bit-pattern determines expected byte-count.
    if ((_index & 0b1000_0000) == 0b0000_0000) return 1;
    if ((_index & 0b1110_0000) == 0b1100_0000) return 2;
    if ((_index & 0b1111_0000) == 0b1110_0000) return 3;
    if ((_index & 0b1111_1000) == 0b1111_0000) return 4;
    
    // Invalid lead byte for UTF-8.
    return 0;
  });