import { forwardRef, Module } from '@nestjs/common';  
import { UserRepository } from './user.repository';
import { UserModel } from './user.model'; // Import UserModel 
import { RegisterModule } from '../register/register.module';
import { LoginModule } from '../login/login.module';

@Module({
  imports: [forwardRef(() => RegisterModule), forwardRef(() => LoginModule)],
  providers: [UserRepository, UserModel], 
  exports: [UserRepository], // Export UserRepository for use in other modules
})
export class UserModule {}

