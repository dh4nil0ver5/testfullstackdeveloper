import { Injectable } from '@nestjs/common';
import { LoginUserDto } from './login-user.dto';
import { User } from '../user/user.interface';
import { UserRepository } from '../user/user.repository';

@Injectable()
export class LoginService {
  constructor(private userRepository: UserRepository) {}

  async login(loginUserDto: LoginUserDto): Promise<User> { 
    const user = await this.userRepository.validateUser(loginUserDto.username, loginUserDto.password);
    if (!user) {
      throw new Error('Invalid credentials');
    }
    return user;
  }
}
