---
title: "Face Detection using OpenCV + Python (🐍)"
subtitle: "Detecting faces in real time with OpenCV and Python"
description: "Face detection is a computer technology being used in a variety of applications that identifies human faces in digital images. Face detection also refers to the psychological process by which humans locate and attend to faces in a visual scene."
cover: /images/posts/face-detection-opencv.jpg
categories:
  - AI
tags:
  - technology
  - industrial automation
  - ubuntu
  - information
  - robotics
date: 2021-06-21 16:05:37
featured: false
version: "v1.0"
---
![Face Detection](https://i.ytimg.com/vi/t-MDoI7MuY0/maxresdefault.jpg)

## What is Face Detection?

Face detection is AI-based computer technology that is used to extract and identify human faces from digital images. When integrated with [biometric](https://recfaces.com/articles/what-is-biometrics) security systems (particularly, facial recognition ones), this kind of technology is what makes it possible to monitor and track people in real-time. In applications that use facial tracking, analysis, and recognition, face detection typically works as the first step and has a significant impact on how sequential operations within the app will perform.

Face detection helps with facial analysis by identifying the parts of a video or an image that should be focused on when determining gender, age, and emotions. Similarly, with facial recognition systems (which create “faceprint” maps of facial features), face detection data is included in the system’s algorithms. And why? Face detection helps determine which parts of the video or image are needed to produce a faceprint.

## HOW DOES FACE DETECTION WORK?

Face detection technology uses machine learning and algorithms in order to extract human faces from larger images; such images typically contain plenty of non-face objects, such as buildings, landscapes, and various body parts.

Facial detection algorithms usually begin by seeking out human eyes, which are one of the easiest facial features to detect. Next, the algorithm might try to find the mouth, nose, eyebrows, and iris. After identifying these facial features, and the algorithm concludes that it has extracted a face, it then goes through additional tests to confirm that it is, indeed, a face.

To make algorithms as accurate as possible, they must be trained with huge data sets that contain hundreds of thousands of images. Some of these images contain faces, while others do not. The training procedures help the algorithm’s ability to decide whether an image contains faces, and where those facial regions are located.

Also, now would be a good time to give you definitions of the main types of algorithms – ML, AI, and Deep Learning.

* **Machine Learning (ML)**: ML algorithms use statistics to find patterns in huge amounts of data. This data can include words, numbers, images, clicks, and more. ML is the process behind many modern services – voice assistants (Siri and Alexa), search engines (Google and Baidu), and recommendation systems (Spotify and Netflix);
* **Artificial Intelligence (AI)**: If an ML solution is programmed to learn how to perform a task, rather than just simple performance, then it is AI. Systems that use AI demonstrate behaviors similar to human intelligence – for instance, problem solving, planning, learning, perception, manipulation, and reasoning;
* **Deep Learning:** This algorithm is a subset of machine learning, and it is what forms deep neural networks; essentially, machines are given a greater ability to find and amplify tiny patterns. Such networks have any layers of computational nodes that collaborate to sift through data and deliver predictions.

Now, as for the exact technologies used to develop face detection applications; these include:

* OpenCV;
* Matlab;
* Tensorflow;
* Neural Networks.

All of these follow almost the exact same procedure for face detection.

### FACE DETECTION METHODS

Three researchers from the University of California, David Kriegman, Ming-Hsuan Yang, and Narendra Ahuja, published a classification of facial detection methods. There are four classifiable categories, of which face detection algorithms can belong to 2+ groups. Let’s take a look at each category.

#### Feature-Based Method

This method located faces by extracting structural features. First, an algorithm is trained as a classifier. Next, it is used to sort facial regions from non-facial regions. The general idea is to move past humans’ instinctive knowledge of faces. When feature-based approaches tackle photos with many faces, they have a 94% success rate.

**Summary:** Features such as a person’s nose or eyes are used to detect a face.

#### Knowledge-Based Method

A knowledge-based algorithm is dependent upon a set of rules, and it is built on human knowledge. For instance, “rules” might include that a face should have eyes, a nose, and a mouth in certain positions relative to each other. However, this kind of method comes with one huge challenge: it is very difficult to build an appropriate rules set. If the rules are too general, there may be many false positives – and, conversely, if the rules are too detailed, the system could generate many false negatives.

**Summary:** A face is determined based on whether it meets a set of rules made by a human.

#### Template Matching Method

With a template matching algorithm, parameterized or pre-defined templates are used to locate or detect faces – the system measures the correlation between the input photos and the templates. For instance, the template may show that a human face is divided into nose, mouth, eyes, and face contour regions. Also, a facial model could be comprised of just edges and use the edge detection method – implementation of this approach is easy, but it is insufficient for face detection.

**Summary:** Images are compared to standard face patterns that have been previously stored.

#### Appearance-Based Method

An appearance-based algorithm uses a set of training images to “learn” what a face should look like. In general, this method relies on machine learning and statistical analysis to determine relevant facial characteristics. An appearance-based approach is generally considered to be stronger than the previously mentioned methods.

**Summary:** Statistical analysis and machine learning are combined to find a face image’s characteristics.

### FACE DETECTION TECHNIQUES

Some of the more specific facial detection techniques include:

1. Removing the background. Let’s say an image has a pre-defined, static background or a plain, single-color background – removing it can help determine the face’s boundaries;
2. With color images, the color of the skin can sometimes be used to find faces;
3. Motion can be used to detect faces. In a real-time video, a person’s face is nearly always in motion. However, a drawback of this technique is that a face could be confused with other moving objects.

When the aforementioned strategies are combined, they can create a comprehensive face detection approach.

## WHAT ARE THE CHALLENGES IN FACE DETECTION?

Researchers Ashu Kumar, Amandeep Kaur, and Munish Kumar published a [review of face detection techniques](https://www.researchgate.net/publication/326667118_Face_Detection_Techniques_A_Review), which included a detailed explanation of the challenges that facial detection faces. To sum up their findings, the challenges in face detection include:

* Odd expressions. A human face might have an odd expression, making it difficult for facial detection algorithms to identify it as a face;
* Face occlusion. If a face is hidden by hair, a hat, a hand, glasses, or a scarf, it may result in a false negative;
* Illuminations. An image might not have uniform lighting effects; part of the image may be overexposed, while another part is very dark. Again, this can contribute to false negatives;
* Complex background. When lots of objects are present in an image, face detection’s accuracy is reduced;
* Too many faces. If there is a large number of human faces in an image, face detection software may have a hard time distinguishing between some of them;
* Low resolution. If an image’s resolution is poor, it is more difficult to detect faces;
* Skin color. If somebody’s skin color falls outside of the gradient that is recognized by the algorithm,
  their face might not be detected.

## HOW DOES FACE DETECTION WORK WITH DEEP LEARNING?

As we mentioned earlier, deep learning is a subset of machine learning in which large neural networks process huge amounts of data and make complex predictions. So how does deep learning factor into face detection? Well, multiple [deep learning methods](https://arxiv.org/abs/1502.02766) have been developed specifically for facial detection.

One of the most popular deep learning approaches is the Multi-Task Cascaded Convolutional Neural Network – or, MTCNN. This approach is popular because it achieved cutting-edge results (for the time) on a variety of benchmark datasets – plus, it is able to use landmark detection to recognize the eyes, mouth, and other facial features.

MTCNN uses a cascade structure that contains three networks: P-net, R-Net, and O-Net. The image is first rescaled to different sizes (or an image period). P-Net proposes facial regions, R-Net filters the bounding boxes, and O-Net proposes facial landmarks.

## WHY IS FACE DETECTION IMPORTANT TODAY?

Face detection is the initial step in face analysis, face tracking, and, most importantly, face recognition. The latter industry is growing by leaps and bounds, and is applied to device unlocking, banking, hospitality, law enforcement, building security, and more. Face detection is necessary for facial recognition algorithms to know which parts of an image must be used to generate faceprints.

## FACE DETECTION VS. FACE RECOGNITION: WHAT’S THE DIFFERENCE?

Facial recognition is merely one application of face detection. The former is used for biometric verification and device unlocking, whereas the latter can also be applied to facial analysis and tracking. For a more comprehensive look at face recognition, check out our [Types of Biometrics guide.](https://recfaces.com/articles/types-of-biometrics)

## ADVANTAGES AND DISADVANTAGES OF FACE DETECTION SYSTEMS

While face detection systems can be powerful, they are by no means foolproof, as demonstrated by our list of challenges. Let’s take a look at the advantages and disadvantages that face detection systems can bring.

### ADVANTAGES OF FACE DETECTION

1. Better security. Face detection augments surveillance tactics and forms the basis of the identification process of terrorists and criminals;
2. Easy to integrate. Most face detection solutions are compatible with security software;
3. Automated identification. Face detection lets facial identification be automated, thus increasing efficiency alongside a heightened rate of accuracy.

### DISADVANTAGES OF FACE DETECTION

1. Huge storage requirements. Machine learning technology requires powerful data storage;
2. Detection can be vulnerable. We’ve outlined the way in which facial detection can be thrown off;
3. Potential privacy issues. There is disagreement on whether face detection is compatible with human privacy rights.

### PROS AND CONS TABLE SUMMARY

| Advantages of Face Detection | Disadvantages of Face Detection |
| ---------------------------- | ------------------------------- |
| Better security              | Huge storage requirements       |
| Easy to integrate            | Vulnerable detection            |
| Automated identification     | Potential privacy issues        |

## HOW FACE DETECTION ALGORITHMS ARE USED

Before we wrap up this guide, we wanted to give some examples of how face detection algorithms are applied in the real world. Some applications include photography, lip reading, marketing, and more.

### FACIAL MOTION CAPTURE

With applications such as Snapchat, people’s faces can be altered in real-time with fun filters. Facial detection makes this possible, as its algorithms tell the applications that there is a face that can be traced and changed.

### FACIAL RECOGNITION

[Facial recognition](https://recfaces.com/articles/what-is-facial-recognition-used-for) adds increased security to nearly every global industry. It seeks to identify a person and then authenticate their identity – but for a person’s faceprint to be analyzed via facial recognition, the facial area to be assessed is determined by face detection.

### PHOTOGRAPHY

Facial recognition can be used to “tag” people’s faces in photos across social media platforms, and facial detection forms the foundation of this application. Furthermore, facial detection technology can be used alongside tracking to focus on a person’s face while the photo is being taken.

### MARKETING

Facial surveillance can help stores determine customers that have visited a few times and offer them perks or discounts – thus fostering increased customer loyalty.

### EMOTIONAL INFERENCE

Emotion recognition applications are still in the works; when they are fully developed, AI might be able to “read” nonverbal cues, gestures, body movements, and facial expressions to convey a person’s feelings.

### LIP READING

The detection, modeling, and tracking of lips during videos can be used to generate automatic subtitles. Such an application can be found on YouTube, where some videos have the option to turn on subtitles, even if the creator has not provided any.

## SUMMARY

To sum up the key points of this guide:

* Face detection is AI-based computer technology that is used to extract and identify human faces from
  digital images;
* Face detection algorithms can be feature-based, knowledge-based, template matching, appearance- based, or a combination of methods;
* Advantages of face detection include better security, easy integration, and automated identification;
* Disadvantages include huge storage requirements, vulnerable detection, and potential privacy issues.

Face detection is the foundation of a huge number of facial applications – we can see it in our day-to-day life. When we unlock our smartphone via face recognition, that would not be possible without face detection. The same goes for facial recognition surveillance systems, photo tagging, and Snapchat filters. There are many exciting applications in the works that we can thank face detection for!

## Tutorial Time

Now we will see a small example of OpenCV and Python with its explanations, before we start we will need following software and if you are Linux base OS then you can skip installation process. Lets start.

### Installation on Windows

Software we will be using

1. PyCharm Community version
2. Latest version of python
3. And most import is your support. Lets start.

#### 1. PyCharm Community version

First open your favorite browser and paste this link in there `https://www.jetbrains.com/pycharm/download/` after that click on download under Community section.

![PyCharm](/images/posts/pycharm.png)

After downloading it just open the installer you shall be granted with this screen

![PyCharm Community](/images/posts/pycharm-community.png)

Click on next and complete installation process.

#### 2. Python

After completing installation of `PyCharm` now we will install Python, so same copy and past this link `https://www.python.org/downloads/` in browser and download installer

![Python](/images/posts/python-download.png)

Now open the installer and start the installation process and make sure that you check all the options in `Optional Features` like this

![Python Optional Feature](/images/posts/python-optional-features.png)

Now we are set for tutorial so open up your PyCharm.

### Coding

First of all we will be opening PyCharm from start menu under JetBrains folder

![JetBrains](/images/posts/jetbrains.png)

Create a new project named it OpenCV.

![pycharm64_sdEaNyoXbp](/images/posts/pycharm64_sdEaNyoXbp.png)

After creating new project it will take few minutes to setup editor for us and after completing this will on your screen 

![PyCharm Editor](/images/posts/pycharm64_c6nRLL7MiL.png)

#### Package Installation

Now clear everything in `main.py` and it should be empty after that we will be creating a text file called `requirement.txt` in your project folder using `cmd` for that you have to open `cmd`and navigate to you project folder like this

![CMD](/images/posts/cmd_CnLDIMeHY8.png)

now type `notepad.exe requirement.txt` it will ask you for create a new file and click on yes after that paste bellow packages name there.

```text
opencv-python
opencv-contrib-python
numpy
pillow
```

Save the file and close it now as we have saved the file we need to install all this packages by bellow command it will take a few minutes depending on your data transfer speed

```cmd
pip install -r requirement.txt
```

I have already installed it so it will give me this output

![Package installation](/images/posts/cmd_J3z721ij7x.png)

#### Video detection


Close cmd and come back to your PyCharm, after we have installed all the required packages we will make a simple program for video capture so that we know that our video camera is working or not, but before we code in PyCharm we have to import all this packages we installed so follow me. First got to menu then File > Settings and you will see this window.

![Project Settings](/images/posts/pycharm64_PxPA5214bM.png)

Open `Project: OpenCV` and in that select `Python Interpreter` in that add all this packages

![Project Settings](/images/posts/pycharm64_PxPA5214bM.png)

Now we will be coding a small program on video detection.

```python
import cv2 #importing opencv package
capture = cv2.VideoCapture(0) # we will create a variable name capture to capture webcam of our device which is "0" or else you can write ip address in '' of your webcam

while(True):
    ret, frame = capture.read() # to read data from video capture variable
    cv2.imshow("Video Feed",frame) # to show live video camera feed
    if cv2.waitKey(1) & 0xFF == ord('q'): # we have set waitKey at 0 means infinite or you can write any miliseconds and for ord('q') for quiting in live feed by pressing q on keyboard
        break

capture.release()
cv2.destroyAllWindows()
```

Now press <kbd>shift + F10</kbd> from keyboard or go-to menu Run > Run 'main' to run the program you may be able to see a new window with the name `Video Feed` try it yourself and you will be able to see your face. 

![Test image](/images/posts/vLylUVtgbB.png)This is test image which I will be using it.

#### OpenCV Cascade

It means that our camera of our system is working properly now we need face detection cascades there are two ways of finding that files first is by downloading from [here](/files/cascades.zip) or by following commands open your cmd and type `python` or `py` after that type following commands

```python
import cv2
print(cv2.__file__)
```

![CV2 Path](/images/posts/WindowsTerminal_vDoEGwj6gk.png)

Go to the highlighted path and in there you will be able to see all the files and in that file there will be a folder called data will be there

![Data](/images/posts/explorer_Ixdq0hGTPD.png)

Copy that folder and past it in your project and rename from `data` to `cascade` like this.

![Cascade](/images/posts/explorer_sCfK1JWEKV.png)

After doing we will be creating a new variable called `face_cascade` and in that variable we will use OpenCV, paste this code in your main.py file

```python
import cv2 #add bellow this line
face_cascade = cv2.CascadeClassifier('cascades/haarcascade_frontalface_alt.xml') 
```

#### Using Face Classifier

Now we will be converting our colored BGR color to Gray color so that our cascade can understand the image properly, mostly face detection works in gray scale so we will be converting our colored frame to gray scale. For that you have to create a new variable called gray under `ret, frame = capture.read()`. Remember OpenCV uses BGR method while for other color code it is RGB you must be familiar with RGB so you will understand BGR. Now we will add this line into our code 

```python
ret, frame = capture.read() # add bellow this line
gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY) # to convert BGR image to grayscale image
```

 and don't worry if your not able to understand the code I will be giving you project like so that you can download it and run it on your own. We will now detect faces in webcam, photo frame or video. For that we will be using gray scale which we have converted from BGR ti GRAY so for that we need `detectMultiScale` function for scale factor and minimum neighbors detection.

```python
gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY) #add bellow this
faces = face_cascade.detectMultiScale(gray, scaleFactor=1.5, minNeighbors=5) # you can play with the numbers as much as you want
```

now we will pe finding our face in frame by finding position and checking whether the face is present or not for that we will be using width, height, x direction, y direction of the video feed.

```python
faces = face_cascade.detectMultiScale(gray, scaleFactor=1.5, minNeighbors=5)  # add bellow this line
    for (x, y, w, h) in faces:
        print(x,y,w,h) # print coordinates of your face
```

This command will show you the coordinates of your face in the frame so that we can identify that someone is present here.

![Face Coordinate's](/images/posts/9GZxLCVtAp.png)

Now we will be drawing a square around our face so that we can clearly identify it for that we will be will be using gray scale image. Now we will make a region of interest or ROI using gray scale image to determine its width and height

```python
   for (x, y, w, h) in faces:
        print(x,y,w,h) # print bellow this line
        roi_gray = gray[y:y + h, x:x + h] # regoin of interest of gray scale image
        roi_color = frame[y:y + h, x:x + w] # regoin of interest of colored image
```

so now as we have found our region of interest we will check that whether it is working properly or not so we will capture our face by making a PNG fine

```python
		roi_color = frame[y:y + h, x:x + w] # add bellow this
    	img_item = "my-image.png" # creating a variable name img_item
    	cv2.imwrite(img_item, roi_color) # to create an image file where we can see our face only
```

What this above line will do is that it will create an PNG file with the name `my-image.png` in your project folder so that we can understand that which portion of our face is been captured.

 ![my-image.png](/images/posts/ATItkXEuFa.png)

After detecting our face and saving it in a PNG file what we will do is that we will create a border and track our live feed cam and see it more clearly

```python
    	cv2.imwrite(img_item, roi_color) # add bellow this
    	color = (0,0,255) # BGR format you can choose whatever you want go to this site to choose color https://wamingo.net/rgbbgr/
        stroke = 2
        end_cord_x = x + w
        end_cord_y = y + h
        cv2.rectangle(frame,(x, y), (end_cord_x, end_cord_y), color, stroke)
```

![Drawing rectangle on face](/images/posts/bzUl6UbhVI.png)

Until now what we have done is that we have just detecting our face using `Cascades` but as we have successfully done it so now we will be creating recognizer to recognize who is that person is for that we will be creating an algorithm. So now we will be creating new python file `train-faces.py` so that we will be writing all the algorithm in it to train our facial recognition system. After creating `train-faces.py` file we will create a folder of name `images` where we will be adding all images in it to train our trainer. Open train-faces.py and type the following code:

```python
import os # to detect which kind of operating system we are been using example: Windows, Linux, Debian, Mac, etc.
BASE_DIR = os.path.dirname(os.path.abspath(__file__)) # to automatical find out the path of our project
```

What we have done is that we told the system to find the path of our project automatically and also to detect os also and after detecting our project folder we will be adding our images directory so that we will be able to find all images at one place.

```python
BASE_DIR = os.path.dirname(os.path.abspath(__file__)) # add bellow this
image_dir = os.path.join(BASE_DIR, "images") # this will add images at the end of our base dir example: C:\User\Admin\Desktop\facedetection\images\
```

As our system or file has detected the path we will check all the images which are present in it.

```python
image_dir = os.path.join(BASE_DIR, "images") # add bellow this line
for root, dirs, files in os.walk(image_dir): # this will detect our image path
    for file in files: 
        if file.endswith("png") or file.endswith("jpg"): # this is use to check whether there are png file or jpg files
            path = os.path.join(root, file) # this will join our project director and images folder path
            print(path) # to check all the apth of images
```

![Image path](/images/posts/pycharm64_QFG764uyci.png)

Now what we will do is that we will be giving labels to our directories which are present in images folder 

```python
            path = os.path.join(root, file) # add bellow this line
    		label = os.path.basename(root) # to give the label of our image folder
        	print(label, path) # add label in old print function
```

So when we will run the code now we will be able to see path as well as label. So now we will be creating empty list.

```python
image_dir = os.path.join(BASE_DIR, "images") # add bellow this
y_labels = []
x_train = []
```

Training images using `NumPy` array also we will be using `PIL` python library to grab pill of image

```python
import cv2 #add bellow this
import numpy as np
from PIL import Image
```

After importing Image from PIL library we will be converting image into gray

```python
        	print(label, path) # add bellow this
    		pil_image = Image.open(path).convert("L") # to convert colored image to gray scale
```

Now we will be using NumPy array to train our images

```
    		pil_image = Image.open(path).convert("L") # add bellow this line
    		image_array = np.array(pil_image, "uint8")
    		print(image_array) # to check images array
```

![Image Array](/images/posts/pycharm64_D0vgyFuYoF.png)

We will check ROI of images so that we can train our trainer for that we need to `import cv2` into our `train-faces.py` using our Cascades

```python
import cv2 
BASE_DIR = os.path.dirname(os.path.abspath(__file__)) # to automatical find out the path of our project

image_dir = os.path.join(BASE_DIR, "images") # this will add images at the end of our base dir example: C:\User\Admin\Desktop\facedetection\images\
face_cascade = cv2.CascadeClassifier('cascades/haarcascade_frontalface_alt2.xml') # add this line
```

After importing OpenCV and Cascades we will be detecting faces using `detectMultiScale`.

```python
            print(image_array) # add bellow this
    		faces = face_cascade.detectMultiScale(image_array, scaleFactor=1.5, minNeighbors=5)
            for (x, y, w, h) in faces:
                roi = image_array[y:y + h, x:x + w]
                x_train.append(roi)
```

We will be giving labels so that it would be easy to understand it properly, also not that it would be easy to see who is the person in the video feed or photo frame for that we will be creating a variable.

```python
face_cascade = cv2.CascadeClassifier('cascades/haarcascade_frontalface_alt2.xml') # add bellow this line
current_id = 0 # creating an id starting with 0
label_ids = {} # to create and empty directory
# Now come down to this line 
        	print(label, path) # ad bellow this
            if not label in label_ids: # it will check whether the labels are there or not
                label_ids[label] = current_id
                current_id += 1
            id_ = label_ids[label]
            print(label_ids) # to print label ids
# Now come down to this line 
				x_train.append(roi) # add bellow this line
                y_labels.append(id_)
print(y_labels)
print(x_train)
```

What we have done is that we have created labels ids for each and every image we have so after doing that we will saving all thoes lables so that it would be easy for our program to recognize it for that we need pickle so I assume that you know who to import any library so import pickle. Now go to the bottom of you train-faces.py file and paste bellow code but before pasting this code make sure to add `#` infront of `print` function.

```python
with open("labels.pickle", "wb") as f:
    pickle.dump(label_ids, f)
```

After this we will train our OpenCV recognizer for each an every images so that it can recognize it propely so for that we will create a variable call recognizer.

```python
face_cascade = cv2.CascadeClassifier('cascades/haarcascade_frontalface_alt2.xml') # add bellow this line
recognizer = cv2.face.LBPHFaceRecognizer_create() #creating our face recognizer
```

Successful creation of our recognizer we will be needing numpy array to save all those array in a single file and remember one thing the more numbers of photo will take more time to write it also it deppends on speed of your devices also.

```python
with open("labels.pickle", "wb") as f:
    pickle.dump(label_ids, f) # add bellow this
recognizer.train(x_train, np.array(y_labels)) # using numpy array we will be training our recognizer
recognizer.save("trainer.yml") # and from above training we will be saving it in a single file called trainner.yml
```


As we have completed our `train-faces.py` we will run it and train our project so that we can recognize our faces, so now go to your cmd and `type py tain-faces.py` and wait until you get this message

```
Process finished with exit code 0
```

After you see this message it means that our trainer has been successfully trained so main.py is been left to update for final run. Now open your main.py file and past this line

```python
face_cascade = cv2.CascadeClassifier('cascades/haarcascade_frontalface_alt2.xml') # add bellow this
recognizer = cv2.face.LBPHFaceRecognizer_create() #creating our face recognizer
recongnizer.read("trainer.yml")
with open("labels.pickle", "rb") as f:
    og_labels = pickle.load(f)
```

What we did is imported `trainer.yml` so that we can read all the data we have been trained data. After that we will be import all the the tags and ids we have created.

```python
        roi_color = img[y:y + h, x:x + w] # add bellow this line
        id_, conf = recognizer.predict(roi_gray)
		        if conf>= 45:
            print(id_)
```

#### Loading Label Names from Pickle

Now we will labels from `labels.pickle` so that we can identify labels, so what we will do is fetch all the labels from that file.

```
recognizer.read("trainer.yml") # add bellow this

labels = {"person_name": 1} # display person name
```

What we did is we will display person name so to do that we are going to add this line to display it

```python
    og_labels = pickle.load(f) # add bellow this
    labels = {v:k for k,v in labels.items()}
```

Now we will print ids

```python
            print(id_) # add bellow this
    
```

#### Put Text on your face

We will put text on our webcam face recognition so that we can identify who is that person is for that we will be using `putText` function.

```python
        if conf >= 45:
            print(id_)
            print(labels[id_]) # add bellow this
            font = cv2.FONT_HERSHEY_SIMPLEX
            name = labels[id_]
            color = (0,0,255) # BGR choose any color you like
```

We will resize little bit so that it reads perfectly in `train-faces.py`

```python
            pil_image = Image.open(path).convert("L") # add bellow this
			size = (500,500)
            final_image = pil_image.rezise(size, Image.ANTIALIAS)
```

After saving both the files run your main.py file and check the output of it.

#### Complete Code

**requirement.txt**

```text
opencv-python
opencv-contrib-python
numpy
pillow
```

**main.py**

```python
import cv2 
import pickle
# url = '' # add your remote ip of webcam example 'http://192.168.0.1/video' or 'http://192.168.0.1' depending on your ip even you can use security camera ip also
face_cascade = cv2.CascadeClassifier('cascades/haarcascade_frontalface_alt2.xml')


recognizer = cv2.face.LBPHFaceRecognizer_create()
recognizer.read("trainer.yml")
labels = {"person_name": 1}
with open("labels.pickle","rb") as f:
    og_labels = pickle.load(f)
    labels = {v:k for k,v in og_labels.items()}
cap = cv2.VideoCapture(0) # comment this if your using ip camera
# cap = cv2.VideoCapture(url) # uncomment this line to use remote camera url
cap.set(3,512)
cap.set(4,512)
cap.set(10,150)

while True:
    # Capture frame-by-frame
    ret, frame = cap.read()
    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
    faces = face_cascade.detectMultiScale(gray, scaleFactor=1.5, minNeighbors=5)
    for (x, y, w, h) in faces:
        # print(x,y,w,h)
        roi_gray = gray[y:y+h, x:x+w]
        roi_color = frame[y:y+h, x:x+w]
        id_, conf = recognizer.predict(roi_gray)
        if conf>=45: # and conf<=85:
            # print(id_)
            # print(labels[id_])
            font = cv2.FONT_HERSHEY_SIMPLEX
            name = labels[id_]
            color = (0,255,0)
            stroke = 2
            cv2.putText(frame, name, (x,y), font, 1, color, stroke, cv2.LINE_AA)

        img_item = "test.png"
        cv2.imwrite(img_item, roi_color)
        color = (0,255,0) # BGR
        stroke = 2
        end_cord_x = x + w
        end_cord_y = y + h
        cv2.rectangle(frame, (x, y), (end_cord_x, end_cord_y), color, stroke)

    # Display the resulting frame
    cv2.imshow('Frame',frame)
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

cap.release()
cv2.destroyAllWindows()
```

**train-faces.py**

```python
import cv2
import os
from PIL import Image
import numpy as np
import pickle

BASE_DIR = os.path.dirname(os.path.abspath(__file__))
image_dir = os.path.join(BASE_DIR, "images")

face_cascade = cv2.CascadeClassifier('cascades/haarcascade_frontalface_default.xml')
recognizer = cv2.face.LBPHFaceRecognizer_create()

current_id = 0
label_ids = {}
y_labels = []
x_train = []

for root, dirs, files in os.walk(image_dir):
    for file in files:
        if file.endswith("png") or file.endswith("jpg"):
            path = os.path.join(root, file)
            label = os.path.basename(root).replace(" ", " ") #.upper()
            # print(label,path)
            if not label in label_ids:
                label_ids[label] = current_id
                current_id += 1
            id_ = label_ids[label]
            # print(label_ids )
            # y_labels.append(label)
            # x_train.append(path)
            pil_image = Image.open(path).convert("L")
            size = (512,512)
            final_image = pil_image.resize(size, Image.ANTIALIAS)
            image_array = np.array(pil_image, "uint8")
            # print(image_array)
            faces = face_cascade.detectMultiScale(image_array, scaleFactor=1.5, minNeighbors=5)
            for (x,y,w,h) in faces:
                roi = image_array[y:y+h, x:x+w]
                x_train.append(roi)
                y_labels.append(id_)

# print(y_labels)
# print(x_train)

with open("labels.pickle","wb") as f:
    pickle.dump(label_ids, f)

recognizer.train(x_train, np.array(y_labels))
recognizer.save("trainer.yml")
```

#### Source Code

Here is the source code [OpenCV Facial Recognition](https://github.com/mrfoxie/OpenCV-Facial-Recognition) on GitHub if you have any issues then you can ask there.
