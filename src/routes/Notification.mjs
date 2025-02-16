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

    const formattedResp = resp.map((val) => ({
      ...val,

      User: val.User
        ? {
            ...val.User,
            ProfileImage: val.User.ProfileImage
              ? Buffer.from(val.User.ProfileImage).toString("base64")
              : null,
          }
        : null,

      Story: val.Story
        ? {
            ...val.Story,
            Image: val.Story.Image
              ? Buffer.from(val.Story.Image).toString("base64")
              : null,
          }
        : null,

      Comment: val.Comment
        ? {
            ...val.Comment,
          }
        : null,
    }));
    if (resp.length !== 0) {
      res.status(200).json({ data: formattedResp, error: null, success: true });
    } else {
      res.status(200).json({ data: [], error: "Not Found", success: true });
    }
  } catch (e) {
    res.status(500).json({ data: null, error: e.message, success: false });
  }
});

notificationRoute.get("/all-count/by-id/:uid", async (req, res) => {
  try {
    const UID = Number(req.params.uid);

    const resp = await db.notification.findMany({
      where: { RecieverId: UID, read: false },
    });

    if (resp.length !== 0) {
      res.status(200).json({ data: resp.length, error: null, success: true });
    } else {
      res.status(200).json({ data: 0, error: "Not Found", success: true });
    }
  } catch (e) {
    res.status(500).json({ data: null, error: e.message, success: false });
  }
});

notificationRoute.put("/read/by-id/:uid", async (req, res) => {
  try {
    const UID = Number(req.params.uid);

    const resp = await db.notification.updateMany({
      data: { read: true },
      where: { RecieverId: UID, read: false },
    });

    if (resp.count > 0) {
      res.status(200).json({ data: resp, error: null, success: true });
    } else {
      res.status(200).json({ data: null, error: "Not updated", success: true });
    }
  } catch (e) {
    console.log(e.message)
    res.status(500).json({ data: null, error: e.message, success: false });
  }
});

notificationRoute.post("/create", async (req, res) => {
  try {
    const resp = await db.notification.create({ data: req.body });
    resp.Id
      ? res.status(201).json({ data: resp, error: null, success: true })
      : res
          .status(400)
          .json({ data: null, error: "Not Created", success: false });
  } catch (e) {
    res.status(500).json({ data: null, error: e.message, success: false });
  }
});

export default notificationRoute;
