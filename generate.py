import yaml
from packaging import version
import argparse
from itertools import product
import os
import re

from mugibuilder import *

V0_5_0 = 'v0.5.0'

def flavour_name(tag, compiler, arch):
    return "-".join(["tinyspline", tag, compiler, arch])

def build_step(tag, compiler, arch, local):
    name = "flavour {} {} {}".format(tag, compiler, arch)
    c = Commander(name, None, compiler, arch, local)
    c.aqt_install_mingw()
    c.download_cmake()
    c.extract_cmake()
    c.call_vcvars()
    tinyspline = c.git_clone('https://github.com/msteinbeck/tinyspline.git', tag)
    c.pushd(tinyspline)
    c.mkdir('build')
    c.pushd('build')
    if is_msvc(compiler):
        arch_ = {
            ARCH_32: 'Win32',
            ARCH_64: 'x64'
        }
        c._cmds.append('cmake -G "Visual Studio 16 2019" -DBUILD_SHARED_LIBS=ON -A {} ..'.format(arch_[arch]))
    else:
        c._cmds.append('cmake -G "MinGW Makefiles" -DBUILD_SHARED_LIBS=ON ..')
    c.cmake_build()
    c.cmake_install("C:/tinyspline")
    c.popd()
    c.popd()
    local_path = "C:/tinyspline"
    flavour_base = flavour_name(tag, compiler, arch)
    zip_name = flavour_base + ".zip"
    c.archive(zip_name, local_path)
    c.rmdir(local_path)
    c.rmdir(tinyspline)
    return c.pack()

def install_aqt_step(local):
    c = Commander("install aqtinstall", local=local)
    c.pip_install_aqtinstall()
    return c.pack()

def main():
    parser = argparse.ArgumentParser()
    add_spec_args(parser)
    parser.add_argument('--tags', nargs='+', help="tags to build")
    args = parser.parse_args()
    compilers, archs = get_specs(args)
    if args.tags is None:
        tags = [V0_5_0]
    else:
        tags = args.tags
    steps_local = []
    steps_github = []
    steps_local.append(install_aqt_step(local=True))
    steps_github.append(install_aqt_step(local=False))
    release_step = ReleaseStep()
    for tag in tags:
        for compiler, arch in filter_specs(product(compilers, archs)):
            print(tag, compiler, arch)
            steps_local.append(build_step(tag, compiler, arch, local=True))
            steps_github.append(build_step(tag, compiler, arch, local=False))
            flavour_base = flavour_name(tag, compiler, arch)
            zip_name = flavour_base + ".zip"
            release_step.add(zip_name)
    steps_github.append(release_step.github())
    base = os.path.dirname(__file__)
    workflow_path = os.path.join(base, ".github", "workflows", "main.yml")
    save_workflow(workflow_path, steps_github, on = ON_TAG, runs_on=WINDOWS_2019)
    batch_path = os.path.join(base, "main.bat")
    save_batch(batch_path, steps_local)

if __name__ == "__main__":
    main()
