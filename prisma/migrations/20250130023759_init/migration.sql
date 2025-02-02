/*
  Warnings:

  - You are about to drop the column `ConversationName` on the `conversation` table. All the data in the column will be lost.
  - You are about to drop the column `ConverstionProfile` on the `conversation` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE `conversation` DROP COLUMN `ConversationName`,
    DROP COLUMN `ConverstionProfile`;

-- AlterTable
ALTER TABLE `follower` ALTER COLUMN `updateAt` DROP DEFAULT;

-- AlterTable
ALTER TABLE `following` ALTER COLUMN `updateAt` DROP DEFAULT;

-- AlterTable
ALTER TABLE `story` ALTER COLUMN `updateAt` DROP DEFAULT;

-- AlterTable
ALTER TABLE `user` ALTER COLUMN `updateAt` DROP DEFAULT;

-- AddForeignKey
ALTER TABLE `Conversation` ADD CONSTRAINT `Conversation_ForId_fkey` FOREIGN KEY (`ForId`) REFERENCES `User`(`Id`) ON DELETE RESTRICT ON UPDATE CASCADE;
