# nf-albacore
Nextflow script for nanopore base calling with albacore

## Example:

*No deplexing*

`nextflow run thanhleviet/nf-albacore --fast5 "path_to_fast5_folder" --output "output_folder"`


*Deplexing*

`nextflow run thanhleviet/nf-albacore --fast5 "path_to_fast5_folder" --output "output_folder" --demultiplex`
