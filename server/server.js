const fs = require("fs-extra");
const axios = require("axios");
const cron = require("node-cron");
const express = require("express");

const app = express();

const updateCovidStats = async () => {
  const url = `http://corona-stats.mobi/api/json.2.0.php?key=${process.env.COVID_STATS_KEY}`;
  try {
    let response = await axios.get(url);
    await fs.writeJson("./database.json", response.data);
  } catch (err) {
    console.log(err);
  }
};

cron.schedule("01 * * * *", () => {
  updateCovidStats();
  console.log("running cron job");
});

const readFromDb = async () => {
  try {
    const jsonData = await fs.readJson("./database.json");
    return jsonData;
  } catch (err) {
    console.error(err);
  }
};

app.get("/", async (req, res) => {
  try {
    const jsonData = await readFromDb();
    res.set("Content-Type", "application/json");
    res.status(200).json(jsonData);
  } catch (err) {
    console.log(err);
    return res.status(404).send(err);
  }
});

const PORT = process.env.PORT || 4000;

app.listen(PORT, () => console.log(`server running on port ${PORT}`));
