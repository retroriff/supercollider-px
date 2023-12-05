// Let's start with basic examples:

(
Px([
    (i: \BD),
    (i: \SN, dur: 2, off: 1),
]);
)

// Whis is the same as:

(i: \BD).px;
(i: \SN, dur: 2, off: 1).px(\sn);

// We can make it more wet:

(
Px([
    (i: \BD).reverb(0.2).wah(0.1),
    (i: \SN, dur: 2, off: 1).delay(0.2),
]);
)

// And create some random or Euclidian rhythms:

(
Px([
    (i: \BD).reverb(0.2).wah(0.1),
    (i: \SN, dur: 2, off: 1).delay(0.2),
    (i: \CH, dur: 1/4).beat,
    (i: \MA, dur: 1/4, euclid: [3, 5, 4]),
]);
)

// Or mute the rest while the soloists play:

(
Px([
    (i: \BD).reverb(0.2).wah(0.1),
    (i: \SN, dur: 2, off: 1).delay(0.3).solo,
    (i: \CH, dur: 1/4).beat.solo,
    (i: \MA, dur: 1/4).beat,
]);
)

// We can control the balance of hits and rests with weight

(
Px([
    (i: \BD).reverb(0.2).wah(0.1),
    (i: \SN, dur: 2, off: 1).delay(0.3),
    (i: \CH, dur: 1/4).beat.weight(0.1).solo,
    (i: \MA, dur: 1/4).beat.weight(0.2).solo,
]);
)

// And add random variations with another weight defined as a centil

(
Px([
    (i: \BD).reverb(0.2).wah(0.1),
    (i: \SN, dur: 2, off: 1).delay(0.3),
    (i: \CH, dur: 1/4).beat.weight(0.12).solo,
    (i: \MA, dur: 1/4).beat.weight(0.26).solo,
]);
)

// And shuffle a new beat

Px.shuffle;


// You can even fill the gaps of a pattern beat
(
Px([
    (i: \BD, dur: 1/2).beat.weight(0.5),
    (i: \SN, dur: 1/2).fill,
]);
)

// And set up a fill weight
(
Px([
    (i: \LC, dur: 1/4).beat.weight(0.42),
    (i: \LC, dur: 1/4, freq: 200).fill.weight(0.52),
    (i: \LC, dur: 1/4, freq: 160).fill.weight(0.63),
    (i: \LC, dur: 1/4, freq: 180).fill.weight(0.62),
    (i: \HT, dur: 1/4).fill.weight(0.8).reverb(0.1),
]).reverb(0.1).delay(0.1);
)

// But we can keep our favorite beats providing a seed number

(
Px([
    (i: \BD).reverb(0.2).wah(0.1),
    (i: \SN, dur: 2, off: 1).delay(0.3),
    (i: \CH, dur: 1/4).beat.weight(0.12).seed(250),
    (i: \MA, dur: 1/4).beat.weight(0.26),
]).shuffle;
)

// And check what's going on

Px.gui;
Px.trace;

// Fade in and fade out tracks

(
Px([
    (i: \BD).reverb(0.2).wah(0.1).out,
    (i: \SN, dur: 2, off: 1).delay(0.3),
    (i: \CH, dur: 1/4, pan: \rand).beat.weight(0.12).seed(250).in(20),
    (i: \MA, dur: 1/4).beat.weight(0.26),
]);
)

// Pan is also fun

(
Px([
    (i: \BD).reverb(0.2).wah(0.1),
    (i: \SN, dur: 2, off: 1).delay(0.3),
    (i: \CH, dur: 1/4, pan: \rand).beat.weight(0.12).seed(250),
    (i: \MA, dur: 1/4).beat.weight(0.26).rotate,
]).shuffle;
)

// And finalize the session with a fade out

Px.release;