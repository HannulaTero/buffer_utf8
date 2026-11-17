# UTF8 DECODER
## For decoding UTF8 encoded string into UTF8 codepoints.

This small library allows you to quickly read UTF8 codepoints from a buffer.
It can be useful for iterating through large strings (for scanning etc. purposes).

A UTF8 codepoint is numeric value.
If you want turn codepoint to a character (string), then you can simple do `chr(codepoint)`.
In other way around, a character to codepoint can be done by `ord(character)`

For iterating through large strings, it is faster to write string to a buffer and decode with `buffer_utf8_read`,
than trying to use `string_char_at` directly. The reason `string_char_at` being slow, 
is that `string_char_at` needs to walk from beginning of the string and count the characters until it finds Nth character. 
And this is done with each character, so finding latter characters is slower.
When dealing with buffer, it has seek-position, it remembers where it was.
Therefore it doesn't need to do "walk again" like `string_char_at`.

Following functions are provided
* `buffer_utf8_peek`
 *  Like `buffer_peek`, this function reads codepoint at given offset-position. Doesn't advance buffer-tell position. Returns UTF8 codepoint.
* `buffer_utf8_poke`
 * Like `buffer_poke`, this function writes codepoint at given offset-position. Doesn't advance buffer-tell position.
* `buffer_utf8_read`
 *  Like `buffer_read`, this function reads at given buffer-tell position, and advances it. Returns UTF8 codepoint.
* `buffer_utf8_write`
 *  Like `buffer_write`, this function writes at given buffer-tell position, and advances it. 



