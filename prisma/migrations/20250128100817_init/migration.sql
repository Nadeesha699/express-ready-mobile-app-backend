/*
  Warnings:

  - You are about to drop the `messagelist` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `message` DROP FOREIGN KEY `Message_ChatId_fkey`;

-- DropIndex
DROP INDEX `Message_ChatId_fkey` ON `message`;

-- AlterTable
ALTER TABLE `follower` ALTER COLUMN `updateAt` DROP DEFAULT;

-- AlterTable
ALTER TABLE `following` ALTER COLUMN `updateAt` DROP DEFAULT;

-- AlterTable
ALTER TABLE `story` ALTER COLUMN `updateAt` DROP DEFAULT;

-- AlterTable
ALTER TABLE `user` ALTER COLUMN `updateAt` DROP DEFAULT;

-- DropTable
DROP TABLE `messagelist`;

-- CreateTable
CREATE TABLE `Conversation` (
    `Id` INTEGER NOT NULL AUTO_INCREMENT,
    `ConversationName` VARCHAR(191) NOT NULL,
    `ConverstionProfile` LONGBLOB NOT NULL,
    `CreaterId` INTEGER NOT NULL,
    `ForId` INTEGER NOT NULL,

    PRIMARY KEY (`Id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Message` ADD CONSTRAINT `Message_ChatId_fkey` FOREIGN KEY (`ChatId`) REFERENCES `Conversation`(`Id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Conversation` ADD CONSTRAINT `Conversation_CreaterId_fkey` FOREIGN KEY (`CreaterId`) REFERENCES `User`(`Id`) ON DELETE RESTRICT ON UPDATE CASCADE;
