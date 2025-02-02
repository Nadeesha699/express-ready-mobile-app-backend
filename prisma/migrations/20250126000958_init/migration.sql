-- CreateTable
CREATE TABLE `Message` (
    `Id` INTEGER NOT NULL AUTO_INCREMENT,
    `UserId` INTEGER NOT NULL,
    `ReceiverId` INTEGER NOT NULL,

    PRIMARY KEY (`Id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `MessageList` (
    `Id` INTEGER NOT NULL AUTO_INCREMENT,
    `MessageId` INTEGER NOT NULL,
    `UserMessage` TEXT NOT NULL,

    PRIMARY KEY (`Id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Message` ADD CONSTRAINT `Message_UserId_fkey` FOREIGN KEY (`UserId`) REFERENCES `User`(`Id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `MessageList` ADD CONSTRAINT `MessageList_MessageId_fkey` FOREIGN KEY (`MessageId`) REFERENCES `Message`(`Id`) ON DELETE RESTRICT ON UPDATE CASCADE;
