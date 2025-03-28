import { type Build } from 'xbuild';

const build: Build = {
    common: {
        project: 'pcre2',
        archs: ['x64'],
        variables: [],
        copy: {},
        defines: [],
        options: [
            ['PCRE2_BUILD_PCRE2_16', true],
            ['PCRE2_BUILD_PCRE2_32', true]
        ],
        subdirectories: ['pcre2'],
        libraries: {
            'pcre2-8-static': { name: 'pcre2-8' },
            'pcre2-16-static': { name: 'pcre2-16' },
            'pcre2-32-static': { name: 'pcre2-32' },
        },
        buildDir: 'build',
        buildOutDir: '../libs',
        buildFlags: []
    },
    platforms: {
        win32: {
            windows: {},
            // android: {
            //     archs: ['x86', 'x86_64', 'armeabi-v7a', 'arm64-v8a'],
            // }
        },
        linux: {
            linux: {}
        },
        darwin: {
            macos: {}
        }
    }
}

export default build;