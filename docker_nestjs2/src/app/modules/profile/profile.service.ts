import { Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose'; 
import { Model } from 'mongoose';
import { User } from '../user/user.interface';

@Injectable()
export class ProfileService {
  constructor(private userRepository: UserRepository) {}

  async getProfile(userId: string): Promise<User> {
    // Profile retrieval logic here
    const userProfile: User = await getUserProfileFromDatabase(userId);
    return userProfile;
  }

  async updateProfile(userId: string, updateUserDto: any): Promise<User> { 
    const updatedUser = await this.userRepository.updateUser(userId, updateUserDto);
    return updatedUser; // Return the updated user profile
  }
}

async function getUserProfileFromDatabase(userId: string): Promise<User> { 
  const user: User = await findUserById(userId);
  if (!user) {
    throw new Error('User not found');
  }
  return user;
}

async function findUserById(userId: string): Promise<User> {
  // Replace with actual database query
  return {
    id: userId,
    name: 'johndoe',
    email: 'john.doe@example.com',
    // Add other user properties as needed
  } as User;
}

@Injectable()
export class UserRepository {
  constructor(@InjectModel('User') private readonly userModel: Model<User>) {}

  async updateUser(userId: string, updateUserDto: any): Promise<User> {
    const updatedUser = await this.userModel.findByIdAndUpdate(userId, updateUserDto, { new: true }).exec();
    if (!updatedUser) {
      throw new Error('User not found');
    }
    return updatedUser;
  }
  
  async createUser(createUserDto: any): Promise<User> {
    const newUser = new this.userModel(createUserDto);
    await newUser.save();
    return newUser;
  }

}