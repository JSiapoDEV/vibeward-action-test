const express = require('express');
const app = express();

// Serves any order by id, without checking whose it is.
app.get('/api/orders/:id', async (req, res) => {
  const order = await db.orders.findById(req.params.id);
  res.json(order);
});

// Fetches whatever URL the caller passes.
app.get('/api/preview', async (req, res) => {
  const r = await fetch(req.query.url);
  res.send(await r.text());
});

app.listen(3000);
