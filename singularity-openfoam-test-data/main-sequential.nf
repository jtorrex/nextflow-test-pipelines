#!/usr/bin/env nextflow

//This is a comment

/*
* This is a block of comments
*/

// This is needed for activating the new DSL2
nextflow.enable.dsl=2

// Channel my_files reading from localpath
//Channel
//    .fromPath("*.txt")
//    .set {my_files}
//
//my_files.view()

process openFoamFull {

    echo true

    output: stdout

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
