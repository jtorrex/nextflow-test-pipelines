

process openfoamcompletepipeline {
    echo true

    script:
    """
    surfaceFeatures
    blockMesh
    decomposePar -copyZero
    snappyHexMesh -overwrite parallel
    potentialFoam -parallel
    simpleFoam -parallel
    reconstructParMesh -constant
    reconstructPar -latestTime
    """
}
