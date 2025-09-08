# Module 3: Education

## Psychological Tactics of Social Engineering
Social engineering attacks succeed not only through technical deception but also by exploiting predictable human psychology. Attackers carefully design messages to manipulate emotions and cognitive shortcuts, making people more likely to act without verifying the source. By leveraging tactics such as urgency, authority, and fear, adversaries bypass rational decision-making and trigger instinctive responses that benefit their schemes. Understanding these psychological levers is critical because even well-trained employees or students may ignore technical warning signs if the message provokes a strong emotional reaction.

<video width="640" height="360" controls>
      <source src="_static/tactics.mp4" type="video/mp4" align="center">
      Your browser does not support the video tag.
</video>

## How DeepFakes Are Created

**Autoencoders**
Deepfakes first gained attention using autoencoders. This method uses one shared encoder and separate decoders to map two different faces. After training, the encoder can compress one person’s facial features and the decoder can reconstruct them on another’s face (Chadha et al., 2021). This is how early celebrity face-swap videos were made. 

**Generative Adversarial Networks (GANs)**
Goodfellow et al. (2014) introduced GANs, which quickly became the gold standard for creating hyper-realistic synthetic media. The generator creates fake images while the discriminator tries to detect them. Through repeated training, the generator improves until its fakes are indistinguishable. Kietzmann et al. (2020) note that GANs now produce full-body avatars and entire fake identities.

**Practical Pipelines**
In practice, tools like DeepFaceLab automate the process. Users collect thousands of frames, align and crop them, train models (which can take hours or days), and then blend faces onto target videos (Perov et al., 2020). Wav2Lip improves lip syncing so fake mouths match speech (Kumar et al., 2020). Neural TTS can now clone voices from just a few seconds of audio.

**Accessibility**
Nguyen et al. (2022) stress that the barrier to entry is falling. With online tutorials and pre-trained models, even people with little technical skill can create convincing deepfakes. This means political disinformation, scams, and harassment can spread more easily. 

For example, in 2019, criminals used AI-cloned voice to trick a UK energy firm executive into transferring €220,000, believing he was speaking to his boss (Stupp, 2019). This case shows how deepfake creation has already moved from experiments into real-world fraud. 

## Common Artifacts and Anomalies

1. Physiological Cues
Li et al. (2018) discovered that early deepfakes blinked abnormally. Humans blink naturally at regular intervals, but fake videos often have long stretches without blinking. Head pose inconsistencies were also noted by Yang et al. (2019), where the face direction didn’t match the body. These are subtle cues but they are still useful for education.

2. Audio-Visual Inconsistencies
Agarwal et al. (2020) found mismatches between phonemes (sounds) and visemes (lip movements). For example, lips shaped for “o” while the sound was “ee.” Humans notice these subconsciously, even if they cannot describe what feels “off.”

3. Temporal Flicker and Texture Issues
Tolosana et al. (2020) describe how skin textures sometimes shimmer or shadows flicker across frames. Even when individual frames look real, across time the inconsistencies become noticeable.

4. Physiological Signals in Skin
Ciftci et al. (2020) measured blood flow signals using skin color changes. Real videos show subtle red-green shifts, while deepfakes often miss them.

5. More Trustworthy than Real
Nightingale and Farid (2022) showed that AI-generated faces were rated as more trustworthy than real faces. This is alarming: if humans not only fail to detect fakes but actually trust them more, then education cannot rely on “spotting tricks” alone. Instead, habits like source verification are essential.

## Training Activities

+ Spot-the-Fake Exercises - MIT’s __[“Detect Fakes”](https://detectfakes.kellogg.northwestern.edu/)__ study found that participants improved when given feedback after trying to classify images and videos (Vaccari & Chadwick, 2020). These activities don’t make people perfect detectors but they make them cautious.