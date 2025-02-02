import { Router } from "express";
import db from "../../db/db.mjs";

const storyRoute = Router();

storyRoute.get("/get-all", async (_, res) => {
  try {
    const stories = await db.story.findMany({include:{User:true}});
    const formattedStories = stories.map(story => ({
      ...story,
      Image: story.Image ? Buffer.from(story.Image).toString("base64") : null
    }));

    stories.length !== 0
      ? res.status(200).json({ data:formattedStories, errror: null, success: true })
      : res
          .status(400)
          .json({ data: null, errror: "no data found", success: false });
  } catch (e) {
    res.status(400).json({ data: null, errror: e, success: false });
  }
});

storyRoute.get("/get-all/by-user-id/:id", async (req, res) => {
  try {
    const Id = Number(req.params.id);
    const stories = await db.story.findMany({ where: { AuthorId: Id },include:{User:true} });
    stories !== null
      ? res.status(200).json({ data: stories, errror: null, success: true })
      : res
          .status(400)
          .json({ data: null, errror: "no data found", success: false });
  } catch (e) {
    res.status(400).json({ data: null, errror: e, success: false });
  }
});

storyRoute.post("/create", async (req, res) => {
  try {
    const resp = await db.story.create({ data: req.body });
    resp !== null
      ? res.status(200).json({ data: resp, errror: null, success: true })
      : res
          .status(400)
          .json({ data: null, errror: "can't create", success: false });
  } catch (e) {
    res.status(400).json({ data: null, errror: e, success: false });
  }
});

// storyRoute.get("/like/by-story-id/:sid", async (req, res) => {
//   try {
//     const Sid = Number(req.params.sid);
//     const resp = await db.story.findFirst({ where: { Id: Sid } });

//     const Id = Number(resp.Id);
//     const AuthorId = Number(resp.AuthorId);
//     let likeCount = Number(resp.LikeCount);
//     const oppesite = Boolean(req.query.oppesite);
//     oppesite ? likeCount += 1 : likeCount -= 1;
//     console.log(likeCount);
//     if (resp) {
//       const result = await db.story.update({
//         where: { Id: Id },
//         data: {
//           Tittle: resp.Tittle,
//           Story: resp.Story,
//           LikeCount: likeCount,
//           // AuthorName:resp.AuthorName,
//           AuthorId: AuthorId,
//           Category: resp.Category,
//         },
//       });

//       result !== null
//         ? res.status(200).json({ data: result, errror: null, success: true })
//         : res
//             .status(400)
//             .json({ data: null, errror: "not liked", success: false });
//     } else {
//       res.status(400).json({ data: null, errror: "not liked", success: false });
//     }
//   } catch (e) {
//     res.status(400).json({ data: null, errror: e, success: false });
//   }
// });

export default storyRoute;
