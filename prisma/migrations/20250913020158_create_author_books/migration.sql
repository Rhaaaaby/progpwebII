-- CreateTable
CREATE TABLE "Authors" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Books" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "author_id" TEXT NOT NULL,
    CONSTRAINT "Books_author_id_fkey" FOREIGN KEY ("author_id") REFERENCES "Authors" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "Authors_name_key" ON "Authors"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Books_name_key" ON "Books"("name");
