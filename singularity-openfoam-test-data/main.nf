process openFoamShowDir {
    echo true
    script:
    """
    echo "Enter working directory..."
    cd /data/motorBike
    echo ""
    echo "Listing directory..."
    ls
    echo ""
    """
}

process openFoamSurfaceFeatures {
    echo true
    script:
    """
    echo "Running OpenFoam: surfaceFeatures"
    surfaceFeatures
    echo ""
    """
}

process openFoamBlockMesh {    
    echo true
    script:
    """
    echo "Running OpenFoam: blockMesh"
    blockMesh
    echo ""
    """
}

process openFoamDecomposePar {
    echo true
    script:
    """
    echo "Running OpenFoam: decomposePar"
    decomposePar -copyZero
    echo ""
    """
}

process openFoamSnappyHexMesh {
    echo true
    script:
    """
    echo "Running OpenFoam: snappyHexMesh"
    snappyHexMesh -overwrite parallel
    echo ""
    """
}
    
process openFoamPotentialFoam {
    echo true
    script:
    """
    echo "Running OpenFoam: potentialFoam"
    potentialFoam -parallel
    echo ""
    """
}

process openFoamSimpleFoam {
    echo true
    script:
    """
    echo "Running OpenFoam: simpleFoam"
    simpleFoam -parallel
    echo ""
    """
}

process openFoamReconstructParMesh {
    echo true
    script:
    """
    echo "Running OpenFoam: reconstructParMesh"
    reconstructParMesh -constant
    echo ""
    """
}

process openFoamReconstructPar {
    echo true
    script:
    """
    echo "Running OpenFoam: reconstructPar"
    reconstructPar -latestTime
    """
}
