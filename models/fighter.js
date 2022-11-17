const modelFighters = {
    queryGetChars: "SELECT * FROM Fighters",
    queryGetCharByID: `SELECT * FROM Fighters WHERE ID = ?`,
    queryDeleteCharByID: `UPDATE Fighters SET Active = 'N' WHERE ID = ?`,
    queryAddChar: `INSERT INTO Fighters (Name, Gender, FightingStyle, Ability, Active) VALUES (?, ?, ?, ?, ?)`,
    queryCharExists: `SELECT * FROM Fighters WHERE Name = ?`,
    queryUpdateCharByChar: `UPDATE Fighters SET Name = ?, Gender = ?, FightingStyle = ?, Ability = ? , Active = ? WHERE Name = ?`
}

module.exports = modelFighters