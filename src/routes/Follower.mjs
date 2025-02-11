import { Router } from "express";
import db from "../../db/db.mjs";

const followerRoute = Router();

followerRoute.post("/follow", async (req, res) => {
  try {
    const resp = await db.follower.create({ data: req.body });
    resp.Id
      ? res.status(200).json({ data: resp, error: null, success: true })
      : res
          .status(400)
          .json({ data: null, error: "Not created", success: false });
  } catch (e) {
    res.status(500).json({ data: null, error: e.message, success: false });
  }
});

followerRoute.get("/verify-follower/:fid/:uid", async (req, res) => {
  try {
    const FID = Number(req.params.fid);
    const UID = Number(req.params.uid);

    const resp = await db.follower.findMany({
      where: {
        OR: [
          { UserId: UID, FollowerId: FID },
          { UserId: FID, FollowerId: UID },
        ],
      },
    });
    resp.length !== 0
      ? res.status(200).json({ data: resp, error: null, success: true })
      : res
          .status(200)
          .json({ data: [], error: "No data found", success: true });
  } catch (e) {
    res.status(500).json({ data: null, error: e.message, success: false });
  }
});

followerRoute.put("/follow-back-or-unfollow/:id", async (req, res) => {
  try {
    const ID = Number(req.params.id);
    const resp = await db.follower.update({
      data: req.body,
      where: { Id: ID },
    });
    resp.Id
      ? res.status(200).json({ data: resp, error: null, success: true })
      : res
          .status(400)
          .json({ data: null, error: "not updated", success: false });
  } catch (e) {
    res.status(500).json({ data: null, error: e.message, success: false });
  }
});

export default followerRoute;
