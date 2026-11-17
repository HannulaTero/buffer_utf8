/// @desc 


// Buffer where text will be stored.
self.buffer = buffer_load("example.txt");
buffer_seek(self.buffer, buffer_seek_start, 0);


// A long test text.
self.text = buffer_read(self.buffer, buffer_string);
buffer_seek(self.buffer, buffer_seek_start, 0);


// Time taken
self.timeBuffer   = 0;
self.timeString   = 0;
self.timeForeach  = 0;
self.timeValidate = 0;


// Whether validation was success.
self.isValid = undefined;


// Store, so no need to recalculate it.
self.textLength = string_length(self.text);




