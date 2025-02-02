/*
  Warnings:

  - You are about to drop the column `LikeCount` on the `story` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE `follower` ALTER COLUMN `updateAt` DROP DEFAULT;

-- AlterTable
ALTER TABLE `story` DROP COLUMN `LikeCount`,
    ALTER COLUMN `updateAt` DROP DEFAULT;

-- AlterTable
ALTER TABLE `user` ALTER COLUMN `updateAt` DROP DEFAULT;
