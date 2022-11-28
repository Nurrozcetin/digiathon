/*
  Warnings:

  - You are about to drop the column `productExpDate` on the `Signal` table. All the data in the column will be lost.
  - Added the required column `product_Exp_Date` to the `Signal` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Signal" DROP COLUMN "productExpDate",
ADD COLUMN     "product_Exp_Date" TEXT NOT NULL;
