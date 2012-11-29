%Load in clean data
load cleandata_students.mat;

%Create a row vector of attributes
attributes = 1:45;

folds = 10;
fold_size = floor(length(y)/10);
predictions = zeros(length(y),1);

%cross validation
for fold = 1:folds,
    s = ((fold - 1) * fold_size) + 1;
    e = s + fold_size;
    train_x = x;
    train_x(s:e,:) = [];
    test_x = x(s:e,:);
    train_targets = y;
    train_targets(s:e) = [];
    cbr = CBRinit(train_x, train_targets);
    p = testCBR(t, test_x);
    predictions(s:e) = p;
end


%confusion matrix
predictions(predictions == 0) = NaN;
classification_rate = length(predictions(~isnan(predictions))) / length(y) * 100;
cm = CONFUSION_MATRIX(predictions, y);

%recall rates, precision rates & f1
recall_rates = zeros(6,1);
precision_rates = zeros(6,1);
f1 = zeros(6,1);
error_rate = length(predictions(predictions ~= y))/length(y);
classification_rate = 1 - error_rate;
for emotion = 1:6,
    recall_rates(emotion) = cm(emotion,emotion) / sum(cm(emotion,:)) * 100;
    precision_rates(emotion) = cm(emotion,emotion) / sum(cm(:,emotion)) * 100;
    f1(emotion) = 2 * precision_rates(emotion) * recall_rates(emotion) / (precision_rates(emotion) + recall_rates(emotion));
end

