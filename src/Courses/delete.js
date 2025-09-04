import {PrismaClient} from "@prisma/client";

const prisma = new PrismaClient();

async function main() {
    const result = await prisma.courses.delete({
        where: {
            id: "57c52b22-145f-498b-a1e5-2f8a679bb178",
        },
    })
    console.log(result);
}

main();