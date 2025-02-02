-- AlterTable
ALTER TABLE `follower` ALTER COLUMN `updateAt` DROP DEFAULT;

-- AlterTable
ALTER TABLE `following` ALTER COLUMN `updateAt` DROP DEFAULT;

-- AlterTable
ALTER TABLE `story` ALTER COLUMN `updateAt` DROP DEFAULT;

-- AlterTable
ALTER TABLE `user` ALTER COLUMN `updateAt` DROP DEFAULT;

-- CreateTable
CREATE TABLE `Notification` (
    `Id` INTEGER NOT NULL AUTO_INCREMENT,
    `SenderId` INTEGER NOT NULL,
    `NotificationType` VARCHAR(191) NOT NULL,
    `UploadStoryName` VARCHAR(191) NULL,
    `UploadStoryCover` LONGBLOB NULL,
    `SenderComent` TEXT NULL,
    `createAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updateAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`Id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Comment` (
    `Id` INTEGER NOT NULL AUTO_INCREMENT,
    `Comment` TEXT NOT NULL,
    `SenderId` INTEGER NOT NULL,
    `createAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updateAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`Id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Notification` ADD CONSTRAINT `Notification_SenderId_fkey` FOREIGN KEY (`SenderId`) REFERENCES `User`(`Id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Comment` ADD CONSTRAINT `Comment_SenderId_fkey` FOREIGN KEY (`SenderId`) REFERENCES `User`(`Id`) ON DELETE RESTRICT ON UPDATE CASCADE;
