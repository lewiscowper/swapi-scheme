# swapico-scheme
Scheme library for the Star Wars API (http://swapi.co/)

With the 0.1.0 release done, one can now access a list of endpoints, with `(endpoints)`, and then access those endpoints with (get-all "endpoint"), (get "endpoint" id), and (get-schema "endpoint").

For 0.1.1, users will be able to access the endpoint without wrapping them in a string.

Once that is done, I'll move on to adding validation that (resource) belongs to (endpoints), and then I'll get to look in on how error handling works.

# History

* (0.1.0) Added get-all, get, and get-schema methods.
* Named endpoint calls (planets) (planets x) and (planets-schema) for consistency.
* Initial planet endpoint
