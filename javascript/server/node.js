var http = require("http");
	http.createServer(function (req, res) {
	res.writeHead(200, {"Content-Type": "text/plain"});
	res.end("Hello.");
}).listen(1337, "127.0.0.1");
console.log("Server running at http://127.0.0.1:1337/");

/* open a Terminal at the file's folder location, enter "node [name of file].js" and go to http://127.0.0.1:1337 */
