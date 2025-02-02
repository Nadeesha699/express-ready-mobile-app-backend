/*
  Warnings:

  - You are about to drop the `message` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `messagelist` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `message` DROP FOREIGN KEY `Message_ListId_fkey`;

-- DropForeignKey
ALTER TABLE `message` DROP FOREIGN KEY `Message_SenderId_fkey`;

-- DropForeignKey
ALTER TABLE `messagelist` DROP FOREIGN KEY `MessageList_UserId_fkey`;

-- AlterTable
ALTER TABLE `follower` ALTER COLUMN `updateAt` DROP DEFAULT;

-- AlterTable
ALTER TABLE `following` ALTER COLUMN `updateAt` DROP DEFAULT;

-- AlterTable
ALTER TABLE `story` ALTER COLUMN `updateAt` DROP DEFAULT;

-- AlterTable
ALTER TABLE `user` ALTER COLUMN `updateAt` DROP DEFAULT;

-- DropTable
DROP TABLE `message`;

-- DropTable
DROP TABLE `messagelist`;
