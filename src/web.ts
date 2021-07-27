import { WebPlugin } from '@capacitor/core';

import type {
  AppTrackingTransparencyPlugin,
  AuthorizationStatus,
} from './definitions';

export class AppTrackingTransparencyWeb
  extends WebPlugin
  implements AppTrackingTransparencyPlugin {
  async requestTrackingAuthorization(): Promise<{
    status: AuthorizationStatus;
    code: number;
  }> {
    return {
      status: 'null',
      code: 999,
    };
  }
  async trackingAuthorizationStatus(): Promise<{
    status: AuthorizationStatus;
    code: number;
  }> {
    return { status: 'null', code: 999 };
  }
}
