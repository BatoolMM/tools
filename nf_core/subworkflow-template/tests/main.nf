#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { {{ component_name_underscore|upper }} } from '../../../../subworkflows/{{ org }}/{{ subworkflow_dir }}/main.nf'

workflow test_{{ component_name_underscore }} {
    {% if has_meta %}
    input = [
        [ id:'test' ], // meta map
        file(params.test_data['sarscov2']['illumina']['test_paired_end_bam'], checkIfExists: true)
    ]
    {%- else %}
    input = file(params.test_data['sarscov2']['illumina']['test_single_end_bam'], checkIfExists: true)
    {%- endif %}

    {{ component_name_underscore|upper }} ( input )
}
