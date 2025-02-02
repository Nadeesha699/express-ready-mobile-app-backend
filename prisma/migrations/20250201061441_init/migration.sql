-- AlterTable
ALTER TABLE `follower` ADD COLUMN `FriendStatus` BOOLEAN NOT NULL DEFAULT false,
    ALTER COLUMN `updateAt` DROP DEFAULT;

-- AlterTable
ALTER TABLE `story` ALTER COLUMN `updateAt` DROP DEFAULT;

-- AlterTable
ALTER TABLE `user` ALTER COLUMN `updateAt` DROP DEFAULT;
