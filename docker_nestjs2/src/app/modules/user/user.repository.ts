import { Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { User } from '../user/user.interface';
import { UserDocument, UserModel } from './user.model'; // Import UserModel
import { CreateUserDto } from '../register/create-user.dto';

@Injectable()
export class UserRepository {
  constructor(@InjectModel('User') private readonly userModel: Model<UserDocument>) {} 
  
async findUserById(userId: string): Promise<User | null> {
  const user = await this.userModel.findById(userId).exec();
  return user ? user.toObject() as User : null;
}

async updateUser(userId: string, updateUserDto: any): Promise<User | null> { 
  const user = await this.userModel.findByIdAndUpdate(userId, updateUserDto, { new: true }).exec();
  return user ? user.toObject() as User : null;
}

async validateUser(username: string, password: string): Promise<User | null> { 
  const user = await this.userModel.findOne({ username, password }).exec();
  return user ? user.toObject() as User : null;
}

async createUser(createUserDto: CreateUserDto): Promise<User> {
  const newUser = new this.userModel(createUserDto);
  await newUser.save();
  return newUser.toObject() as User;
}

}
