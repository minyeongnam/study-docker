const express = require("express");
const app = express();

app.get("/", (req, res) => {
  res.send("dream Coding in Docker!");
});

app.listen(8080, () => console.log("Server is running"));
