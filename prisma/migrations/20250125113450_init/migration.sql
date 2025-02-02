-- CreateTable
CREATE TABLE `Follower` (
    `Id` INTEGER NOT NULL AUTO_INCREMENT,
    `UserID` INTEGER NOT NULL,
    `FollowerId` INTEGER NOT NULL,

    UNIQUE INDEX `Follower_UserID_key`(`UserID`),
    PRIMARY KEY (`Id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Following` (
    `Id` INTEGER NOT NULL AUTO_INCREMENT,
    `UserID` INTEGER NOT NULL,
    `FollowingId` INTEGER NOT NULL,

    UNIQUE INDEX `Following_UserID_key`(`UserID`),
    PRIMARY KEY (`Id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Follower` ADD CONSTRAINT `Follower_UserID_fkey` FOREIGN KEY (`UserID`) REFERENCES `User`(`Id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Following` ADD CONSTRAINT `Following_UserID_fkey` FOREIGN KEY (`UserID`) REFERENCES `User`(`Id`) ON DELETE RESTRICT ON UPDATE CASCADE;
