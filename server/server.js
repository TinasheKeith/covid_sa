const fs = require("fs-extra");
const express = require("express");
const axios = require("axios");

const app = express();

const updateCovidStats = async () => {
  const url = "https://api.covid19api.com/summary";
  try {
    let response = await axios.get(url);
    await fs.writeJson("./database.json", response.data);
  } catch (err) {
    console.log(err);
  }
};

const readFromDb = async () => {
  try {
    const jsonData = await fs.readJson("./database.json");
    return jsonData;
  } catch (err) {
    console.error(err);
  }
};

app.get("/stats", (req, res) => {
  readFromDb()
    .then((jsonData) => {
      console.log(jsonData);
      res.send(jsonData);
      res.end();
    })
    .catch((err) => {
      console.log(err);
      res.status(404);
    });
});

const PORT = process.env.port || 4000;

app.listen(PORT, () => console.log(`server running on port ${PORT}`));
