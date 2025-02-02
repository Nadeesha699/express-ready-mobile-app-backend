-- DropForeignKey
ALTER TABLE `follower` DROP FOREIGN KEY `Follower_UserID_fkey`;

-- DropForeignKey
ALTER TABLE `following` DROP FOREIGN KEY `Following_UserID_fkey`;

-- DropForeignKey
ALTER TABLE `story` DROP FOREIGN KEY `Story_AuthorId_fkey`;

-- DropIndex
DROP INDEX `Follower_UserID_key` ON `follower`;

-- DropIndex
DROP INDEX `Following_UserID_key` ON `following`;

-- DropIndex
DROP INDEX `Story_AuthorId_key` ON `story`;

-- AddForeignKey
ALTER TABLE `Story` ADD CONSTRAINT `Story_AuthorId_fkey` FOREIGN KEY (`AuthorId`) REFERENCES `User`(`Id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Follower` ADD CONSTRAINT `Follower_UserID_fkey` FOREIGN KEY (`UserID`) REFERENCES `User`(`Id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Following` ADD CONSTRAINT `Following_UserID_fkey` FOREIGN KEY (`UserID`) REFERENCES `User`(`Id`) ON DELETE RESTRICT ON UPDATE CASCADE;
