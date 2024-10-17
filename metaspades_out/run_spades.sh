set -e
true
true
/home/mrayko/mambaforge/bin/spades-hammer /home/mrayko/data/metaspades_out/corrected/configs/config.info
/home/mrayko/mambaforge/bin/python /home/mrayko/mambaforge/share/spades/spades_pipeline/scripts/compress_all.py --input_file /home/mrayko/data/metaspades_out/corrected/corrected.yaml --ext_python_modules_home /home/mrayko/mambaforge/share/spades --max_threads 16 --output_dir /home/mrayko/data/metaspades_out/corrected --gzip_output
true
true
/home/mrayko/mambaforge/bin/spades-core /home/mrayko/data/metaspades_out/K21/configs/config.info /home/mrayko/data/metaspades_out/K21/configs/mda_mode.info /home/mrayko/data/metaspades_out/K21/configs/meta_mode.info
/home/mrayko/mambaforge/bin/spades-core /home/mrayko/data/metaspades_out/K33/configs/config.info /home/mrayko/data/metaspades_out/K33/configs/mda_mode.info /home/mrayko/data/metaspades_out/K33/configs/meta_mode.info
/home/mrayko/mambaforge/bin/spades-core /home/mrayko/data/metaspades_out/K55/configs/config.info /home/mrayko/data/metaspades_out/K55/configs/mda_mode.info /home/mrayko/data/metaspades_out/K55/configs/meta_mode.info
/home/mrayko/mambaforge/bin/python /home/mrayko/mambaforge/share/spades/spades_pipeline/scripts/copy_files.py /home/mrayko/data/metaspades_out/K55/before_rr.fasta /home/mrayko/data/metaspades_out/before_rr.fasta /home/mrayko/data/metaspades_out/K55/assembly_graph_after_simplification.gfa /home/mrayko/data/metaspades_out/assembly_graph_after_simplification.gfa /home/mrayko/data/metaspades_out/K55/final_contigs.fasta /home/mrayko/data/metaspades_out/contigs.fasta /home/mrayko/data/metaspades_out/K55/first_pe_contigs.fasta /home/mrayko/data/metaspades_out/first_pe_contigs.fasta /home/mrayko/data/metaspades_out/K55/strain_graph.gfa /home/mrayko/data/metaspades_out/strain_graph.gfa /home/mrayko/data/metaspades_out/K55/scaffolds.fasta /home/mrayko/data/metaspades_out/scaffolds.fasta /home/mrayko/data/metaspades_out/K55/scaffolds.paths /home/mrayko/data/metaspades_out/scaffolds.paths /home/mrayko/data/metaspades_out/K55/assembly_graph_with_scaffolds.gfa /home/mrayko/data/metaspades_out/assembly_graph_with_scaffolds.gfa /home/mrayko/data/metaspades_out/K55/assembly_graph.fastg /home/mrayko/data/metaspades_out/assembly_graph.fastg /home/mrayko/data/metaspades_out/K55/final_contigs.paths /home/mrayko/data/metaspades_out/contigs.paths
true
/home/mrayko/mambaforge/bin/python /home/mrayko/mambaforge/share/spades/spades_pipeline/scripts/breaking_scaffolds_script.py --result_scaffolds_filename /home/mrayko/data/metaspades_out/scaffolds.fasta --misc_dir /home/mrayko/data/metaspades_out/misc --threshold_for_breaking_scaffolds 3
true
