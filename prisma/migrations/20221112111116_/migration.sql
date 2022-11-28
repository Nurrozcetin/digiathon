/*
  Warnings:

  - The primary key for the `Signal` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- DropForeignKey
ALTER TABLE "Files" DROP CONSTRAINT "Files_signalId_fkey";

-- AlterTable
ALTER TABLE "Files" ALTER COLUMN "signalId" SET DATA TYPE TEXT;

-- AlterTable
ALTER TABLE "Signal" DROP CONSTRAINT "Signal_pkey",
ALTER COLUMN "id" SET DATA TYPE TEXT,
ADD CONSTRAINT "Signal_pkey" PRIMARY KEY ("id");

-- AddForeignKey
ALTER TABLE "Files" ADD CONSTRAINT "Files_signalId_fkey" FOREIGN KEY ("signalId") REFERENCES "Signal"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
