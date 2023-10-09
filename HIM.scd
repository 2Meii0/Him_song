//Mi pieza de sonido
TempoClock.tempo=80/60;

(
~seq1=Pdef(\mel, Pbind(
	\instrument, \pulse,
	\dur, 0.3,
	\amp, 0.2,
	\pan, Pseq([-0.5,1],inf),
	\midinote, Pseq([60,44,80,Pn(65,2)],inf),
	\out, 11
	)
))
);

(
~seq1=Pdef(\mel, Pbind(
	\instrument, \pulse,
	\dur, 0.3,
	\amp, 0.2,
	\midinote, Pseq([60,44,12,Pn(65,2)],inf),
	\out, 11
	)
))
);

~dly.set(\dt, 0.25, \dct, 3);

~seq1.play.quant(4);

//Para parar la melodia
~seq1.stop;

(
~sonido1=Pdef();
);

~sonido.play.quant(4);
~sonido.stop;