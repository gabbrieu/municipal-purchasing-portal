import { Roles } from '@modules/auth/roles.decorator';
import { JwtAuthGuard } from '@modules/auth/services/auth.guard';
import { RolesGuard } from '@modules/auth/services/roles.guard';
import { ERoles, IReqUser } from '@modules/auth/types';
import {
    Body,
    Controller,
    Get,
    Param,
    Post,
    Request,
    UseGuards,
} from '@nestjs/common';
import { CreateUserDto } from '../../application/dto/create-user.dto';
import { LoginDto, LoginOutputDto } from '../../application/dto/login.dto';
import { CreateUserUseCase } from '../../application/usecases/create-user.usecase';
import { FindOneUserUseCase } from '../../application/usecases/find-one-user.usecase';
import { LoginUseCase } from '../../application/usecases/login.usecase';
import { IUserWithoutPassword } from '../../domain/entities/user.entity';

@Controller('users')
@Roles(ERoles.USER)
export class UserController {
    constructor(
        private readonly createUserUseCase: CreateUserUseCase,
        private readonly loginUseCase: LoginUseCase,
        private readonly findOneUserUseCase: FindOneUserUseCase
    ) {}

    @Post()
    @UseGuards(JwtAuthGuard, RolesGuard)
    @Roles(ERoles.ADMIN)
    async create(@Body() body: CreateUserDto): Promise<IUserWithoutPassword> {
        return await this.createUserUseCase.execute(body);
    }

    @Post('login')
    async login(@Body() body: LoginDto): Promise<LoginOutputDto> {
        return await this.loginUseCase.execute(body);
    }

    @Get('profile')
    @UseGuards(JwtAuthGuard, RolesGuard)
    getProfile(@Request() req): IReqUser {
        return req.user as IReqUser;
    }

    @Get(':id')
    @UseGuards(JwtAuthGuard, RolesGuard)
    async findOneById(@Param('id') id: string): Promise<IUserWithoutPassword> {
        return await this.findOneUserUseCase.execute({ id: +id });
    }
}