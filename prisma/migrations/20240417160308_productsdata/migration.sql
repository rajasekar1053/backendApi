/*
  Warnings:

  - Added the required column `rating` to the `Productdetail` table without a default value. This is not possible if the table is not empty.
  - Added the required column `rating` to the `Similarproducts` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Productdetail" ADD COLUMN     "rating" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "Similarproducts" ADD COLUMN     "rating" TEXT NOT NULL;
