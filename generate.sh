#!/bin/bash

# Generate the Spring Boot server stubs
# This only needs to be run when the petstore.yml file is updated

function generate() {
  local TARGET_DIRECTORY=$1
  local GENERATOR=$2
  local GENERATOR_VERSION=$3
  shift 3
  local ADDITIONAL_PROPERTIES=$@
  rm -r "${PWD}/${TARGET_DIRECTORY}"
  docker run --rm -v "${PWD}:/local" openapitools/openapi-generator-cli:${GENERATOR_VERSION} generate \
      -i /local/petstore.yml \
      -g ${GENERATOR} \
      -o /local/${TARGET_DIRECTORY} \
      --additional-properties apiPackage=com.examples.petstore.api,modelPackage=com.examples.petstore.model,supportingFilesToGenerate=ApiUtil.java,artifactVersion=0.0.0,hideGenerationTimestamp=true${ADDITIONAL_PROPERTIES}
}

generate java-spring-boot-2.6.2 spring "v5.4.0" # Spring Boot 2.6.2 (2021-12-21)
  # Versions older than v5.4.0 either have OAS 2 annotations (which Spring Doc doesn't support) or don't compile
generate java-spring-boot-latest spring "latest-release"
# end
