export type AuthorizationStatus =
  | 'authorized'
  | 'denied'
  | 'notDetermined'
  | 'restricted'
  | 'null';
export interface AppTrackingTransparencyPlugin {
  requestTrackingAuthorization(): Promise<{
    status: AuthorizationStatus;
    code: number;
  }>;
  trackingAuthorizationStatus(): Promise<{
    status: AuthorizationStatus;
    code: number;
  }>;
}
