const { Router } = require("express");
const {addChar,getChars, getCharByID, deleteCharByID, updateCharByChar } = require("../controllers/fighter");
const router = Router();

//http://localhost:4000/api/v1/messages
//http://localhost:4000/api/v1/fighters

/// GET ///
router.get("/getChars", getChars);
router.get("/getChars/ID/:ID", getCharByID)
/// DELETE ///
router.delete("/deleteChars/ID/:ID", deleteCharByID)
/// PATCH ///
router.put("/updateChars", updateCharByChar)
/// POST ///
router.post("/addChar", addChar);
module.exports = router;
