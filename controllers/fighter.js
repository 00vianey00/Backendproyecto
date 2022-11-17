const { request, response } = require("express");
const { query } = require("../db/connection");
const pool = require("../db/connection");
const modelFighters = require("../models/fighter");

const getChars = async (req = request, res = response) => {
    let conn;

    try {
        conn = await pool.getConnection()//Realizamos la conexión

        const char = await conn.query(modelFighters.queryGetChars, (error) => {if(error) throw error})
        //console.log(plant)
        if (!char) {//En caso de no haber resgistros lo informamos
            res.status(404).json({msg: "No Existe Peleador Registrado"})
            return
        }
        res.json({char})//Se manda la lista de usuarios
    }
    catch (error){
        console.log(error)
        res.status(500).json({msg: error})//informamos el error
    }finally{
        if (conn) conn.end()//Termina la conexión
    }

}
const getCharByID = async (req = request, res = response) => {
    const {ID} = req.params//URI params
    let conn;

    try {
        conn = await pool.getConnection()//Realizamos la conexión
        //generamos la consulta
        const [char] = await conn.query(modelFighters.queryGetCharByID,[ID], (error) => {if(error) throw error})

        if (!char) {//En caso de no haber resgistros lo informamos
            res.status(404).json({msg: `No Existe Peleador Registrado Con El ID ${ID}`})
            return
        }

        res.json({char})//Se manda la lista de usuarios
    }
    catch (error){
        console.log(error)
        res.status(500).json({msg: error})//informamos el error
    }finally{
        if (conn) conn.end()//Termina la conexión
    }
}
const addChar = async (req = request, res = response) => {
    const {Name, Gender, FightingStyle, Ability, Active} = req.body//URI params

    if(!Name || !Gender || !FightingStyle || !Ability || !Active){
        res.status(400).json({msg: "Faltan Datos"})
        return
    }

    let conn;

    try {

        conn = await pool.getConnection()//Realizamos la conexión
        //generamos la consulta
        const [charExist] = await conn.query(modelFighters.queryCharExists, [Name], (error) =>{if(error) throw error})
        
        if (charExist) {
            res.json({msg:`El Peleador '${Name}' ya se encuentra registrado.`})
            return
        }
        //generamos la consulta
        const result = await conn.query( modelFighters.queryAddChar, [Name, Gender, FightingStyle, Ability, Active], (error) => {if(error) throw error})

        if (result.affectedRows === 0) {//En caso de no haber resgistros lo informamos
            res.status(404).json({msg: `No se pudo agregar el Peleador ${Name}`})
            return
        }
        res.json({msg:`Se agregó satisfactoriamente el Peleador con Nombre ${Name}`})//Se manda la lista de usuarios
        
    } catch (error){
        console.log(error)
        res.status(500).json({msg: error})//informamos el error
    }finally{
        if (conn) conn.end()//Termina la conexión
    }

}
const deleteCharByID = async (req = request, res = response) => {
    const {ID} = req.params//URI params
    let conn;

    try {
        conn = await pool.getConnection()//Realizamos la conexión
        //generamos la consulta
        const result = await conn.query(modelFighters.queryDeleteCharByID,[ID], (error) => {if(error) throw error})

        console.log(result.affectedRows)
        if (result.affectedRows === 0) {//En caso de no haber resgistros lo informamos
            res.status(404).json({msg: `No Existe Peleador Registrado Con el ID ${ID}`})
            return
        }

        res.json({msg:`Se Eliminó Satisfactoriamente El Peleador Con ID ${ID}`})//Se manda la lista de usuarios
    }
    catch (error){
        console.log(error)
        res.status(500).json({msg: error})//informamos el error
    }finally{
        if (conn) conn.end()//Termina la conexión
    }
}
const updateCharByChar = async (req = request, res = response) => {
    const {Name, Gender, FightingStyle, Ability, Active} = req.body//URI params
    if(!Name || !Gender || !FightingStyle || !Ability || !Active){
        res.status(400).json({msg: "Faltan Datos"})
        return
    }
    let conn;
    try {
        conn = await pool.getConnection()//Realizamos la conexión

        const [charExist] = await conn.query(modelFighters.queryCharExists, [Name])
        
        //generamos la consulta
            if(!charExist){ 
                res.json({msg:`El Peleador ${Name} No Existe.`})
                return
            }
            const result = await conn.query(modelFighters.queryUpdateCharByChar, [Name, Gender, FightingStyle, Ability, Active, Name], (error) => {if (error) throw error})

            if (result.affectedRows === 0) {//En caso de no haber resgistros lo informamos
                res.status(404).json({msg: `No Se Pudo Actualizar El Peleador Con El Nombre ${Name}`})
                return
            }
            res.json({msg:`Se Actualizó Satisfactoriamente El Peleador ${Name}`})//Se manda la lista de usuarios
    }catch (error){
        console.log(error)
        res.status(500).json({msg: error})//informamos el error
    }finally{
        if (conn) conn.end()//Termina la conexión
    }
}

module.exports = {addChar, getChars, getCharByID, deleteCharByID, updateCharByChar}