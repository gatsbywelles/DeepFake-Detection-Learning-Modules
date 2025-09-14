# Module 4: Detection

## Deepfake Detection Technologies and Classifiers

Deepfakes can be very convincing, and sometimes the human eye alone cannot detect them. Researchers use machine learning and forensic techniques to identify hidden clues known as artifacts. These artifacts are divided into two groups: spatial artifacts (visible in a single frame, such as an image) and temporal artifacts (visible across multiple frames, such as a video). There are also more general approaches that do not rely on specific artifacts.

### Spatial Artifacts (Single-Frame Clues)

+ **Behavior** <br>
Deepfakes sometimes fail to capture natural personality traits. By analyzing the emotions expressed in both audio and video, systems can compare them to real footage of the target.

+ **Physiology** <br>
Synthetic videos often lack real biological signals. For example, blinking patterns may look unnatural or skin may not show a realistic pulse. These signs can be used to detect fake content.

+ **Synchronization** <br>
Speech and mouth movements must match. Deepfakes often fail to generate correct mouth shapes for certain sounds such as B, P, and M, creating mismatches between audio and video.

+ **Coherence** <br>
Real videos are usually smooth and consistent. In contrast, some deepfakes flicker or jitter between frames. Models like LSTMs can track face movements frame by frame and detect when the predicted sequence does not match natural behavior.


### Undirected Approaches
These methods do not target specific artifacts. Instead, they use deep neural networks as general classifiers to learn features that separate real content from fake.

+ **Classification** <br>
Traditional forensic tools often struggle with compressed images, but CNN-based models perform better. Some advanced approaches include:
    + Hierarchical Memory Networks (HMN): These analyze faces over multiple steps, storing past encodings and using memory to improve predictions.
    + Ensemble Models: Multiple deepfake detectors can be combined, and their outputs passed into a meta-classifier, producing stronger results than a single model.
    + 3D CNNs (spatio-temporal networks): These analyze multiple frames at once, making them well-suited for video detection.
The drawback of classification methods is that they can sometimes be fooled by adversarial attacks designed to bypass detection.

+ **Anomaly Detection** <br>
Anomaly detection systems are trained on real data, then identify fakes by spotting outliers. These methods can even detect deepfakes created with new techniques that were not part of the training data. For example, they may measure the coverage of a face recognition network to detect when patterns in a video fall outside the range of natural signals.


### Metadata Analysis
Metadata refers to the hidden information stored inside a digital file. For images and videos, metadata can include details such as file size, creation date, last modified date, and even the camera model used. Examining these properties is an important step in digital forensics because irregularities in metadata may indicate tampering or manipulation. For example, if an image claims to be taken years ago but the “creation date” in its metadata is recent, this raises suspicion. Metadata analysis therefore acts as an additional layer of verification when investigating possible deepfakes.

Researchers have also developed frameworks for metadata forensics to systematize this process (Royan et al., 2024). In practice, the process begins with preprocessing images so they are standardized. This step ensures that variations such as rotated or resized images do not interfere with analysis. Once standardized, metadata is extracted using specialized tools and then processed by machine learning algorithms to detect unusual patterns or generate a report.

**Tools commonly used (Royan et al., 2024):**
1. ExifTool – extracts image attributes such as file size, creation and modification dates, and camera information.
2. Online and offline analyzers – in the study, 10 online and 5 offline tools were tested to check and interpret metadata for signs of manipulation.


### Content Fingerprinting

Content fingerprinting—often implemented via perceptual hashing—derives a compact, unique identifier directly from the digital signal. Rather than matching exact bytes, a perceptual-hash–based fingerprint encodes modality-specific features of the content so that near-duplicates map to nearby binary codes while unrelated items remain far apart (Chen et al., 2024).

+ **Text** <br>
For text media, the pipeline tokenizes the document into small chunks, ranks or selects salient segments, and aggregates these into a fixed-length fingerprint; subsequent comparisons test the query fingerprint against a reference set to assess authenticity or similarity (Chen et al., 2024).

+ **Images** <br>
Image fingerprinting first analyzes discriminative visual features and then encodes them into a binary hash. Zhao and Yuan (2020) propose a scheme that integrates 3D color structure with brightness variation, yielding faster computation and a shorter hash length while maintaining strong identification performance for authenticity checks.

+ **Video** <br>
Video fingerprints compress cues from color, texture, and motion into a compact binary hash that summarizes temporal dynamics as well as per-frame appearance, enabling efficient large-scale matching and tamper detection (Chen et al., 2024).

+ **Audio** <br>
Audio fingerprints capture unique spectral–temporal patterns. One approach extracts both spectral and temporal features to build a detection-oriented hash (Kaushal Kishor et al., 2023). Another focuses on peak picking in the Mel-spectrogram, which improves robustness to background noise and operates on a 2D time–frequency representation independent of absolute amplitude (Gupta et al., 2021).

