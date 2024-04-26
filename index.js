
const express =require ("express")
const Api=require("./router/index")


const app=express()
app.use(express.json())



app.use("/v1",Api)


app.listen(4000,()=>{
    console.log("server running")
})