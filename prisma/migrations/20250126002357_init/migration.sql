/*
  Warnings:

  - You are about to drop the `messagelist` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `messagelist` DROP FOREIGN KEY `MessageList_MessageId_fkey`;

-- AlterTable
ALTER TABLE `message` ADD COLUMN `UserMessage` TEXT NOT NULL DEFAULT 'Hello';

-- DropTable
DROP TABLE `messagelist`;
