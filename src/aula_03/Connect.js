import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

async function main() {
    const result = await prisma.courses.create({
        data: {
            name: "Curso de Prisma",
            duration: 50,
            description: "Curso sobre Prisma ORM",
                teacher: {
                    connect: {
                        id: "bc3bda96-a728-4eec-a7d3-e353630b32f5",
                    },
                },
        },
    });

    console.log(result);
}

main();