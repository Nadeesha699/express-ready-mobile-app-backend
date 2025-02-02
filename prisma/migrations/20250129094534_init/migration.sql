/*
  Warnings:

  - Added the required column `read` to the `Notification` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `follower` ALTER COLUMN `updateAt` DROP DEFAULT;

-- AlterTable
ALTER TABLE `following` ALTER COLUMN `updateAt` DROP DEFAULT;

-- AlterTable
ALTER TABLE `message` ADD COLUMN `read` BOOLEAN NOT NULL DEFAULT true;

-- AlterTable
ALTER TABLE `notification` ADD COLUMN `read` BOOLEAN NOT NULL;

-- AlterTable
ALTER TABLE `story` ALTER COLUMN `updateAt` DROP DEFAULT;

-- AlterTable
ALTER TABLE `user` ALTER COLUMN `updateAt` DROP DEFAULT;
