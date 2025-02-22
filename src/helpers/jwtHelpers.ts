import jwt, { JwtPayload, Secret } from "jsonwebtoken";
import crypto from "crypto";

const generateToken = (payload: any, secret: Secret, expiresIn: string) => {
  const token = jwt.sign(payload, secret, {
    algorithm: "HS256",
    expiresIn,
  });

  return token;
};

const verifyToken = (token: string, secret: Secret) => {
  return jwt.verify(token, secret) as JwtPayload;
};

// =========================

export const generateVerificationToken = (): string => {
  return crypto.randomBytes(32).toString("hex"); // Generates a random 32-byte token
};

// export const generateVerificationToken = (): string => {
//     return jwt.sign({}, config.jwt.jwt_secret as Secret, { expiresIn: "15m" });
//   };

// =========================

export const jwtHelpers = {
  generateToken,
  verifyToken,
};
