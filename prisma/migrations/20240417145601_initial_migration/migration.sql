/*
  Warnings:

  - The primary key for the `Productdetail` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `Productdetail` table. All the data in the column will be lost.
  - You are about to drop the column `similarproductsId` on the `Productdetail` table. All the data in the column will be lost.
  - You are about to drop the `Products` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[product_Id]` on the table `Productdetail` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[product_Id]` on the table `Similarproducts` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `product_Id` to the `Productdetail` table without a default value. This is not possible if the table is not empty.
  - Added the required column `brand` to the `Similarproducts` table without a default value. This is not possible if the table is not empty.
  - Added the required column `product_Id` to the `Similarproducts` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Productdetail" DROP CONSTRAINT "Productdetail_similarproductsId_fkey";

-- DropForeignKey
ALTER TABLE "Products" DROP CONSTRAINT "Products_productdetailId_fkey";

-- DropIndex
DROP INDEX "Productdetail_similarproductsId_key";

-- AlterTable
ALTER TABLE "Productdetail" DROP CONSTRAINT "Productdetail_pkey",
DROP COLUMN "id",
DROP COLUMN "similarproductsId",
ADD COLUMN     "product_Id" INTEGER NOT NULL,
ADD COLUMN     "productsdetailId" SERIAL NOT NULL,
ADD CONSTRAINT "Productdetail_pkey" PRIMARY KEY ("productsdetailId");

-- AlterTable
ALTER TABLE "Similarproducts" ADD COLUMN     "brand" TEXT NOT NULL,
ADD COLUMN     "product_Id" INTEGER NOT NULL;

-- DropTable
DROP TABLE "Products";

-- CreateTable
CREATE TABLE "Product" (
    "product_Id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "brand" TEXT NOT NULL,
    "price" INTEGER NOT NULL,
    "image_url" TEXT NOT NULL,
    "rating" INTEGER NOT NULL,

    CONSTRAINT "Product_pkey" PRIMARY KEY ("product_Id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Productdetail_product_Id_key" ON "Productdetail"("product_Id");

-- CreateIndex
CREATE UNIQUE INDEX "Similarproducts_product_Id_key" ON "Similarproducts"("product_Id");

-- AddForeignKey
ALTER TABLE "Productdetail" ADD CONSTRAINT "Productdetail_product_Id_fkey" FOREIGN KEY ("product_Id") REFERENCES "Product"("product_Id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Similarproducts" ADD CONSTRAINT "Similarproducts_product_Id_fkey" FOREIGN KEY ("product_Id") REFERENCES "Productdetail"("productsdetailId") ON DELETE RESTRICT ON UPDATE CASCADE;
