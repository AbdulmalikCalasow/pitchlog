import "server-only";
import { Pool } from "pg";

// Reuse the pool during development reloads.
const globalForDb = globalThis as typeof globalThis & {
  pitchlogPool?: Pool;
};

// Read the connection settings from the environment.
export const pool = globalForDb.pitchlogPool ?? new Pool();

if (process.env.NODE_ENV !== "production") {
  globalForDb.pitchlogPool = pool;
}