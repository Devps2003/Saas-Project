/*
  Warnings:

  - You are about to drop the column `option_id` on the `Option` table. All the data in the column will be lost.
  - You are about to drop the column `balance_id` on the `Worker` table. All the data in the column will be lost.
  - You are about to drop the column `locked_amoubt` on the `Worker` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[worker_id,task_id]` on the table `Submission` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[address]` on the table `Worker` will be added. If there are existing duplicate values, this will fail.
  - Changed the type of `amount` on the `Submission` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `amount` on the `Task` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Added the required column `locked_amount` to the `Worker` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "TxnStatus" AS ENUM ('Processing', 'Success', 'Failure');

-- AlterTable
ALTER TABLE "Option" DROP COLUMN "option_id";

-- AlterTable
ALTER TABLE "Submission" DROP COLUMN "amount",
ADD COLUMN     "amount" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "Task" ADD COLUMN     "done" BOOLEAN NOT NULL DEFAULT false,
ALTER COLUMN "title" DROP NOT NULL,
ALTER COLUMN "title" SET DEFAULT 'Select the most clickable thumbnail',
DROP COLUMN "amount",
ADD COLUMN     "amount" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "Worker" DROP COLUMN "balance_id",
DROP COLUMN "locked_amoubt",
ADD COLUMN     "locked_amount" INTEGER NOT NULL;

-- CreateTable
CREATE TABLE "Payouts" (
    "id" SERIAL NOT NULL,
    "user_id" INTEGER NOT NULL,
    "amount" INTEGER NOT NULL,
    "signature" TEXT NOT NULL,
    "status" "TxnStatus" NOT NULL,

    CONSTRAINT "Payouts_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Submission_worker_id_task_id_key" ON "Submission"("worker_id", "task_id");

-- CreateIndex
CREATE UNIQUE INDEX "Worker_address_key" ON "Worker"("address");

-- AddForeignKey
ALTER TABLE "Payouts" ADD CONSTRAINT "Payouts_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
