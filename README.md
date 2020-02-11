# naruhodo
Client for WaniKani API.  Kanji should just make sense


## Setup

The API needs a token to authenticate with the WaniKani service.  This can be generated in the [personal access tokens](https://www.wanikani.com/settings/personal_access_tokens) section of the WaniKani site.

Naruhodo expects a configuration file to be bundled framework (this may change later.. but is fine for now).  It should be located here:

`Configuration/naruhodo_configuration.json`

There is an example file that can be edited, just rename that bad boy from ye ol'shell like so:

```sh
mv Configuration/naruhodo_configuration_example.json Configuration/naruhodo_configuration.json
```

Open the Xcode project and command+U your way to happiness