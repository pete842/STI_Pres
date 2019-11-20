const express = require('express');
const path = require('path');
const revealRunInTerminal = require('./plugins/reveal-run-in-terminal/index.js');

let app = express();

app.use(revealRunInTerminal({
  basePath: __dirname + "/plugins/reveal-run-in-terminal/public",
  publicPath: __dirname + "/public",
  commandRegex: /node|ruby/,
  log: true
}));

app.use(express.static(__dirname + '/public'));

app.use(express.static('node_modules/reveal.js'));
app.use(express.static('node_modules/reveal-code-focus'));

app.listen(5000);
