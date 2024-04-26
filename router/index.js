const express =require ("express")
const appRouter =express.Router();
const { PrismaClient } = require("@prisma/client");
const { 
   productscontroller, 
   productsdetailcontroller,
   similalproductscontroller,
   createproducts,
   createproductsdetail,
   createsimilarproduct,
   deleteproduct,
   deleteproductdetail,
   deletesimilardetail 
      } = require("../controller/productscontroller/productscontroller");

appRouter.use(express.json())
const Prisma =new PrismaClient()


appRouter.get( "/products",productscontroller)
 appRouter.get("/products/:id",productsdetailcontroller)
 appRouter.get("/similarproductsdetail/:id",similalproductscontroller)
  appRouter.post("/products", createproducts)
 appRouter.post("/productsdetail",createproductsdetail)
 appRouter.post("/similarproductsdetail",createsimilarproduct)
 appRouter.delete("/deleteproducts/:id",deleteproduct)
 appRouter.delete("/deleteproductdetails/:id",deleteproductdetail)
 appRouter.delete("/deletesimilarproducts/:id",deletesimilardetail)

module.exports= appRouter;