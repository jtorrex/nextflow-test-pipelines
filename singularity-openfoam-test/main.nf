process openfoam {
   
    echo true

    script:
    """
    echo "--------------------------------"
    cat /etc/*release | grep -i pretty
    whoami
    echo "--------------------------------"
    echo "Hello World! From OPENFOAM singularity Container"
    echo "--------------------------------"
    echo "Running from:"
    pwd
    echo "--------------------------------"
    simpleFoam -help
    """
}
