-- CreateTable
CREATE TABLE "Products" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "brand" TEXT NOT NULL,
    "price" INTEGER NOT NULL,
    "image_url" TEXT NOT NULL,
    "rating" INTEGER NOT NULL,
    "productdetailId" INTEGER,

    CONSTRAINT "Products_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Productdetail" (
    "id" SERIAL NOT NULL,
    "title" VARCHAR(255) NOT NULL,
    "image_url" TEXT NOT NULL,
    "style" TEXT NOT NULL,
    "price" INTEGER NOT NULL,
    "description" TEXT NOT NULL,
    "total_reviews" INTEGER NOT NULL,
    "availability" TEXT NOT NULL,
    "similarproductsId" INTEGER,

    CONSTRAINT "Productdetail_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Similarproducts" (
    "id" SERIAL NOT NULL,
    "title" VARCHAR(255) NOT NULL,
    "image_url" TEXT NOT NULL,
    "style" TEXT NOT NULL,
    "price" INTEGER NOT NULL,
    "description" TEXT NOT NULL,
    "total_reviews" INTEGER NOT NULL,
    "availability" TEXT NOT NULL,

    CONSTRAINT "Similarproducts_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Products_productdetailId_key" ON "Products"("productdetailId");

-- CreateIndex
CREATE UNIQUE INDEX "Productdetail_similarproductsId_key" ON "Productdetail"("similarproductsId");

-- AddForeignKey
ALTER TABLE "Products" ADD CONSTRAINT "Products_productdetailId_fkey" FOREIGN KEY ("productdetailId") REFERENCES "Productdetail"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Productdetail" ADD CONSTRAINT "Productdetail_similarproductsId_fkey" FOREIGN KEY ("similarproductsId") REFERENCES "Similarproducts"("id") ON DELETE SET NULL ON UPDATE CASCADE;
