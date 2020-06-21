# Questions

Should I install jupyter notebook when dviz is activated or not?

Please note: you need to activiate divz first before installing ipykernel and then using "python -m ipykernel install --user --name=dviz".

问题：

[这篇帖子](https://uoa-eresearch.github.io/eresearch-cookbook/recipe/2014/11/20/conda/) 提到，要往虚拟环境中下载包的话，需要:

```bash
conda install -n divz [packagename]
```

但是我发现，我只要提前用 `conda activate dviz` 了，那么直接用 `conda install [packagename]` 就可以把包下载到虚拟环境中，不信你看：

```
## Package Plan ##

  environment location: /opt/miniconda3/envs/dviz

  added / updated specs:
    - altair
    - bokeh
    - datashader
    - holoviews
    - jupyter
    - jupyterlab
    - matplotlib
    - numpy
    - pandas
    - scikit-learn
    - scipy
    - seaborn
    - vega_datasets

```

以上是我用了 `conda activate divz` 之后，然后直接 `conda install ...` 出现的结果。

步骤：
1. 先下载 Pyhton

如果你用的是苹果电脑，那么系统有自带，每一个系统都会预装 python，比如在 Termianl 输入 `python --version`, 你会看到你的 python 版本数。如果你是 High Sierra 的话，那么应该是 `Python 2.7.16`，至少我这里是这样。

但是，这并不是最新的 python 版本，所以我们还需要去另外下载最新的版本。

进入 [python.org/downloads](https://www.python.org/downloads/)，然后下载最新的版本。我写这篇帖子的日期，2020年6月20，最新的版本是 `python 3.8.3`。

下载完成后，进入 Terminal, 输入 `python --version`, 我们会发现版本并没有变化。难道是我们刚才的下载不成功？

先不用担心，在 Terminal 中输入 `python3 --version`, 看看是不是有变化？如果显示出了最新的版本，那么我们刚才的下载就成功了。

这里要注意的是，Mac 自带的 python 版本和我们刚才下载的最新版本并不冲突，所以不用担心。自带的版本主要是系统会用到，我们刚才下载的版本是我们之后做可视化会用到。这两个可以共存，没问题。

2. 下载 miniconda 或者 conda (https://docs.conda.io/en/latest/miniconda.html),选择 pkg， 如果你不是代码大神的话。

下载完成后，打开 Terminal, 输入：conda --version, 确保下载成功。

这里有一个变化需要说明一下。刚才我们下载了最新的 python 版本，但是我们下载完 conda 之后，在 Terminal 中按住 ctrl+n, 打开一个新窗口（之所以要打开新窗口是因为旧窗口还没有更新这些信息），然后不管是输入 python --version 还是 python3 --version， 发现 python 版本都变成了 conda 自带的 python 版本，而非我们刚才下载的最新版本。 

回到 [conda 下载界面](https://docs.conda.io/en/latest/miniconda.html#id2)，我们可以看到 `python version`。安装完 conda 之后，我们的 python 版本应该就是这个了。

然后：

1. conda install -c conda-forge notebook (from https://jupyter.org/install)
2. conda create -n dviz python=3.7

这里需要注意一下，根据[这篇帖子](https://uoa-eresearch.github.io/eresearch-cookbook/recipe/2014/11/20/conda/)，在 Terminal 输入 `conda search "^python$"` 可以看到我们可以选择的 python version。

3. conda activate divz
4. conda install ipykernel
5. python -m ipykernel install --user --name=dviz
6. conda install numpy altair vega_datasets bokeh scipy pandas scikit-learn matplotlib seaborn jupyter jupyterlab datashader holoviews
7. conda install -c conda-forge wordcloud spacy (solution source: https://stackoverflow.com/questions/48493505/packagesnotfounderror-the-following-packages-are-not-available-from-current-cha)
8. jupyter notebook
9. ctrl+c to shut it down
10.ctrl+n to open a new terminal window

注意：

1. 为什么我们需要虚拟环境：https://realpython.com/python-virtual-environments-a-primer/
2. Proceed ([y]/n)? 这时候直接输入 `y` 就好了
3. conda install spacy 有这个错误：

```
Collecting package metadata (current_repodata.json): done
Solving environment: failed with initial frozen solve. Retrying with flexible solve.
Solving environment: failed with repodata from current_repodata.json, will retry with next repodata source.
Collecting package metadata (repodata.json): done
Solving environment: failed with initial frozen solve. Retrying with flexible solve.
Solving environment: / 
Found conflicts! Looking for incompatible packages.
This can take several minutes.  Press CTRL-C to abort.
failed                                                                          

UnsatisfiableError: The following specifications were found to be incompatible with each other:

Output in format: Requested package -> Available versions
```

A question related to this question was [here](https://stackoverflow.com/questions/57518050/conda-install-and-update-do-not-work-also-solving-environment-get-errors), and [here](https://medium.com/@jiradett/fix-solving-environment-failed-with-initial-frozen-solve-retrying-with-flexible-solve-1c12d4b67c2d)

4. conda install wordcloud 时有这个错误：

```
Collecting package metadata (current_repodata.json): done
Solving environment: failed with initial frozen solve. Retrying with flexible solve.
Collecting package metadata (repodata.json): done
Solving environment: failed with initial frozen solve. Retrying with flexible solve.

PackagesNotFoundError: The following packages are not available from current channels:

  - wordcloud

Current channels:

  - https://repo.anaconda.com/pkgs/main/osx-64
  - https://repo.anaconda.com/pkgs/main/noarch
  - https://repo.anaconda.com/pkgs/r/osx-64
  - https://repo.anaconda.com/pkgs/r/noarch

To search for alternate channels that may provide the conda package you're looking for, navigate to

    https://anaconda.org

and use the search bar at the top of the page.
```

