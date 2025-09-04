import {PrismaClient} from "@prisma/client";

const prisma = new PrismaClient();

async function main() {
    const result = await prisma.courses.update({
        where: {
            id: '57c52b22-145f-498b-a1e5-2f8a679bb178',
        },
        data: {
            duration: 200,
            name: "Curso de React Native - Avançado",
            description: "Curso muito bom ;))",
        },
    })

    console.log(result);
}

main();