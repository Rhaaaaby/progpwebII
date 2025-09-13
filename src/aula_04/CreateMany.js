import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

async function main() {
  const result = await prisma.authors.create({
    data: {
      name: "Testando",
      books: {
        create: [
          { name: "Império do Vampiro" },
          { name: "Império dos Malditos" },
          {name: "Império da Alvorada"}
        ]
      }
    }
  });
  console.log(result);
}

main();