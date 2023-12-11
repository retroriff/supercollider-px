// Let's start with basic examples:

(
Px([
    (i: \bd),
    (i: \sn, dur: 2, off: 1),
]);
)

// Which is the same as:

(i: \db).px;
(i: \sn, dur: 2, off: 1).px(\sn);

// We can make it more wet:

(
Px([
    (i: \bn).reverb(0.2).wah(0.1),
    (i: \sn, dur: 2, off: 1).delay(0.2),
]);
)

// And create some random or Euclidian rhythms:

(
Px([
    (i: \bd).reverb(0.2).wah(0.1),
    (i: \sn, dur: 2, off: 1).delay(0.2),
    (i: \ch, dur: 1/4).beat,
    (i: \ma, dur: 1/4, euclid: [3, 5, 4]),
]);
)

// Or mute the rest while the soloists play:

(
Px([
    (i: \bd).reverb(0.2).wah(0.1),
    (i: \sn, dur: 2, off: 1).delay(0.3).solo,
    (i: \ch, dur: 1/4).beat.solo,
    (i: \ma, dur: 1/4).beat,
]);
)

// We can control the balance of hits and rests with weight

(
Px([
    (i: \bd).reverb(0.2).wah(0.1),
    (i: \sn, dur: 2, off: 1).delay(0.3),
    (i: \ch, dur: 1/4).beat.weight(0.1).solo,
    (i: \ma, dur: 1/4).beat.weight(0.2).solo,
]);
)

// Add some rest time

(
Px([
    (i: \bd).reverb(0.2).wah(0.1),
    (i: \sn, dur: 2, off: 1).delay(0.3),
    (i: \ch, dur: 1/4).beat.weight(0.1),
    (i: \ma, dur: 1/4).beat.weight(0.2),
    (i: \cp, dur: 1/4).beat(rest: 4).weight(0.2),
]);
)

// And add random variations with another weight defined as a hundredth

(
Px([
    (i: \bd).reverb(0.2).wah(0.1),
    (i: \sn, dur: 2, off: 1).delay(0.3),
    (i: \ch, dur: 1/4).beat.weight(0.12).solo,
    (i: \ma, dur: 1/4).beat.weight(0.26).solo,
]);
)

// And shuffle a new beat

Px.shuffle;

0, 1, 1, 0
// You can even fill the gaps of a pattern beat
(
Px([
    (i: \bd, dur: 1/2).beat.weight(0.5),
    (i: \sn, dur: 1/2).fill,
]);
)

// And set up a fill weight
(
Px([
    (i: \lc, dur: 1/4, amp: 0.4).beat.weight(0.42),
    (i: \lc, dur: 1/4, freq: 200, amp: 0.5).fill.weight(0.52),
    (i: \lc, dur: 1/4, freq: 160).fill.weight(0.63),
    (i: \lc, dur: 1/4, freq: 180).fill.weight(0.62),
    (i: \ht, dur: 1/4).fill.weight(0.8),
]).reverb(0.1).delay(0.1);
)

// But we can keep our favorite beats providing a seed number

(
Px([
    (i: \bd).reverb(0.2).wah(0.1),
    (i: \sn, dur: 2, off: 1).delay(0.3),
    (i: \ch, dur: 1/4).beat.weight(0.12).seed(250),
    (i: \ma, dur: 1/4).beat.weight(0.26),
]).shuffle;
)

// And check what's going on

Px.gui;
Px.trace;

// Fade in and fade out tracks

(
Px([
    (i: \bd).reverb(0.2).wah(0.1).out,
    (i: \sn, dur: 2, off: 1).delay(0.3),
    (i: \ch, dur: 1/4, pan: \rand).beat.weight(0.12).seed(250).in(20),
    (i: \ma, dur: 1/4).beat.weight(0.26),
]);
)

// Pan is also fun

(
Px([
    (i: \bd).reverb(0.2).wah(0.1),
    (i: \sn, dur: 2, off: 1).delay(0.3),
    (i: \ch, dur: 1/4, pan: \rand).beat.weight(0.12).seed(250),
    (i: \ma, dur: 1/4).beat.weight(0.26).rotate,
]).shuffle;
)

// And finalize the session with a fade out

Px.release;