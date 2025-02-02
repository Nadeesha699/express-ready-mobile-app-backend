/*
  Warnings:

  - Added the required column `Category` to the `Story` table without a default value. This is not possible if the table is not empty.
  - Added the required column `LikeCount` to the `Story` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `story` ADD COLUMN `Category` VARCHAR(191) NOT NULL,
    ADD COLUMN `LikeCount` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `user` ADD COLUMN `Bio` VARCHAR(191) NOT NULL DEFAULT 'Hello world';
