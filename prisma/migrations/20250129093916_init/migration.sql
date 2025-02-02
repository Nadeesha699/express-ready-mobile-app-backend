/*
  Warnings:

  - Added the required column `StoryId` to the `Comment` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `comment` ADD COLUMN `StoryId` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `follower` ALTER COLUMN `updateAt` DROP DEFAULT;

-- AlterTable
ALTER TABLE `following` ALTER COLUMN `updateAt` DROP DEFAULT;

-- AlterTable
ALTER TABLE `story` ALTER COLUMN `updateAt` DROP DEFAULT;

-- AlterTable
ALTER TABLE `user` ALTER COLUMN `updateAt` DROP DEFAULT;

-- AddForeignKey
ALTER TABLE `Comment` ADD CONSTRAINT `Comment_StoryId_fkey` FOREIGN KEY (`StoryId`) REFERENCES `Story`(`Id`) ON DELETE RESTRICT ON UPDATE CASCADE;
