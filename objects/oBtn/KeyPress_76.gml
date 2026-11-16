var _map_headers = ds_map_create();
request_id = http_request("http://www.google.com", "GET", _map_headers, "");
ds_map_destroy(_map_headers);