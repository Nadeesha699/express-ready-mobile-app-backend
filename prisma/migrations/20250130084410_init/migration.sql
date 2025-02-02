/*
  Warnings:

  - You are about to drop the column `AuthorName` on the `story` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE `follower` ALTER COLUMN `updateAt` DROP DEFAULT;

-- AlterTable
ALTER TABLE `following` ALTER COLUMN `updateAt` DROP DEFAULT;

-- AlterTable
ALTER TABLE `story` DROP COLUMN `AuthorName`,
    ALTER COLUMN `updateAt` DROP DEFAULT;

-- AlterTable
ALTER TABLE `user` ALTER COLUMN `updateAt` DROP DEFAULT;
