import { PrismaClient } from "@prisma/client";
import express from "express";
import multer from "multer";
import cors from "cors";
import path from "path";
import { Buffer } from "buffer";
import { v4 as uuidv4 } from "uuid";
import { allowedNodeEnvironmentFlags } from "process";

const app = express();
const port = 3001;
const prisma = new PrismaClient();

app.use(cors());
app.use(express.json());
app.use(express.static("upload"));

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, path.join(__dirname, "uploads"));
  },
  filename: function (req, file, cb) {
    const mimeExtension: { [key: string]: string } = {
      "image/jpeg": ".jpeg",
      "image/png": ".png",
    };
    cb(null, file.fieldname + "-" + Date.now() + mimeExtension[file.mimetype]);
  },
});

const upload = multer({ storage: storage });

app.post("/signal", upload.single("upload"), async (req, res) => {
  const postSignal = await prisma.signal.create({
    data: {
      product_Type: req.body.product_Type,
      receiver_Address: req.body.receiver_Address,
      product_Amount: parseInt(req.body.product_Amount),
      product_Exp_Date: req.body.product_Exp_Date,
      product_Ubb: req.body.product_Ubb,
      product_Lot: req.body.product_Lot,
      File: {
        create: {
          filename: (req.file as any).filename,
        },
      },
    },
  });
  res.send(postSignal.id);
});

app.get("/signal", async (req, res) => {
  const getSignal = await prisma.signal.findMany();
  res.json(getSignal);
});

app.get("/signal/:id", async (req, res) => {
  const getSignall = await prisma.signal.findUnique({
    where: {
      id: req.params.id,
    },
  });
  res.json(getSignall);
});

app.listen(port, () => {
  console.log(`App listening on port 3001`);
});
