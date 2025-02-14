import { Router } from "express";
import db from "../../db/db.mjs";
const commentRoute = Router();

commentRoute.post("/create", async (req, res) => {
  try {
    const SID = Number(req.body.StoryId);
    const resp = await db.comment.create({ data: req.body });
    if (resp.Id) {
      const resp1 = await db.story.findUnique({ where: { Id: SID } });
      const ccount = Number(resp1.CommentCount);
      const resp2 = await db.story.update({
        data: {
          CommentCount: ccount + 1,
        },
        where: { Id: SID },
      });
      resp2.Id
        ? res.status(200).json({ data: resp, error: null, success: true })
        : res
            .status(400)
            .json({ data: null, error: "Not updated", success: false });
    } else {
      res
        .status(400)
        .json({ data: null, error: "Not created", success: false });
    }
  } catch (e) {
    res.status(500).json({ data: null, error: e.message, success: false });
  }
});

commentRoute.get("/all/by-id/:sid", async (req, res) => {
  try {
    const SID = Number(req.params.sid);
    const resp = await db.comment.findMany({
      where: { StoryId: SID },
      include: { User: true },
    });

    const formattedResp = resp.map((comment) => ({
      ...comment,
      User: {
        ...comment.User,
        ProfileImage: comment.User.ProfileImage
          ? Buffer.from(comment.User.ProfileImage).toString("base64")
          : null,
      },
    }));

    resp.length !== 0
      ? res
          .status(200)
          .json({ data: formattedResp, error: null, success: true })
      : res
          .status(200)
          .json({ data: [], error: "No Data Found", success: true });
  } catch (e) {
    res.status(500).json({ data: null, error: e.message, success: false });
  }
});

export default commentRoute;
