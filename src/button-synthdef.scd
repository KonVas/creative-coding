
SynthDef(\noise, { | amp = 0.2 | Out.ar(0, PinkNoise.ar(amp)); }).add;
a = Synth(\noise);
a.set(\amp, 0.3); // set the argument while the Synth is playing
a.free;

(
var w, butt, sound; // w is not an interpreter's var -- it's a local var
// define a window
w = Window.new("first piece", Rect(0, 0, 200, 200));
w.front; // make the window
// make the button
butt = Button(w, Rect(0, 0, 100, 100));
//define the states of the button
butt.states = [["start"], ["stop"]];

butt.action = { | v |
    if (v.value == 1)  {
      sound = Synth('noise2');
      w.onClose({
                  { butt.value = 0 }.defer;
      });
    }{
      sound.free;
    }
};
)
