-- CreateEnum
CREATE TYPE "Gender" AS ENUM ('MASCULINO', 'FEMININO');

-- CreateEnum
CREATE TYPE "Race" AS ENUM ('AMARELA', 'BRANCA', 'PARDA', 'INDIGENA', 'PRETA');

-- CreateEnum
CREATE TYPE "EducationLevel" AS ENUM ('ANALFABETO', 'ENSINO_FUNDAMENTAL_COMPLETO', 'ENSINO_MEDIO_INCOMPLETO', 'ENSINO_MEDIO_COMPLETO', 'GRADUACAO_INCOMPLETO', 'GRADUACAO_COMPLETO', 'POS_GRADUACAO_INCOMPLETO', 'POS_GRADUACAO_COMPLETO', 'MESTRADO_INCOMPLETO', 'MESTRADO_COMPLETO', 'DOUTORADO_INCOMPLETO', 'DOUTORADO_COMPLETO', 'POS_DOUTORADO_INCOMPLETO', 'POS_DOUTORADO_COMPLETO');

-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "email" VARCHAR(80) NOT NULL,
    "password" VARCHAR(300) NOT NULL,
    "birthDate" DATE NOT NULL,
    "cpf" VARCHAR(11) NOT NULL,
    "cellphone" VARCHAR(11) NOT NULL,
    "telephone" VARCHAR(10),
    "sex" "Gender" NOT NULL,
    "race" "Race" NOT NULL,
    "address" VARCHAR(255) NOT NULL,
    "addressNumber" SMALLINT NOT NULL,
    "complement" VARCHAR(255),
    "city" VARCHAR(100) NOT NULL,
    "state" CHAR(2) NOT NULL,
    "postalCode" VARCHAR(8) NOT NULL,
    "username" VARCHAR(30) NOT NULL,
    "jobTitle" VARCHAR(100) NOT NULL,
    "educationLevel" "EducationLevel" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "User_username_key" ON "User"("username");
