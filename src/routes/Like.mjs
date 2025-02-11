import { Router } from "express";
import db from "../../db/db.mjs";

const likeRoute = Router();

likeRoute.post("/add", async (req, res) => {
  try {
    const SID = Number(req.body.StoryId);
    const resp = await db.like.create({ data: req.body });
    if (resp.Id) {
      const resp1 = await db.story.findUnique({ where: { Id: SID } });
      const lcount = Number(resp1.LikeCount);
      const resp2 = await db.story.update({
        data: {
          LikeCount: lcount + 1,
        },
        where: { Id: SID },
      });
      resp2.Id
        ? res.status(200).json({ data: resp, error: null, success: true })
        : res
            .status(400)
            .json({ data: null, error: "not updated", success: false });
    } else {
      res.status(400).json({ data: null, error: "not created", success: false });
    }
  } catch (e) {
    res.status(500).json({ data: null, error: e.message, success: false });
  }
});

likeRoute.delete("/remove/:sid/:uid", async (req, res) => {
  try {
    const SID = Number(req.params.sid);
    const UID = Number(req.params.uid);
    const resp = await db.like.deleteMany({
      where: { StoryId: SID, SenderId: UID },
    });
    if (resp.count !== 0) {
      const resp1 = await db.story.findUnique({ where: { Id: SID } });
      const lcount = Number(resp1.LikeCount);
      const resp2 = await db.story.update({
        data: {
          LikeCount: lcount - resp.count,
        },
        where: { Id: SID },
      });
      resp2.Id
        ? res.status(200).json({ data: resp, error: null, success: true })
        : res
            .status(400)
            .json({ data: null, error: "not updated", success: false });
    } else {
      res.status(400).json({ data: null, error: "not deleted", success: false });
    }
  } catch (e) {
    res.status(500).json({ data: null, error: e.message, success: false });
  }
});

likeRoute.get("/verify/:sid/:uid", async (req, res) => {
  try {
    const SID = Number(req.params.sid);
    const UID = Number(req.params.uid);
    const resp = await db.like.findMany({
      where: { SenderId: UID, StoryId: SID },
    });
    resp.length !== 0
      ? res.status(200).json({ success: true, error: false })
      : res.status(200).json({ success: false, error: false });
  } catch (e) {
    res.status(500).json({ error: e.message, success: false });
  }
});

export default likeRoute;
