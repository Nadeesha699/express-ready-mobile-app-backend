-- DropForeignKey
ALTER TABLE `comment` DROP FOREIGN KEY `Comment_SenderId_fkey`;

-- DropForeignKey
ALTER TABLE `comment` DROP FOREIGN KEY `Comment_StoryId_fkey`;

-- DropForeignKey
ALTER TABLE `conversation` DROP FOREIGN KEY `Conversation_CreaterId_fkey`;

-- DropForeignKey
ALTER TABLE `conversation` DROP FOREIGN KEY `Conversation_ForId_fkey`;

-- DropForeignKey
ALTER TABLE `follower` DROP FOREIGN KEY `Follower_FollowerId_fkey`;

-- DropForeignKey
ALTER TABLE `follower` DROP FOREIGN KEY `Follower_UserId_fkey`;

-- DropForeignKey
ALTER TABLE `like` DROP FOREIGN KEY `Like_SenderId_fkey`;

-- DropForeignKey
ALTER TABLE `like` DROP FOREIGN KEY `Like_StoryId_fkey`;

-- DropForeignKey
ALTER TABLE `message` DROP FOREIGN KEY `Message_ChatId_fkey`;

-- DropForeignKey
ALTER TABLE `message` DROP FOREIGN KEY `Message_UserId_fkey`;

-- DropForeignKey
ALTER TABLE `notification` DROP FOREIGN KEY `Notification_CommentId_fkey`;

-- DropForeignKey
ALTER TABLE `notification` DROP FOREIGN KEY `Notification_SenderId_fkey`;

-- DropForeignKey
ALTER TABLE `notification` DROP FOREIGN KEY `Notification_StoryId_fkey`;

-- DropForeignKey
ALTER TABLE `story` DROP FOREIGN KEY `Story_AuthorId_fkey`;

-- DropIndex
DROP INDEX `Comment_SenderId_fkey` ON `comment`;

-- DropIndex
DROP INDEX `Comment_StoryId_fkey` ON `comment`;

-- DropIndex
DROP INDEX `Conversation_CreaterId_fkey` ON `conversation`;

-- DropIndex
DROP INDEX `Conversation_ForId_fkey` ON `conversation`;

-- DropIndex
DROP INDEX `Follower_FollowerId_fkey` ON `follower`;

-- DropIndex
DROP INDEX `Follower_UserId_fkey` ON `follower`;

-- DropIndex
DROP INDEX `Like_SenderId_fkey` ON `like`;

-- DropIndex
DROP INDEX `Like_StoryId_fkey` ON `like`;

-- DropIndex
DROP INDEX `Message_ChatId_fkey` ON `message`;

-- DropIndex
DROP INDEX `Message_UserId_fkey` ON `message`;

-- DropIndex
DROP INDEX `Notification_CommentId_fkey` ON `notification`;

-- DropIndex
DROP INDEX `Notification_SenderId_fkey` ON `notification`;

-- DropIndex
DROP INDEX `Notification_StoryId_fkey` ON `notification`;

-- DropIndex
DROP INDEX `Story_AuthorId_fkey` ON `story`;

-- AlterTable
ALTER TABLE `follower` ALTER COLUMN `updateAt` DROP DEFAULT;

-- AlterTable
ALTER TABLE `story` ALTER COLUMN `updateAt` DROP DEFAULT;

-- AlterTable
ALTER TABLE `user` ALTER COLUMN `updateAt` DROP DEFAULT;

-- AddForeignKey
ALTER TABLE `Story` ADD CONSTRAINT `Story_AuthorId_fkey` FOREIGN KEY (`AuthorId`) REFERENCES `User`(`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Follower` ADD CONSTRAINT `Follower_FollowerId_fkey` FOREIGN KEY (`FollowerId`) REFERENCES `User`(`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Follower` ADD CONSTRAINT `Follower_UserId_fkey` FOREIGN KEY (`UserId`) REFERENCES `User`(`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Message` ADD CONSTRAINT `Message_ChatId_fkey` FOREIGN KEY (`ChatId`) REFERENCES `Conversation`(`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Message` ADD CONSTRAINT `Message_UserId_fkey` FOREIGN KEY (`UserId`) REFERENCES `User`(`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Conversation` ADD CONSTRAINT `Conversation_CreaterId_fkey` FOREIGN KEY (`CreaterId`) REFERENCES `User`(`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Conversation` ADD CONSTRAINT `Conversation_ForId_fkey` FOREIGN KEY (`ForId`) REFERENCES `User`(`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Notification` ADD CONSTRAINT `Notification_SenderId_fkey` FOREIGN KEY (`SenderId`) REFERENCES `User`(`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Notification` ADD CONSTRAINT `Notification_StoryId_fkey` FOREIGN KEY (`StoryId`) REFERENCES `Story`(`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Notification` ADD CONSTRAINT `Notification_CommentId_fkey` FOREIGN KEY (`CommentId`) REFERENCES `Comment`(`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Comment` ADD CONSTRAINT `Comment_StoryId_fkey` FOREIGN KEY (`StoryId`) REFERENCES `Story`(`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Comment` ADD CONSTRAINT `Comment_SenderId_fkey` FOREIGN KEY (`SenderId`) REFERENCES `User`(`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Like` ADD CONSTRAINT `Like_SenderId_fkey` FOREIGN KEY (`SenderId`) REFERENCES `User`(`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Like` ADD CONSTRAINT `Like_StoryId_fkey` FOREIGN KEY (`StoryId`) REFERENCES `Story`(`Id`) ON DELETE CASCADE ON UPDATE CASCADE;
