import { pool } from "../../../lib/db";
// Return the leagues saved in PostgreSQL.
export async function GET() {
  try {
    const result = await pool.query(
      "SELECT id, name FROM leagues ORDER BY id"
    );

    return Response.json(result.rows);
  } catch (error) {
    console.error("Could not load leagues:", error);

    return Response.json(
      { error: "Could not load leagues." },
      { status: 500 }
    );
  }
}