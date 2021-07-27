import { WebPlugin } from '@capacitor/core';

import type { AppTrackingTransparencyPlugin } from './definitions';

export class AppTrackingTransparencyWeb
  extends WebPlugin
  implements AppTrackingTransparencyPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
