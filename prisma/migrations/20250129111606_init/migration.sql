/*
  Warnings:

  - You are about to drop the column `SenderComent` on the `notification` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE `follower` ALTER COLUMN `updateAt` DROP DEFAULT;

-- AlterTable
ALTER TABLE `following` ALTER COLUMN `updateAt` DROP DEFAULT;

-- AlterTable
ALTER TABLE `notification` DROP COLUMN `SenderComent`,
    ADD COLUMN `CommentId` INTEGER NULL;

-- AlterTable
ALTER TABLE `story` ALTER COLUMN `updateAt` DROP DEFAULT;

-- AlterTable
ALTER TABLE `user` ALTER COLUMN `updateAt` DROP DEFAULT;

-- AddForeignKey
ALTER TABLE `Notification` ADD CONSTRAINT `Notification_CommentId_fkey` FOREIGN KEY (`CommentId`) REFERENCES `Comment`(`Id`) ON DELETE SET NULL ON UPDATE CASCADE;
