# Module 3: Education

## Psychological Tactics of Social Engineering

%%HTML
<iframe width="560" height="315" src="https://youtu.be/KF7caRikqWU" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## How DeepFakes Are Created

### Autoencoders 
Deepfakes first gained attention using autoencoders. This method uses one shared encoder and separate decoders to map two different faces. After training, the encoder can compress one person’s facial features and the decoder can reconstruct them on another’s face (Chadha et al., 2021). This is how early celebrity face-swap videos were made. 

### Generative Adversarial Networks (GANs)
Goodfellow et al. (2014) introduced GANs, which quickly became the gold standard for creating hyper-realistic synthetic media. The generator creates fake images while the discriminator tries to detect them. Through repeated training, the generator improves until its fakes are indistinguishable. Kietzmann et al. (2020) note that GANs now produce full-body avatars and entire fake identities.

### Practical Pipelines
In practice, tools like DeepFaceLab automate the process. Users collect thousands of frames, align and crop them, train models (which can take hours or days), and then blend faces onto target videos (Perov et al., 2020). Wav2Lip improves lip syncing so fake mouths match speech (Kumar et al., 2020). Neural TTS can now clone voices from just a few seconds of audio.

### Accessibility
Nguyen et al. (2022) stress that the barrier to entry is falling. With online tutorials and pre-trained models, even people with little technical skill can create convincing deepfakes. This means political disinformation, scams, and harassment can spread more easily. 

For example, in 2019, criminals used AI-cloned voice to trick a UK energy firm executive into transferring €220,000, believing he was speaking to his boss (Stupp, 2019). This case shows how deepfake creation has already moved from experiments into real-world fraud. 