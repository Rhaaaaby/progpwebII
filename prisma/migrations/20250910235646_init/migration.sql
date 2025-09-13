/*
  Warnings:

  - Added the required column `fk_id_teacher` to the `courses` table without a default value. This is not possible if the table is not empty.

*/
-- CreateTable
CREATE TABLE "teacher" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL
);

-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_courses" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "duration" INTEGER NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "fk_id_teacher" TEXT NOT NULL,
    CONSTRAINT "courses_fk_id_teacher_fkey" FOREIGN KEY ("fk_id_teacher") REFERENCES "teacher" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_courses" ("created_at", "description", "duration", "id", "name") SELECT "created_at", "description", "duration", "id", "name" FROM "courses";
DROP TABLE "courses";
ALTER TABLE "new_courses" RENAME TO "courses";
CREATE UNIQUE INDEX "courses_name_key" ON "courses"("name");
CREATE UNIQUE INDEX "courses_fk_id_teacher_key" ON "courses"("fk_id_teacher");
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;

-- CreateIndex
CREATE UNIQUE INDEX "teacher_name_key" ON "teacher"("name");
