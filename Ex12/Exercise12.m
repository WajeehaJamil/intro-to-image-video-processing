% Constructs a multimedia reader object
vidReader = VideoReader('echo1.avi');
% Initialize the optical flow object
opticFlow = opticalFlowLK('NoiseThreshold', 1);
while hasFrame(vidReader)
    % Read the rgb frame
    frameRGB  = readFrame(vidReader);
    % Convert rgb to grayscale
    frameGray = rgb2gray(frameRGB);
    frameGray = imdiffusefilt(frameGray);
    % Compute optical flow
    flow = estimateFlow(opticFlow, frameGray);
    % Display rgb video frame with flow vectors
    imshow(frameRGB);
    hold on;
    plot(flow, 'DecimationFactor', [5 5], 'ScaleFactor', 10);
    drawnow;
    hold off;
end
%%
% Constructs a multimedia reader object
vidReader = VideoReader('echo2.avi');
% Initialize the optical flow object
opticFlow = opticalFlowLK('NoiseThreshold', 1);
while hasFrame(vidReader)
    % Read the rgb frame
    frameRGB  = readFrame(vidReader);
    % Convert rgb to grayscale
    frameGray = rgb2gray(frameRGB);
    frameGray = imdiffusefilt(frameGray);
    % Compute optical flow
    flow = estimateFlow(opticFlow, frameGray);
    % Display rgb video frame with flow vectors
    imshow(frameRGB);
    hold on;
    plot(flow, 'DecimationFactor', [5 5], 'ScaleFactor', 10);
    drawnow;
    hold off;
end
%% ECHO2 IS BETTER