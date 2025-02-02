import express from "express";
import rootRouter from "./src/index.mjs";
import cors from "cors";

const server = express();

server.use(cors());
// server.use(express.json());
server.use(express.json({ limit: '20mb' }));
server.use(express.urlencoded({ limit: '20mb', extended: true }));
server.use("/api", rootRouter);
server.listen(4000, () => console.log("sever is running..."));
