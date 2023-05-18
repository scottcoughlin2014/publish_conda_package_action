# Publish Anaconda Package Action
A Github Action to publish your Python package to Anaconda Cloud.

Starting 2.0.0, it uses mamba (from [boa](https://boa-build.readthedocs.io/en/latest/index.html)) to build the package (faster than conda build command...)

### Example workflow
```yaml
name: Publish

on:
  release:
    types: [published]

jobs:
  publish:
    runs-on: ubuntu-latest
    steps:

    - name: Checkout
      uses: actions/checkout@v2

    - name: publish-to-conda
      uses: scottcoughlin2014/publish_conda_package_action@v1.0.0-beta
      with:
        # CondaDir: locate the directory containing your meta.yml, conda_build_config.yaml (...) files
        CondaDir: 'conda'
        # Channels: You can add more channel with a space separator
        Channels: 'conda-forge an-other-chan' 
        # Platforms: remove one or more of these platforms
        Platforms: 'osx-64 linux-32 linux-64 win-32 win-64 noarch'
        CondaUsername: ${{ secrets.CONDA_USERNAME }}
        CondaPassword: ${{ secrets.CONDA_PASSWORD }}
        CondaChannel: 'either your conda user name or organization name'
```

* Configure CONDA_USERNAME and CONDA_PASSWORD secrets on your settings repository
