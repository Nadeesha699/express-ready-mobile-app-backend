-- AlterTable
ALTER TABLE `follower` ALTER COLUMN `updateAt` DROP DEFAULT;

-- AlterTable
ALTER TABLE `following` ALTER COLUMN `updateAt` DROP DEFAULT;

-- AlterTable
ALTER TABLE `messagelist` ADD COLUMN `UserId` INTEGER NOT NULL DEFAULT 7;

-- AlterTable
ALTER TABLE `story` ALTER COLUMN `updateAt` DROP DEFAULT;

-- AlterTable
ALTER TABLE `user` ALTER COLUMN `updateAt` DROP DEFAULT;

-- AddForeignKey
ALTER TABLE `MessageList` ADD CONSTRAINT `MessageList_UserId_fkey` FOREIGN KEY (`UserId`) REFERENCES `User`(`Id`) ON DELETE RESTRICT ON UPDATE CASCADE;
