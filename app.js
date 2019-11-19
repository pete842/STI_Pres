const express = require('express');
const path = require('path');
const revealRunInTerminal = require('./plugins/reveal-run-in-terminal/index');

let app = express();

app.use(revealRunInTerminal({
  publicPath: __dirname,
  commandRegex: /node|ruby/,
  log: true
}));

app.use(express.static('node_modules/reveal.js'));

app.listen(5000);
