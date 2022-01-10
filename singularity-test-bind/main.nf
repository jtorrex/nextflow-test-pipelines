process demo {
    echo true

   //containerOptions '--volume /tmp:/tmp/tmp-mounted'

    script:
    """
    echo "Whoami"
    id
    echo ""
    rm -rf /tmp/tmp-mounted
    echo "Creating tmp directory"
    mkdir /tmp/tmp-mounted
    echo ""
    echo "Pushing data inside"
    cat /etc/*release >> /tmp/tmp-mounted/testing-bind.txt
    echo "Hello world! From Singularity container" >> /tmp/tmp-mounted/testing-bind.txt
    touch /tmp/tmp-mounted/thepipelinehasrun
    echo ""
    echo "Listing the directory"
    ls /tmp/tmp-mounted/
    echo ""
    echo "Showing the created file"
    cat /tmp/tmp-mounted/testing-bind.txt
    """
}
