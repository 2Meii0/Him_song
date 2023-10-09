// 1 abre el documento sintes y declara el código
// 2 declara los sintes de efectos
// 3 delcra los sintes de ondas y cambia el parámetro \out entre los valores 9, 11, 13, 15, 17

// --- Sintes de efectos
(
~rev=Synth(\rev); // 9 Reverberación
~dly=Synth(\dly); // 11 Delay
~lpf=Synth(\lpf); // 13 Low Pass Filter
~hpf=Synth(\hpf); // 15 High Pass Filter
~bpf=Synth(\bpf); // 17 Band Pass Filter
);

// --- Sintes de ondas

Synth(\sine, [\out, 0]);
Synth(\tri, [\out, 0]);
Synth(\pulse, [\out, 0]);
Synth(\saw, [\out, 0]);
Synth(\wnoise, [\out, 0]);
