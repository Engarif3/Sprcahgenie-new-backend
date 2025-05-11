// types/express.d.ts
import { JwtPayload } from "jsonwebtoken";

declare module "express-serve-static-core" {
  interface Request {
    user?: JwtPayload & { userId?: string }; // adjust based on your token payload
  }
}
