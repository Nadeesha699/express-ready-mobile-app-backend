-- AlterTable
ALTER TABLE `story` MODIFY `LikeCount` INTEGER NULL;

-- AlterTable
ALTER TABLE `user` MODIFY `ProfileImage` LONGBLOB NULL,
    MODIFY `CoverImage` LONGBLOB NULL,
    MODIFY `Bio` VARCHAR(191) NULL;
