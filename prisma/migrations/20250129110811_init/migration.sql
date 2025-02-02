/*
  Warnings:

  - You are about to drop the column `UploadStoryCover` on the `notification` table. All the data in the column will be lost.
  - You are about to drop the column `UploadStoryName` on the `notification` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE `follower` ALTER COLUMN `updateAt` DROP DEFAULT;

-- AlterTable
ALTER TABLE `following` ALTER COLUMN `updateAt` DROP DEFAULT;

-- AlterTable
ALTER TABLE `notification` DROP COLUMN `UploadStoryCover`,
    DROP COLUMN `UploadStoryName`,
    ADD COLUMN `StoryId` INTEGER NULL;

-- AlterTable
ALTER TABLE `story` ALTER COLUMN `updateAt` DROP DEFAULT;

-- AlterTable
ALTER TABLE `user` ALTER COLUMN `updateAt` DROP DEFAULT;

-- AddForeignKey
ALTER TABLE `Notification` ADD CONSTRAINT `Notification_StoryId_fkey` FOREIGN KEY (`StoryId`) REFERENCES `Story`(`Id`) ON DELETE SET NULL ON UPDATE CASCADE;
