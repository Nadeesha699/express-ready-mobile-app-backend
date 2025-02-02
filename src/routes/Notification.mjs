import { Router } from "express";
import db from "../../db/db.mjs";

const notificationRoute = Router();

notificationRoute.get("/all/by-id/:uid", async (req, res) => {
  try {
    const UID = Number(req.params.uid);
    const resp = await db.notification.findMany({
      where: { RecieverId: UID },
      include: { User: true, Story: true, Comment: true },
    });
    resp.length !== 0
      ? res.status(200).json({ data: resp, error: null, success: true })
      : res
          .status(400)
          .json({ data: null, error: "not found", success: false });
  } catch (e) {
    res.status(400).json({ data: null, error: e, success: false });
  }
});

notificationRoute.post("/create", async (req, res) => {
  try {
    const resp = await db.notification.create({ data: req.body });
    resp.length !== 0
      ? res.status(200).json({ data: resp, error: null, success: true })
      : res
          .status(400)
          .json({ data: null, error: "not created", success: false });
  } catch (e) {
    res.status(400).json({ data: null, error: e, success: false });
  }
});

export default notificationRoute;
