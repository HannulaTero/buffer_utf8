

// Currently defined action whenever meeting invalid character.
// -> This is more useful when using NextSafe,
// -> But used in both when lead-byte is something unexpected.
#macro UTF8DECODER_ERROR_ACTION \
  global.gUTF8DECODER_ERROR_ACTION 
  global.gUTF8DECODER_ERROR_ACTION = UTF8Decoder_ErrorAction_Default



enum UTF8Decoder_ErrorType
{
  GENERAL,
  INVALID_BYTE_LEAD,
  INVALID_BYTE_CONTINUATION,
  EXCEEDS_BUFFER,
  length
};



/**
* Set specific action, which should be taken whenever error is met while decoding.
* 
* @param {Function} _errorAction function(errorType, errorMessage) -> undefined
*/
function UTF8Decoder_SetErrorAction(_errorAction)
{
  UTF8DECODER_ERROR_ACTION = _errorAction;
}



/** 
* Default action for errors met during UTF8 decoding
* 
* @param {Enum.UTF8Decoder_ErrorType}  _errorType
* @param {String}                     _message
*/ 
function UTF8Decoder_ErrorAction_Default(_errorType, _message)
{
  throw(_message);
}



/** 
* Instead of throwing an error, this just gives a warning.
* 
* @param {Enum.UTF8Decoder_ErrorType}  _errorType
* @param {String}                     _message
*/ 
function UTF8Decoder_ErrorAction_Warning(_errorType, _message)
{
  show_debug_message(_message);
}


