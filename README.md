# ios-tracking-transparency

Capacitor plugin for ios tracking transparency

Tested with Capacitor v3

## Install

```bash
npm install ios-tracking-transparency
yarn add ios-tracking-transparency
npx cap sync
```

## API

<docgen-index>

- [ios-tracking-transparency](#ios-tracking-transparency)
	- [Install](#install)
	- [API](#api)
		- [requestTrackingAuthorization()](#requesttrackingauthorization)
		- [trackingAuthorizationStatus()](#trackingauthorizationstatus)
		- [Snippet](#snippet)
		- [Xcode settings Info.plist](#xcode-settings-infoplist)

</docgen-index>

```typescript

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
```
<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### requestTrackingAuthorization()

```typescript
	function requestTrackingAuthorization(): Promise<{
		status: AuthorizationStatus;
		code: number;
	}>;
```

--------------------


### trackingAuthorizationStatus()

```typescript
	function trackingAuthorizationStatus(): Promise<{
		status: AuthorizationStatus;
		code: number;
	}>;
```

--------------------

### Snippet

```ts
import { AppTrackingTransparency } from 'ios-tracking-transparency';

function App(): JSX.Element {
    useEffect(() => {
        try {
            if (Capacitor.getPlatform() === 'ios') {
                AppTrackingTransparency.trackingAuthorizationStatus()
                    .then(async (trackStat) => {
                        if (trackStat.status !== 'authorized') {
                            await AppTrackingTransparency.requestTrackingAuthorization();
                        }
                    })
                    .catch((e) => console.warn('IOS Error', e));
            }
        } catch (e) {
            console.warn('Authorization failed', e);
        }
    }, []);
    return (
        <Components/>
    );
}

```

--------------------

### Xcode settings Info.plist
	- Follow the guide below over Apple Dev to add the App Tracking key string in the info.plist file.
https://developer.apple.com/documentation/apptrackingtransparency

</docgen-api>
