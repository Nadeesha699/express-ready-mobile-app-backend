/*
  Warnings:

  - You are about to drop the column `UserId` on the `message` table. All the data in the column will be lost.
  - Added the required column `RecieverId` to the `Message` table without a default value. This is not possible if the table is not empty.
  - Added the required column `SenderId` to the `Message` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `message` DROP FOREIGN KEY `Message_UserId_fkey`;

-- DropIndex
DROP INDEX `Message_UserId_fkey` ON `message`;

-- AlterTable
ALTER TABLE `follower` ALTER COLUMN `updateAt` DROP DEFAULT;

-- AlterTable
ALTER TABLE `following` ALTER COLUMN `updateAt` DROP DEFAULT;

-- AlterTable
ALTER TABLE `message` DROP COLUMN `UserId`,
    ADD COLUMN `RecieverId` INTEGER NOT NULL,
    ADD COLUMN `SenderId` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `story` ALTER COLUMN `updateAt` DROP DEFAULT;

-- AlterTable
ALTER TABLE `user` ALTER COLUMN `updateAt` DROP DEFAULT;

-- AddForeignKey
ALTER TABLE `Message` ADD CONSTRAINT `Message_SenderId_fkey` FOREIGN KEY (`SenderId`) REFERENCES `User`(`Id`) ON DELETE RESTRICT ON UPDATE CASCADE;
