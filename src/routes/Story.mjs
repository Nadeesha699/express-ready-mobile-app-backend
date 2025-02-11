import { Router } from "express";
import db from "../../db/db.mjs";

const storyRoute = Router();

storyRoute.get("/get-all", async (_, res) => {
  try {
    const stories = await db.story.findMany({ include: { User: true } });
    const formattedStories = stories.map((story) => ({
      ...story,
      Image: story.Image ? Buffer.from(story.Image).toString("base64") : null,
    }));

    stories.length !== 0
      ? res
          .status(200)
          .json({ data: formattedStories, error: null, success: true })
      : res
          .status(200)
          .json({ data: [], error: "No stories found", success: true });
  } catch (e) {
    res.status(500).json({ data: null, error: e.message, success: false });
  }
});

storyRoute.get("/get-all/by-user-id/:id", async (req, res) => {
  try {
    const Id = Number(req.params.id);
    const stories = await db.story.findMany({
      where: { AuthorId: Id },
      include: { User: true },
    });
    stories
      ? res.status(200).json({ data: stories, error: null, success: true })
      : res
          .status(200)
          .json({ data: [], error: "No stories found", success: true });
  } catch (e) {
    res.status(500).json({ data: null, error: e.message, success: false });
  }
});

storyRoute.post("/create", async (req, res) => {
  try {
    const resp = await db.story.create({ data: req.body });
    resp.Id
      ? res.status(201).json({ data: resp, error: null, success: true })
      : res
          .status(400)
          .json({ data: null, error: "Not Created", success: false });
  } catch (e) {
    res.status(500).json({ data: null, error: e.message, success: false });
  }
});

export default storyRoute;
