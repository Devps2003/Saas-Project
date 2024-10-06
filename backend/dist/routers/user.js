"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const client_1 = require("@prisma/client");
const express_1 = require("express");
const client_s3_1 = require("@aws-sdk/client-s3");
const s3_request_presigner_1 = require("@aws-sdk/s3-request-presigner");
const jsonwebtoken_1 = __importDefault(require("jsonwebtoken"));
const middleware_1 = require("../middleware");
const __1 = require("..");
const router = (0, express_1.Router)();
const s3Client = new client_s3_1.S3Client({
    credentials: {
        accessKeyId: "",
        secretAccessKey: ""
    }
});
const prismaClient = new client_1.PrismaClient();
// we will use signin using crypto wallet
router.get("/presignedUrl", middleware_1.authMiddleware, (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    //@ts-ignore
    const userId = req.userId;
    const command = new client_s3_1.PutObjectAclCommand({
        Bucket: "saas-proj-05",
        Key: `${userId}/${Math.random()}/image.jpg`,
    });
    const presignedUrl = yield (0, s3_request_presigner_1.getSignedUrl)(s3Client, command, {
        expiresIn: 3600
    });
    console.log(presignedUrl);
}));
router.post("/signin", (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const hardcoded = "";
    const existUser = yield prismaClient.user.findFirst({
        where: {
            address: hardcoded
        }
    });
    if (existUser) {
        const token = jsonwebtoken_1.default.sign({
            userId: existUser.id
        }, __1.JWT_SECRET);
        res.json({
            token
        });
    }
    else {
        const user = yield prismaClient.user.create({
            data: {
                address: hardcoded,
            }
        });
        const token = jsonwebtoken_1.default.sign({
            userId: user.id
        }, __1.JWT_SECRET);
        res.json({
            token
        });
    }
}));
exports.default = router;
