process demo {
    echo true

    input:
    val(x) from Channel.from('')

    script:
    """
    cat /etc/*release
    echo "Hello world! From Singularity container"
    touch thepipelinehasrun 
    """
}
