export interface AppTrackingTransparencyPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
