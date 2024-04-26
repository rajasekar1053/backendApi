/*
  Warnings:

  - Added the required column `brand` to the `Productdetail` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Productdetail" ADD COLUMN     "brand" TEXT NOT NULL;
