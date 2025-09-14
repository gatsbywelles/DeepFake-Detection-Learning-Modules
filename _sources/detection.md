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


### Metadata analysis
Metadata refers to the hidden information stored inside a digital file. For images and videos, metadata can include details such as file size, creation date, last modified date, and even the camera model used. Examining these properties is an important step in digital forensics because irregularities in metadata may indicate tampering or manipulation. For example, if an image claims to be taken years ago but the “creation date” in its metadata is recent, this raises suspicion. Metadata analysis therefore acts as an additional layer of verification when investigating possible deepfakes.

Researchers have also developed frameworks for metadata forensics to systematize this process (Royan et al., 2024). In practice, the process begins with preprocessing images so they are standardized. This step ensures that variations such as rotated or resized images do not interfere with analysis. Once standardized, metadata is extracted using specialized tools and then processed by machine learning algorithms to detect unusual patterns or generate a report.

**Tools commonly used (Royan et al., 2024):**
1. ExifTool – extracts image attributes such as file size, creation and modification dates, and camera information.
2. Online and offline analyzers – in the study, 10 online and 5 offline tools were tested to check and interpret metadata for signs of manipulation.