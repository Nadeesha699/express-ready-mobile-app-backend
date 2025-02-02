import { Router } from "express";
import db from "../../db/db.mjs";

const messageRoute = Router();

messageRoute.get("/verifyConversation/:sid/:rid", async (req, res) => {
  try {
    const RID = Number(req.params.rid);
    const SID = Number(req.params.sid);
    const resp = await db.conversation.findMany({
      where: {
        OR: [
          { CreaterId: RID, ForId: SID },
          { CreaterId: SID, ForId: RID },
        ],
      },
      include: { Message: true, Creator: true, Participant: true },
    });
    resp.length !== 0
      ? res.status(200).json({ data: resp, error: null, success: true })
      : res
          .status(400)
          .json({ data: null, error: "no conversation found", success: false });
  } catch (e) {
    res.status(400).json({ data: null, errror: e, success: false });
  }
});

messageRoute.post("/create-converstion", async (req, res) => {
  try {
    const resp = await db.conversation.create({
      data: req.body,
    });
    resp.length !== 0
    ? res.status(200).json({ data: resp, error: null, success: true })
    : res
        .status(400)
        .json({ data: null, error: "no created", success: false });
  } catch (e) {
    res.status(400).json({ data: null, errror: e, success: false });
  }
});

messageRoute.post("/send", async (req, res) => {
  try {
    const resp = await db.message.create({ data: req.body });
    resp.length !== 0
      ? res.status(200).json({ data: resp, error: null, success: true })
      : res
          .status(400)
          .json({ data: null, error: "no send message", success: false });
  } catch (e) {
    res.status(400).json({ data: null, errror: e, success: false });
  }
});

messageRoute.get("/get-all-converstion/:uid", async (req, res) => {
  try {
    const UID = Number(req.params.uid);
    const resp = await db.conversation.findMany({
      where: { OR: [{ CreaterId: UID }, { ForId: UID }] },
      include: {
        Message: { orderBy: { createAt: "desc" }, take: 1 },
        Creator: true,
        Participant: true,
      },
    });
    const formattedResp = resp.map(conversation => ({
      ...conversation,
      Participant: {
        ...conversation.Participant,
        ProfileImage: conversation.Participant.ProfileImage 
          ? Buffer.from(conversation.Participant.ProfileImage ).toString("base64") 
          : null,
      },
    }));
    resp.length !== 0
      ? res
          .status(200)
          .json({ data: formattedResp, error: null, success: true })
      : res
          .status(400)
          .json({ data: null, error: "no send message", success: false });
  } catch (e) {
    res.status(400).json({ data: null, errror: e, success: false });
  }
});

export default messageRoute;
