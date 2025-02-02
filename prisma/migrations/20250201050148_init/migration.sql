/*
  Warnings:

  - You are about to drop the column `UserID` on the `follower` table. All the data in the column will be lost.
  - You are about to drop the `following` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `UserId` to the `Follower` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `follower` DROP FOREIGN KEY `Follower_UserID_fkey`;

-- DropForeignKey
ALTER TABLE `following` DROP FOREIGN KEY `Following_UserID_fkey`;

-- DropIndex
DROP INDEX `Follower_FollowerId_key` ON `follower`;

-- DropIndex
DROP INDEX `Follower_UserID_fkey` ON `follower`;

-- AlterTable
ALTER TABLE `follower` DROP COLUMN `UserID`,
    ADD COLUMN `UserId` INTEGER NOT NULL,
    ALTER COLUMN `updateAt` DROP DEFAULT;

-- AlterTable
ALTER TABLE `story` ALTER COLUMN `updateAt` DROP DEFAULT;

-- AlterTable
ALTER TABLE `user` ALTER COLUMN `updateAt` DROP DEFAULT;

-- DropTable
DROP TABLE `following`;

-- AddForeignKey
ALTER TABLE `Follower` ADD CONSTRAINT `Follower_FollowerId_fkey` FOREIGN KEY (`FollowerId`) REFERENCES `User`(`Id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Follower` ADD CONSTRAINT `Follower_UserId_fkey` FOREIGN KEY (`UserId`) REFERENCES `User`(`Id`) ON DELETE RESTRICT ON UPDATE CASCADE;
