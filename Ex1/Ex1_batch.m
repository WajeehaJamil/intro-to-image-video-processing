
function Ex1_batch = Ex1__batch()
    for i = 1:6
        I = imread(strcat('c_',num2str(i),'.jpg'));
        processed_img = Process(I);
        imwrite(processed_img, strcat('c_',num2str(i), '.bmp'));
    end
end

function processed_img = Process(I)
    im = imresize(I, 0.75);
    n = floor(size(im)/2);
    m = size(im);
    right_half = im(:,n(2)+1:m(2) ,:);
    img = fliplr(right_half);
    processed_img = imrotate(img, 90);
    
end
