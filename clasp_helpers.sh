#!/bin/bash

# Author: Michael Conan
# Pre-requisites:
# - Node.js
# - @google/clasp installed
# - jq installed
# - folder structure with clasp directory and .{env}.clasp.json files

# Update clasp to dev ID and pull code
clasp_pull () {
    
    # Validate parameter
    if [ "$#" -ne 1 ]; then
        echo please provide 1 parameter: environment
    fi

    # Convert environemnt argument to lowercase
    env=`echo $1 | awk '{ print tolower($1) }'`

    # Update clasp file with env script ID
    success=$(_update_clasp_json $env)

    if [ success ]; then
        # Pull latest code
        echo pulling code from $env script
        npx clasp pull
        echo completed $env pull
    else 
        echo failed to pull $env code
    fi

}

# Update clasp file and deploy for specified environment
clasp_promote () {

    # Validate parameter
    if [ "$#" -ne 1 ]; then
        echo please provide 1 parameter: environment
    fi

    # Convert environemnt argument to lowercase
    env=`echo $1 | awk '{ print tolower($1) }'`

    # Update clasp file
    success=$(_update_clasp_json $env)
    if [ success ]; then
        # Push code
        echo pushing latest code to $env script
        npx clasp push
        echo completed $env push
    else 
        echo failed to push $env code
    fi

}

# $1 - Pass argument for code env matching clasp file
_update_clasp_json () {

    # Check if clasp file exists in directory
    if [ -f clasp/."$1".clasp.json ]; then
        echo updating .clasp.json file using clasp/."$1".clasp.json
        # Parse Script ID from environment clasp file
        envId=$(jq -r '.scriptId' clasp/."$1".clasp.json)
        # Update clasp script ID setting
        npx clasp setting scriptId $envId
        echo true
    else
        echo no clasp/."$1".clasp.json found
        echo false
    fi
}
