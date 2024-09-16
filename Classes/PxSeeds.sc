// TODO: Multiname globalSeed

+Px {
    *seed { |seed|
        if (seed == Nil) {
            globalSeed = nil;
            this.prPrint("🗑️ Global seed deleted");
        } {
            globalSeed = seed;
        };

        seeds = Dictionary.new;
        this.prSend(lastPatterns[lastName], lastName);
    }

    *shuffle { |name|
        name = name ?? lastName;

        if (globalSeed.notNil)
        { this.prPrint("🔴 Global seed must be Nil") };

        seeds = Dictionary.new;
        this.prSend(lastPatterns[name], name);
    }

    *prGenerateRandNumber { |id|
        var newSeed;
        thisThread.randSeed = (Date.getDate.rawSeconds % 1000).rand.asInteger;
        newSeed = 1000.rand;
        this.prPrint("🎲 Seed:".scatArgs(id, "->", newSeed));
        ^newSeed;
    }

    *prGetPatternSeed { |pattern, name|
        var id = pattern[\id].asSymbol;
        var seed;

        if (pattern[\seed].notNil)
        { ^pattern[\seed] };

        if (globalSeed.notNil) {
            seeds.add(id -> globalSeed);
            ^globalSeed;
        };

        if (seeds[id].isNil)
        { seed = this.prGenerateRandNumber(id) }
        { seed = seeds[id] };

        seeds.add(id -> seed);
        ^seeds[id];

    }
}
