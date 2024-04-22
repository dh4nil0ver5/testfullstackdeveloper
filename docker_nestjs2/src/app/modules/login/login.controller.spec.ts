import {Test} from '@nestjs/testing';
import {LoginController} from '../login/login.controller';
import {expect} from 'chai';

describe('LoginController', () => {
    const controller: LoginController;

    beforeEach(() => {
        Test.createTestingModule({
            controllers: [
                LoginController
            ]
        });
    });

    beforeEach(() => {
        controller = Test.get(LoginController);
    });

    it('should exist', () => {
        expect(controller).to.exist;
    });
}
