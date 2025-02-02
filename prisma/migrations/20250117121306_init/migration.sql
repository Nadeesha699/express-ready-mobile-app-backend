/*
  Warnings:

  - You are about to drop the column `UserId` on the `story` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[AuthorId]` on the table `Story` will be added. If there are existing duplicate values, this will fail.

*/
-- DropForeignKey
ALTER TABLE `story` DROP FOREIGN KEY `Story_UserId_fkey`;

-- DropIndex
DROP INDEX `Story_UserId_key` ON `story`;

-- AlterTable
ALTER TABLE `story` DROP COLUMN `UserId`,
    ADD COLUMN `AuthorId` INTEGER NOT NULL DEFAULT 7,
    ADD COLUMN `AuthorName` VARCHAR(191) NOT NULL DEFAULT 'Nadeesha';

-- CreateIndex
CREATE UNIQUE INDEX `Story_AuthorId_key` ON `Story`(`AuthorId`);

-- AddForeignKey
ALTER TABLE `Story` ADD CONSTRAINT `Story_AuthorId_fkey` FOREIGN KEY (`AuthorId`) REFERENCES `User`(`Id`) ON DELETE RESTRICT ON UPDATE CASCADE;
