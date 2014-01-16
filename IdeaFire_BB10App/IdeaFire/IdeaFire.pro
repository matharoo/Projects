APP_NAME = IdeaFire

CONFIG += qt warn_on cascades10
LIBS   += -lOpenAL -lalut -lasound -lbb -lbbsystem -lpps -lnfc -lnfc_bps -lbbdata
LIBS += -lbbcascadesmultimedia
include(config.pri)

device {
    CONFIG(debug, debug|release) {
        # Device-Debug custom configuration
    }

    CONFIG(release, debug|release) {
        # Device-Release custom configuration
    }
}

simulator {
    CONFIG(debug, debug|release) {
        # Simulator-Debug custom configuration
    }
}
