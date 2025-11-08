// import the promisePool from the database utility module
import promisePool from "path/to/database.js";

/**
 * Deletes a user and all associated data from the database.
 * @param {number} userId
 * @returns {Promise<{message: string}>}
 */
const deleteExample = async (userId) => {
  // get a connection object from the pool
  const connection = await promisePool.getConnection();

  try {
    await connection.beginTransaction();
    await connection.execute("DELETE FROM table1 WHERE user_id = ?;", [userId]);
    await connection.execute("DELETE FROM table2 WHERE user_id = ?;", [userId]);
    const sql = connection.format("DELETE FROM Users WHERE user_id = ?", [
      userId,
    ]);

    const [result] = await connection.execute(sql);

    if (result.affectedRows === 0) {
      return {
        message: "User not deleted",
      };
    }

    // if no errors, commit the transaction (save changes)
    await connection.commit();

    return {
      message: "User deleted",
    };
  } catch (error) {
    // if error, rollback transaction (undo changes)
    await connection.rollback();
    console.error("error", error.message);
    return {
      message: error.message,
    };
  } finally {
    connection.release();
  }
};
