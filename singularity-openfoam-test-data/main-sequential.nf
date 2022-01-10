process openFoam {
    echo true
    script:
    """
    echo "Enter working directory..."
    cd /data/motorBike
    echo ""

    echo "Listing directory..."
    ls
    echo ""

    echo "Running OpenFoam: surfaceFeatures"
    surfaceFeatures
    echo ""

    echo "Running OpenFoam: blockMesh"
    blockMesh
    echo ""

    echo "Running OpenFoam: decomposePar"
    decomposePar -copyZero
    echo ""

    echo "Running OpenFoam: snappyHexMesh"
    snappyHexMesh -overwrite parallel
    echo ""

    echo "Running OpenFoam: potentialFoam"
    potentialFoam -parallel
    echo ""

    echo "Running OpenFoam: simpleFoam"
    simpleFoam -parallel
    echo ""

    echo "Running OpenFoam: reconstructParMesh"
    reconstructParMesh -constant
    echo ""
    
    echo "Running OpenFoam: reconstructPar"
    reconstructPar -latestTime
    """
}
