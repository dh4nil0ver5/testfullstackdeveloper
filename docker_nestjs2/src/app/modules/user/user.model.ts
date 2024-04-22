import * as mongoose from 'mongoose'; // Import mongoose library

import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import { Document, Schema as MongooseSchema } from 'mongoose';

@Schema()
export class User extends Document {
  @Prop()
  name: string;

  @Prop()
  email: string;

  @Prop()
  password: string;

  // Add more properties as needed
}

export const UserSchema = SchemaFactory.createForClass(User);

export interface UserDocument extends User, Document {}

export const UserModel = mongoose.model<UserDocument>('User', UserSchema);
