params.input = "data/*"

process preprocess {
    input:
    path file from params.input

    output:
    path "processed_${file}"

    """
    # Commands for preprocessing
    preprocess_script.sh $file
    """
}

process train_model {
    input:
    path processed_file from preprocess.out

    output:
    path "model"

    """
    # Commands to train the machine learning model
    train_model_script.py $processed_file
    """
}

workflow {
    preprocess()
    train_model()
}
