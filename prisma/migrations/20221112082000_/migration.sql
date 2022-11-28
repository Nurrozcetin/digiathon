-- CreateTable
CREATE TABLE "Signal" (
    "id" INTEGER NOT NULL,
    "product_Type" TEXT NOT NULL,
    "receiver_Address" TEXT NOT NULL,
    "product_Amount" INTEGER NOT NULL,
    "productExpDate" TEXT NOT NULL,
    "product_Ubb" TEXT NOT NULL,
    "product_Lot" TEXT NOT NULL,

    CONSTRAINT "Signal_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Files" (
    "id" SERIAL NOT NULL,
    "filename" TEXT NOT NULL,

    CONSTRAINT "Files_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Signal_id_key" ON "Signal"("id");

-- AddForeignKey
ALTER TABLE "Files" ADD CONSTRAINT "Files_id_fkey" FOREIGN KEY ("id") REFERENCES "Signal"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
