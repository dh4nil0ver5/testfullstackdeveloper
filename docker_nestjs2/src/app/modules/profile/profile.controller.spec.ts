import {Test} from '@nestjs/testing';
import {ProfileController} from './profile.controller';
import {expect} from 'chai';

describe('ProfileController', () => {
    const controller: ProfileController;

    beforeEach(() => {
        Test.createTestingModule({
            controllers: [
                ProfileController
            ]
        });
    });

    beforeEach(() => {
        controller = Test.get(ProfileController);
    });

    it('should exist', () => {
        expect(controller).to.exist;
    });
}
