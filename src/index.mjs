import { Router } from "express";
import userRouter from "./routes/user.mjs";
import storyRoute from "./routes/Story.mjs";
import followerRoute from "./routes/Follower.mjs";
import messageRoute from "./routes/Message.mjs";
import commentRoute from "./routes/Comment.mjs";
import notificationRoute from "./routes/Notification.mjs";
import likeRoute from "./routes/Like.mjs";

const rootRouter = Router()

rootRouter.use('/user',userRouter)
rootRouter.use('/story',storyRoute)
rootRouter.use('/follower',followerRoute)
rootRouter.use('/messages',messageRoute)
rootRouter.use('/comment',commentRoute)
rootRouter.use('/notification',notificationRoute)
rootRouter.use('/like',likeRoute)
export default rootRouter