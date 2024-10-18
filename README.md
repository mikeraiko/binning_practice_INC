# Анализ метагеномных данных, биннинг, выделение отдельных геномов (MAGs)

Мы будем работать с образцами из проекта Tara Ocean. У нас есть результаты секвенирования на Illumina в виде двух файлов - прямые и обратные риды. 
Мы не знаем, сколько в нашем образце организмов и какие они.

## Сперва настроим рабочее окружение

```
conda create -n binning
conda activate binning
conda config --env --set subdir osx-64 # только если у вас Мак с процессором M1/2/3
mamba install -c bioconda spades maxbin2 checkm2
```
Если у вас нет терминала (например, на вашем компьютере установлена только Windows), есть обходной путь:
- Откройте [Google colab](https://colab.research.google.com/), создайте новый блокнот.
- В первой ячейке введите
```
!pip install colab-xterm
%load_ext colabxterm
%xterm
```
Всё, у вас есть терминал, в котором можно работать (правда, медленно и чуть менее удобно)

## Теперь загрузим исходные данные
Сохраняем их в папку *data*. 
```
mkdir data
cd ~/data
curl -O -J -L https://osf.io/th9z6/download
curl -O -J -L https://osf.io/k6vme/download
cd ..
```
## Что в наших данных?
Мы можем классифицировать риды еще до сборки, сравнивая каждый из них с базой данных.
Мы будем использовать программу Kraken (есть и аналоги - Kaiju, Centrifuge).
Этот этап воспроизводить не нужно, так как эти программы требуют очень больших баз.
Так что просто представьте, что мы запустили команду 
```
~/Libs/kraken2/kraken2/kraken2 --db  /path/to/kraken2_db/  --report kraken_out/kraken.report --output kraken_out/kraken.out data/*.fastq.gz 
```

Результаты можно посмотреть в папке *kraken_out*. Сами по себе они нам ничего не скажут. 
Но их можно визуализировать с помощью онлайн-инструмента [Pavian](https://fbreitwieser.shinyapps.io/pavian/). Загрузите туда файл *kraken.report* и посмотрите на результат.

Что вы думаете о нашем образце?

## Сборка
Это этап мы тоже, скорее всего, пропустим, так как SPAdes часто требует больше памяти, чем есть на ноутбуках. Но вы можете попытаться.
```
spades.py --meta -1 data/tara_reads_R1.fastq.gz -2 data/tara_reads_R2.fastq.gz  -o metaspades_out
```

## Биннинг

А теперь нам нужно разделить всю эту гору контигов на отдельные бины

Получим средние значения покрытия для каждого контига
```
grep ">" metaspades_out/scaffolds.fasta  | cut -f 2 -d ">" > names.txt
grep ">" metaspades_out/scaffolds.fasta  | cut -f 6 -d "_" > cov.txt
paste names.txt cov.txt > abund.txt
```

А теперь запустим биннер:

```
mkdir maxbin_output
cd maxbin_output
run_MaxBin.pl -contig ../metaspades_out/scaffolds.fasta  -abund ../abund.txt -out maxbin -min_contig_length 500 
cd ..
```
Сколько бинов у нас получилось?

## Проверка бинов на полноту и таксономическое положение

Общая характеристика бинов
```
checkm lineage_wf  maxbin_output -x fasta checkm_output
```

Определение рРНК

```
checkm ssu_finder metaspades_out/scaffolds.fasta  maxbin_output/ ssu_finder_out  -x fasta 
```




