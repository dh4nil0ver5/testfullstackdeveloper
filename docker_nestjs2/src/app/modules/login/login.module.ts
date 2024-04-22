import { forwardRef, Module } from '@nestjs/common';
import { UserModule } from '../user/user.module';
import { LoginService } from './login.service';

@Module({
  imports: [forwardRef(() => UserModule)], // Use forwardRef for circular dependency
  providers: [LoginService],
})
export class LoginModule {}