Across modalities, perceptual-hash fingerprints provide compact, comparable representations derived from the content itself. Designs trade off speed, hash length, and discriminability, but all follow the same principle: extract stable features, encode them into a binary identifier, and compare those identifiers to verify authenticity or detect near-duplicates (Chen et al., 2024; Zhao & Yuan, 2020; Kaushal Kishor et al., 2023; Gupta et al., 2021).

## Vendor vs. Open-source Tools (pros/cons)

### Vendor Tools 

+ **Sensity AI** <br>
Pros – high level of detection (90%+), has multi model detection (video, audio, images), real time monitoring, forensic level reporting, API integration for enterprise (Top Deepfake Detection Tools, 2025). 
Cons – requires specific technical implications to work (Top Deepfake Detection Tools, 2025). 

+ **Reality Defender** <br>
Pros – business friendly (setups and dashboard), multi format detection (video, images, audio, text), process in batches, integrated with content management systems (Top Deepfake Detection Tools, 2025).
Cons – costly for smaller organizations (Top Deepfake Detection Tools, 2025) 

+ **Resemble AI Detect** <br>
Pros- audio focused detection, High accuracy (90%), approaches the API 1st (Top Deepfake Detection Tools, 2025) 
Cons- only audio detection (Top Deepfake Detection Tools, 2025  

### Open Source  

+ **DeepFake-o-meter** <br>
Pros - uses API runs on remote machine, metadata forensics can analyze multiple algorithms on the same input (DeepFake-o-Meter, 2021). 

+ **FaceForensics++** <br> 
Pros – high detection accuracy (Mukta et al., 2023) 
Cons- slow speed, requires tech expertise, low scalability (Mukta et al., 2023)

<br>

| Tool Type | Pros | Cons |
|-----------|------|------|
|Vendor|Higher accuracy detection, real time monitoring and forensic level reporting |Expensive for entry level business, needs a specific tech to run |
|Open source |Free to use, transparent and flexible algorithms |Slower processing speeds, needs a level of technical knowledge to use, low scalability and community driven user support |

## SOC Playbooks for Escalating Suspicious Media 
A playbook guide can be made up using OWASP guide for preparing and responding to deepfake events, building trust in a deepfake era an article by grow public relations and another article from reality defender about creating standard operating procedures for deepfake incident response.  

1. Monitoring & alerting - Use real time detecting tools (Creating Standard Operating Procedures for Deepfake Incident Response, 2025). Should alert with altered versions for each section of the business. 
2. Analyzing, scoring the alert and informing the relevant parties - Cross check with databases the blockchains, hashes, watermarks and metadata if this is a valid threat.  Next, they should categorize which kind of level this threat is. After that, the Cyber security team should review the threat if they more analysis they should inform the forensic analysis team for a deeper dive. Lastly, they contact the legal team, public relations, directors if it’s a major financial or reputational hit  
3. Response - If there is identified sectors to be isolated it should be quarantined. Maintain a log of every step for the final stage meeting. Communicate with the business about the incident and precautionary steps. 
4. Review - Update the required polices and the playbook to improve incident response performance. Current state of deepfake detection research. The table below is from an article called analysis of the current state of deepfake techniques creation and detection methods. <br>

| Reference | Method | Year | Advantage | Performance Evaluation Accuracy (%) |
|-----------|--------|------|-----------|-------------------------------------|
|Chang et al. |Convolutional neural network | 2020 | NA-VGG improved the detection of deepfake face images and the accuracy of this method. is much higher than several deepfake detection models. | 85.70% |
|Zhou et al. |Neural networks | It can detect tampering artifacts as well as hidden noise residual features. This method outperforms each stream by a large margin. | 92.70% |
|Wodajo and Atnafu.| Convolutional vision transformer | 2021 | This method's ability to detect deepfake, and quickly determine if the images are real or not. | 91.50% |
|Shad et al. | Convolutional neural network | 2021 | Detect deepfake images with high accuracy. Accuracy, precision, F1-score, and area under the ROC curve were all highest for VGGFace. | 99% |
|Ismail et al. | XGBoost | 2021 | The XGBoost algorithm uses more precise approximations to find the optimal tree model. It's designed to be adaptable and quick. It presents a fast and precise parallel tree boosting that solves many data science problems. | 90.73% |
|Ahmed et al. | Rationale augmented convolutional neural network | 2021 | In a real-time environment, models that have better performance and are smaller in size will be more useful. | 95.77% |
|Liu et al. | 3D convolutional neural network | 2021 | The proposed network has fewer parameters than other networks. As well as reduces deployment consumption while maintaining detection performance. | 99.83% |
|Kolagati at el. |Deep multilayer Convolutional Neural Network | 2022 | The hybrid system is ideal for screening deepfake videos with high speed and low computational resources. | 84% | 