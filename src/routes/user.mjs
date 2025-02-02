import { Router } from "express";
import db from "../../db/db.mjs";
import bcrypt from "bcrypt";

const userRouter = Router();

userRouter.get("/get-All/:uid", async (req, res) => {
  try {
    const uid = Number(req.params.uid);
    const users = await db.user.findUnique({ where: { Id: uid } });
    users !== null
      ? res.status(200).json({ data: users, success: true, error: null })
      : res
          .status(200)
          .json({ data: null, success: true, error: "no data found" });
  } catch (e) {
    res.status(200).json({ data: null, success: false, error: e });
  }
});

userRouter.get("/login", async (req, res) => {
  try {
    const resp = await db.user.findFirst({
      where: { Email: req.query.Email },
    });
    if (resp !== null) {
      bcrypt.compare(req.query.Password, resp.Password, (_, result) => {
        result === true
          ? res.status(200).json({ error: null, data: resp, success: true })
          : res
              .status(400)
              .json({ error: "Invalid user", data: null, success: false });
      });
    } else {
      res
        .status(400)
        .json({ error: "invalid user", data: null, success: false });
    }
  } catch (e) {
    res.status(400).json({ error: e, data: null, success: false });
  }
});

userRouter.post("/register", async (req, res) => {
  try {
    const { Password, ...otherData } = req.body;
    let regsiterData = { ...otherData };
    regsiterData.Password = await bcrypt.hash(Password, 10);
    const resp = await db.user.create({
      data: regsiterData,
    });
    resp !== null
      ? res.status(200).json({ error: null, data: resp, success: true })
      : res
          .status(400)
          .json({ error: "register failed", data: null, success: false });
  } catch (e) {
    res.status(400).status(400).json({ error: e, data: null, success: false });
  }
});

userRouter.put("/update/:id", async (req, res) => {
  try {
    const { Password, ...otherData } = req.body;
    let updateData = { ...otherData };
    updateData.Password = await bcrypt.hash(Password, 10);
    const Id = Number(req.params.id);
    const resp = await db.user.update({
      where: { Id: Id },
      data: updateData,
    });
    resp !== null
      ? res.status(200).json({ error: null, data: resp, success: true })
      : res
          .status(400)
          .json({ error: "update failed", data: null, success: false });
  } catch (e) {
    res.status(400).json({ error: e, data: null, success: false });
  }
});

export default userRouter;
