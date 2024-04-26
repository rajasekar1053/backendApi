const { PrismaClient } = require("@prisma/client")
const Prisma =new PrismaClient()

exports.productscontroller = async(req,res)=>{
    const productData = await Prisma.product.findMany()
    
    res.json({products:productData})
 console.log({productData})
 
 }
 exports.productsdetailcontroller=async (req,res)=>{
    const {id} =req.params;
   
    try{
       const productdetaildata= await Prisma.productdetail.findUnique({
          where: { product_Id : parseInt(id) },
          include:{
             Similarproducts:true,
          }
       
       });
       if(!productdetaildata){
          throw new AppError("similarproducts not found",404)
       }else{
          return res.json({...productdetaildata});
       }
    }catch(error){
       throw {error};
 
    }
 
    
    
 }
 exports.similalproductscontroller=async (req,res)=>{
    const {id} =req.params;
   
    const productdetaildata= await Prisma.similarproducts.findUnique({
       where: { product_Id : parseInt(id) },
    
    })
 
    res.json({...productdetaildata})
    
 }
 exports.createproducts=async (req,res)=>{
    const data =req.body
    const{title,brand,price,image_url,rating}=data
     const newData= await Prisma.product.create({
       data:{
          title,
          brand,
          price,
          image_url,
          rating
       }
    
    })
    res.send({product:newData})
 }
 exports.createproductsdetail=async(req,res)=>{
    const data =req.body
    const{title,brand,price,image_url,rating,description,total_reviews,availability,style,product_Id,}=data;
const newproduct= await Prisma.productdetail.create({
       data:{
          title,
          brand,
          price,
          image_url,
          rating,
          description,
          total_reviews,
          availability,
          style,
          product_Id
       }
    
    }) 
    console.log({newproduct})
    res.send({newproduct})
 
    
 }
 exports.createsimilarproduct=async(req,res)=>{
    const data =req.body
 
    const{title,brand,price,image_url,rating,description,total_reviews,availability,style,product_Id,productsdetailId}=data;
   
     const newproductA= await Prisma.similarproducts.create({
       data:{
          title,
          brand,
          price,
          image_url,
          rating,
          description,
          total_reviews,
          availability,
          style,
          product_Id,
          productsdetailId
       }
    
    })
     
    res.send(newproductA)
 
    
 }
 exports.deleteproduct=async (req,res)=>{
    const {id} =req.params;
    console.log(id)
   
    const productdata1= await Prisma.product.delete({
       where: {  product_Id : parseInt(id) }
    })
 if(!productdata1){
    throw new AppError("product is not found",404)
 
 }else{
    return res.json({...productdata1})
 }
 
   
    
 }
 exports.deleteproductdetail=async (req,res)=>{
    const {id} =req.params;
    console.log(id)
   
    const productdata1= await Prisma.productdetail.delete({
       where: {  product_Id : parseInt(id) }
    })
 
 
    res.json({...productdata1})
    
 }
 exports.deletesimilardetail=async (req,res)=>{
    const {id} =req.params;
    console.log(id)
   
    const productdata2= await Prisma.similarproducts.delete({
       where: {  product_Id : parseInt(id) }
    })
 
 
    res.json({...productdata2})
    
 }