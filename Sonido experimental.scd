// sintes audio
// 1 cargar sonidos en un buffer
// 2 colocar la ruta donde está tu sonido para que funcione


s.boot;
s.quit;


b = Buffer.read(s, "/Users/DELL/Downloads/Sonido experimental.wav");

(
SynthDef(\audio, {|rate=3, sp=0, at=0.001, sus=1, rel=0.001, pan=0, amp=1, out=0|
					var son, hpf, paneo, env;
					son=PlayBuf.ar(1, b.bufnum, rate, 1, sp * b.numFrames, 0);
					hpf=HPF.ar(son, 20);
					paneo=Pan2.ar(hpf, pan, amp);
					env=EnvGen.kr(Env.new([0, 1, 1, 0], [at, sus * b.duration, rel]), doneAction: 2);
					Out.ar(out, paneo * env);
				}).add;

);

Synth(\audio,[\rate,1, \sp, 0, \sus, 15]);




// Secuencias con sonidos

(
(
~sec1 = Pdef(\damp, Ppar([
	Pbind(\instrument, \tri,
	\dur, 1/2,
	\amp, Pseq([0.5,0,0,0.5,0.5,0,0.5,0,0,0.5,0.5,0.5,0.5,0.5,0.5,0],inf),
	),
	Pbind(\instrument, \sine,
		\dur,1/4,
	\amp, Pseq([5,0.5,0,0.5,0.5,0,0,0,0,0.5,0.5,0.5,0.5,0.5,0.5,0.5],inf),
	\out,10
	)
]))
);

(
~sec2 = Pdef(\cfb, Pbind(\room, \sine,
	\dur, Pseq([0.5, 0.125, 0.125, 0.5, Pn(0.25, 2)], inf),
	\amp, 0.08,
	\frec, Pseq([330, 430, 100, 400, 350, 800, 876, 234], inf),
	\rel, 0.1

))
);

(
~sec3 = Pdef(\bateria, Pbind(\instrument, \wnoise,
	\dur, 4,
	\amp, Pseq([0.01, 0.02, 0.15, 0.01, 0.03, 0.02, 0.5, 0.01, Pseq([0.1, 0.12, 0.01, 0.15], 2)], inf),
	\at, 1,
	\out, 10
))
);

(
~sec4 = Pdef(\room, Pbind(\instrument, \sine,
	\dur, 1/4,
	\amp, 0.2,
	\frec, 300,
	\at, 0.01,
	\out,10
))
);
);

~sec1.play.quant(4);
~sec2.play.quant(4);
~sec3.play.quant(4);
~sec4.play.quant(4);


~sec1.stop;
~sec2.stop;
~sec3.stop;
~sec4.stop;

s.quit;
