if (async_load[? "id"] != request_id) exit;

var _status = async_load[? "status"];
if (_status < 0)
{
    // Error occurred
    show_debug_message("IT HAS RESULTED IN FAILURE.")
    exit;
}

if (_status == 1)
{
    // Downloading
    show_debug_message("IT RETRIEVING DATA.")
    exit;
}

if (_status == 0)
{
    // Request completed!
    
    if (async_load[? "http_status"] == 200)
    {
        // Request was succesful
        show_debug_message("IT HAS COMMENCED.")
		url_open("https://www.google.com");
    }
}