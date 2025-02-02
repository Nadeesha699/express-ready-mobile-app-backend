/*
  Warnings:

  - A unique constraint covering the columns `[FollowerId]` on the table `Follower` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[FollowingId]` on the table `Following` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX `Follower_FollowerId_key` ON `Follower`(`FollowerId`);

-- CreateIndex
CREATE UNIQUE INDEX `Following_FollowingId_key` ON `Following`(`FollowingId`);
