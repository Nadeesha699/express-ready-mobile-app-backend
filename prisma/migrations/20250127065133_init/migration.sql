-- AlterTable
ALTER TABLE `follower` ALTER COLUMN `updateAt` DROP DEFAULT;

-- AlterTable
ALTER TABLE `following` ALTER COLUMN `updateAt` DROP DEFAULT;

-- AlterTable
ALTER TABLE `messagelist` ALTER COLUMN `UserId` DROP DEFAULT;

-- AlterTable
ALTER TABLE `story` ALTER COLUMN `updateAt` DROP DEFAULT;

-- AlterTable
ALTER TABLE `user` ALTER COLUMN `updateAt` DROP DEFAULT;
