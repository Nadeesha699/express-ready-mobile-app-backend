/*
  Warnings:

  - You are about to drop the `image` table. If the table is not empty, all the data it contains will be lost.

*/
-- AlterTable
ALTER TABLE `follower` ALTER COLUMN `updateAt` DROP DEFAULT;

-- AlterTable
ALTER TABLE `story` ALTER COLUMN `updateAt` DROP DEFAULT;

-- AlterTable
ALTER TABLE `user` ALTER COLUMN `updateAt` DROP DEFAULT;

-- DropTable
DROP TABLE `image`;
