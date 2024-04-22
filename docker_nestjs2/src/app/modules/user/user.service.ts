import { Injectable } from '@nestjs/common';
import { UserRepository } from '../user/user.repository';
import { User } from './user.interface';

@Injectable()
export class UserService {
  constructor(private readonly userRepository: UserRepository) {}

  async getUserById(userId: string): Promise<User> {
    return this.userRepository.findUserById(userId);
  }

  async updateUser(userId: string, updateUserDto: any): Promise<User> {
    return this.userRepository.updateUser(userId, updateUserDto);
  }
}
