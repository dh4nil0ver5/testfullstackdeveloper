import { Injectable } from '@nestjs/common';
import { CreateUserDto } from './create-user.dto';
import { User } from '../user/user.interface';
import { UserRepository } from '../user/user.repository';

@Injectable()
export class RegisterService {
  constructor(private userRepository: UserRepository) {}

  async register(createUserDto: CreateUserDto): Promise<User> {
    // Implement your logic to create a new user
    const newUser = await this.userRepository.createUser(createUserDto);
    return newUser; // Return the newly created user
  }
}
