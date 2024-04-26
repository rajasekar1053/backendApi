/*
  Warnings:

  - A unique constraint covering the columns `[product_Id]` on the table `Product` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[productsdetailId]` on the table `Productdetail` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id]` on the table `Similarproducts` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[productsdetailId]` on the table `Similarproducts` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `productsdetailId` to the `Similarproducts` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Similarproducts" DROP CONSTRAINT "Similarproducts_product_Id_fkey";

-- AlterTable
ALTER TABLE "Similarproducts" ADD COLUMN     "productsdetailId" INTEGER NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "Product_product_Id_key" ON "Product"("product_Id");

-- CreateIndex
CREATE UNIQUE INDEX "Productdetail_productsdetailId_key" ON "Productdetail"("productsdetailId");

-- CreateIndex
CREATE UNIQUE INDEX "Similarproducts_id_key" ON "Similarproducts"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Similarproducts_productsdetailId_key" ON "Similarproducts"("productsdetailId");

-- AddForeignKey
ALTER TABLE "Similarproducts" ADD CONSTRAINT "Similarproducts_productsdetailId_fkey" FOREIGN KEY ("productsdetailId") REFERENCES "Productdetail"("product_Id") ON DELETE RESTRICT ON UPDATE CASCADE;
