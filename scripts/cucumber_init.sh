#!/bin/bash

# Create the directory structure
mkdir -p features/step_definitions
mkdir -p features/support

# Create a placeholder for the step_definitions folder
touch features/step_definitions/"$(basename `pwd`)_steps.rb"

# Create the environment file
echo '$: << File.expand_path("../../lib", File.dirname(__FILE__))' > features/support/env.rb
echo "require '$(basename `pwd`)'" >> features/support/env.rb

# Uncomment to Generate sample feature
#echo "Feature: Sample Feature
#
#  Scenario: Sample Scenario
#    Given the world
#    When your whishes come truth
#    Then you are happy
#" > features/sample.feature

# Give user some output
echo "Cucumber file structure created successfully."