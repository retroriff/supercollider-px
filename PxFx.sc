+Px {
    *prCreatePatternFx { |pattern|
        if (pattern[\fx].notNil and: { pattern[\fx].size > 0 }) {
            pattern[\fx].do { |fx, i|
                if (SynthDescLib.global[fx[1]].notNil) {
                    if (fx == \reverb)
                    { fx = fx ++ [\decayTime, pattern[\decayTime] ?? 7, \cleanupDelay, 1] };
                    pattern[\fx][i] = fx;
                    pattern = pattern ++ [\fxOrder, (1..pattern[\fx].size)];
                }
            }
        };
        ^pattern;
    }

    *prCreatePbindFx { |pattern|
        ^PbindFx(pattern.asPairs, *pattern[\fx]);
    }

    *prHasFX { |pattern|
        if (pattern[\fxOrder].notNil)
        { ^true };
    }
}

+Event {
    prFx { |fx, mix, args|
        ^this.[\fx] = this.[\fx] ++ [[\fx, fx, \mix, this.prCreatePatternKey(mix)] ++ args];
    }

    delay { |mix, args|
        this.prFx(\delay, mix, args);
    }

    reverb { |mix, args|
        this.prFx(\reverb, mix, args);
    }

    wah { |mix, args|
        this.prFx(\wah, mix, args);
    }
}