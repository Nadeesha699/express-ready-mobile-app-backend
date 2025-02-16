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
          .status(204)
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
    res.status(500).json({ data: null, error: e.message, success: false });
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
    res.status(500).json({ data: null, error: e.message, success: false });
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
    const formattedResp = resp.map((conversation) => ({
      ...conversation,
      Participant: {
        ...conversation.Participant,
        ProfileImage: conversation.Participant.ProfileImage
          ? Buffer.from(conversation.Participant.ProfileImage).toString(
              "base64"
            )
          : null,
      },
    }));
    resp.length !== 0
      ? res
          .status(200)
          .json({ data: formattedResp, error: null, success: true })
      : res
          .status(200)
          .json({ data: [], error: "No data found", success: true });
  } catch (e) {
    res.status(500).json({ data: null, error: e.message, success: false });
  }
});

messageRoute.get("/get-all-messages/:uid", async (req, res) => {
  try {
    const UID = Number(req.params.uid);
    const resp = await db.message.findMany({ where: { UserId: UID, read: false } });

    resp.length !== 0
      ? res
          .status(200)
          .json({ data: resp.length, error: null, success: true })
      : res
          .status(200)
          .json({ data: 0, error: "No data found", success: true });
  } catch (e) {
    res.status(500).json({ data: null, error: e.message, success: false });
  }
});

messageRoute.put("/read/by-id/:chatid", async (req, res) => {
  try {
    const CHATID = Number(req.params.chatid);
    const resp = await db.message.updateMany({
      data: { read: true },
      where: { ChatId: CHATID, read: false },
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

export default messageRoute;
