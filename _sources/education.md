# Module 3: Education

## Psychological Tactics of Social Engineering
Social engineering attacks succeed not only through technical deception but also by exploiting predictable human psychology. Attackers carefully design messages to manipulate emotions and cognitive shortcuts, making people more likely to act without verifying the source. By leveraging tactics such as urgency, authority, and fear, adversaries bypass rational decision-making and trigger instinctive responses that benefit their schemes. Understanding these psychological levers is critical because even well-trained employees or students may ignore technical warning signs if the message provokes a strong emotional reaction.

<video width="640" height="360" controls>
      <source src="_static/tactics.mp4" type="video/mp4" align="center">
      Your browser does not support the video tag.
</video>

## How DeepFakes Are Created

**Autoencoders** <br>
Deepfakes first gained attention using autoencoders. This method uses one shared encoder and separate decoders to map two different faces. After training, the encoder can compress one person’s facial features and the decoder can reconstruct them on another’s face (Chadha et al., 2021). This is how early celebrity face-swap videos were made. 

**Generative Adversarial Networks (GANs)** <br>
Goodfellow et al. (2014) introduced GANs, which quickly became the gold standard for creating hyper-realistic synthetic media. The generator creates fake images while the discriminator tries to detect them. Through repeated training, the generator improves until its fakes are indistinguishable. Kietzmann et al. (2020) note that GANs now produce full-body avatars and entire fake identities.

**Practical Pipelines** <br>
In practice, tools like DeepFaceLab automate the process. Users collect thousands of frames, align and crop them, train models (which can take hours or days), and then blend faces onto target videos (Perov et al., 2020). Wav2Lip improves lip syncing so fake mouths match speech (Kumar et al., 2020). Neural TTS can now clone voices from just a few seconds of audio.

**Accessibility**<br>
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

+ **Spot-the-Fake Exercises** - MIT’s __[“Detect Fakes”](https://detectfakes.kellogg.northwestern.edu/)__ study found that participants improved when given feedback after trying to classify images and videos (Vaccari & Chadwick, 2020). These activities don’t make people perfect detectors but they make them cautious.
+ **Phishing Email Simulations** - Organizations increasingly run phishing simulations. Dawkins and Jacobs (2021) developed the NIST __[“Phish Scam”](https://nvlpubs.nist.gov/nistpubs/TechnicalNotes/NIST.TN.2276.pdf)__ which helps rate difficulty of phishing messages. This way, companies can start with obvious fakes and gradually increase realism.
+ **Prebunking Games** - Roozenbeek and van der Linden (2019) created the __[“Bad News game”](https://www.getbadnews.com/en)__ game, where players take the role of a fake news creator. By learning the tactics, they build immunity. Harmony Square, another game, applies similar logic to political manipulation. Studies show prebunking builds durable resistance.
+ **Reflection Prompts** - Bada et al. (2019) argue that reflection is crucial. After exercises, employees should consider what they noticed and what they missed. Reflection cements learning better than rote training.
+ **Case Example** - Google and Jigsaw launched prebunking YouTube ads in 2022 across Eastern Europe to combat disinformation about refugees. Early results showed reduced susceptibility to manipulation even weeks later (Roozenbeek et al., 2022). This proves training can scale beyond classrooms.

## Media Literacy Studies 

![SIFT Method](_static/sift.png)
**SIFT Method**<br> 
Caulfield (2019) developed SIFT (Stop, Investigate the source, Find better coverage, Trace claims). It encourages users to pause and check context instead of reading suspicious content in isolation. <br>

![Lateral Reading](_static/lateral.png)<br>
**Lateral Reading**<br> 
Wineburg and McGrew (2019) demonstrated that fact-checkers opened new tabs and researched sources, while students stayed trapped on the original page. Teaching lateral reading has shown consistent improvements in credibility judgments.

![Population Studies](_static/population.jpg)
**Population Studies**<br> 
McGrew et al. (2018) found that most high school students struggled with online reasoning tasks. Many couldn’t tell the difference between news and sponsored content. This suggests that media literacy must be part of curricula, not optional.

![Inoculation Effects](_static/misinfo.jpg)
**Inoculation Effects**<br> 
McGrew et al. (2018) found that most high school students struggled with online reasoning tasks. Many couldn’t tell the difference between news and sponsored content. This suggests that media literacy must be part of curricula, not optional.


## Existing Awareness Programs

1. Traditional CBTs - Parsons et al. (2017) noted that many organizations still rely on annual computer-based training. These are often treated as compliance exercises and rarely change behavior. 
2. Embedded Phishing Exercises - Canfield et al. (2016) found that simulated phishing with immediate feedback was far more effective. Employees learned from mistakes faster. 
3. NIST Guidance - NIST SP 800-50 (2003) emphasizes continuous awareness, tailored to roles. For example, finance staff should receive phishing awareness on invoice fraud, while IT staff may need training on credential harvesting. 
4. Measuring Success - Jampen et al. (2020) recommend measuring not just click rates but also reporting behavior. A workplace where employees frequently report suspicious emails is more resilient than one with low reporting but low clicks. 
5. Case Example - Capital One’s 2019 breach occurred due to a misconfigured firewall, but phishing simulations afterward improved employee reporting by 60% (Caponi, 2020). This shows training can adapt even after incidents.

Education remains the most sustainable defense against social engineering and deepfakes. The psychological triggers of urgency, authority, and fear explain why technical defenses alone are not enough. Deepfake creation has evolved from autoencoders to GANs and voice-cloning, making manipulation more realistic. Yet deepfakes still leave traces like mismatched lip movements, abnormal blinking, and skin inconsistencies. 

Hands-on training, whether spot-the-fake games, phishing simulations, or prebunking activities, helps learners develop skepticism. Media literacy skills like SIFT and lateral reading give people processes for verification, while inoculation strategies build resilience over time. Awareness programs succeed when they are continuous, role-specific, and measured by meaningful metrics like reporting. 

In the end, no training makes humans perfect detectors, but education helps them pause, doubt, and verify. That habit is the most powerful defense against manipulation in the digital age
