import {Test} from '@nestjs/testing';
import {RegisterController} from '../register/register.controller';
import {expect} from 'chai';

describe('RegisterController', () => {
    const controller: RegisterController;

    beforeEach(() => {
        Test.createTestingModule({
            controllers: [
                RegisterController
            ]
        });
    });

    beforeEach(() => {
        controller = Test.get(RegisterController);
    });

    it('should exist', () => {
        expect(controller).to.exist;
    });
}
