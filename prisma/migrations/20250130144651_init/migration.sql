/*
  Warnings:

  - Made the column `LikeCount` on table `story` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE `follower` ALTER COLUMN `updateAt` DROP DEFAULT;

-- AlterTable
ALTER TABLE `following` ALTER COLUMN `updateAt` DROP DEFAULT;

-- AlterTable
ALTER TABLE `story` MODIFY `LikeCount` INTEGER NOT NULL DEFAULT 0,
    ALTER COLUMN `updateAt` DROP DEFAULT;

-- AlterTable
ALTER TABLE `user` ALTER COLUMN `updateAt` DROP DEFAULT;
