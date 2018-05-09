#!/usr/bin/env nextflow

params.fast5 = ""
params.output = ""
params.fc = "FLO-MIN106"
params.kit = "SQK-LSK108"
params.threads = 20
params.demultiplex = true
params.format = "fast5,fastq"
extra_params = ""

if (params.demultiplex) {
        extra_params = "--barcoding"
    }

albacore = "read_fast5_basecaller.py"

fast5 = file(params.fast5)

process base_calling {

    publishDir "$params.output", mode: "move"

    tag {"Running..."}

    input:
    file(fast5)

    output:
    file(params.output)

    """
    $albacore ${extra_params} -f ${params.fc} \
              -k ${params.kit} \
              -i ${fast5} \
              -t ${params.threads} \
              -s ${params.output} \
              -o ${params.format} \
              -r \
              -n 0 \
              -q 0
    """
}

workflow.onComplete {
  // Display complete message
  log.info "Completed at: " + workflow.complete
  log.info "Duration    : " + workflow.duration
  log.info "Success     : " + workflow.success
  log.info "Exit status : " + workflow.exitStatus
}

workflow.onError {
  // Display error message
  log.info "Workflow execution stopped with the following message:"
  log.info "  " + workflow.errorMessage
}
