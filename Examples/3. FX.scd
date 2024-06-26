// We can separately filter our patterns using these FX filters:
(
Px([
    (i: \bd).reverb(0.4).delay(0.2),
    (i: \sn, dur: 2, off: 1).reverb(0.3).delay(0.2),
    (i: \cy, dur: 1/4).beat.wah(0.6).reverb(0.3),
]);
)

// Add a random filter value:
(
Px([
    (i: \bd),
    (i: \sn, dur: 2, off: 1).reverb(\rand),
    (i: \cy, dur: 1/4).beat,
]);
)

// Or define the probability of each item with weight:
(
Px([
    (i: \bd),
    (i: \sn, dur: 2, off: 1).reverb([\wrand, 0.2, 0.8, 0.4]),
    (i: \cy, dur: 1/4).beat,
]);
)

// Or filter them all together with global FX:
(
Px([
    (i: \bd),
    (i: \sn, dur: 2, off: 1),
    (i: \cy, dur: 1/4).beat,
]).reverb(0.5);
)

// FX also can be loaded with the Nfx class:

Nfx(\px).reverb(1, 1, 1);
Nfx(\px).reverb(Nil);
Nfx(\px).reverb(0.5).hpf(0.5);
Nfx(\px).hpf(1, \wave);

// And kill'em all 🤘🏼:
Nfx(\px).clear

// Nfx can be used with any Ndef:

(
Ndef(\x, {
    SinOsc.ar([200, 201]);
}).play;
)

Nfx(\x).reverb(1, 1, 1);

// Global FX also can load a VST plugin:

(
Px([
    (i: \bd),
    (i: \sn, dur: 2, off: 1),
    (i: \cy, dur: 1/4).beat,
]).vst(0.4, "ValhallaFreqEcho");
)

// And we can control it using the Nfx class:

Nfx.vstController.set(1, 0.9);
Nfx.vstController.editor;
Nfx.vst(0.6);

// Save and load presets:

Nfx.vstReadProgram(\mdosc);
Nfx.vstWriteProgram;

// Stop it:
Px.stop;