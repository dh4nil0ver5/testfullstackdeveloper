import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { LoginService } from './app/modules/login/login.service';
import { LoginController } from './app/modules/login/login.controller'; 
import { UserModule } from './app/modules/user/user.module';
import { LoginModule } from './app/modules/login/login.module';

@Module({
  imports: [UserModule, LoginModule],
  controllers: [AppController, LoginController],
  providers: [AppService, LoginService],
})
export class AppModule {}
