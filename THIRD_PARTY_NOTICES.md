# Third-Party Notices

360 Audio Exporter can use external `ffmpeg` and `ffprobe` binaries for media processing.

## FFmpeg

FFmpeg is a separate open-source project: https://ffmpeg.org/

Release builds may include redistributable static macOS FFmpeg binaries from https://evermeet.cx/ffmpeg/.

Those binaries are not authored by this project. They are distributed under the licenses used by FFmpeg and its enabled libraries. Depending on the included codecs and build options, this commonly includes GPL components.

FFmpeg source code and license information are available from:

- https://ffmpeg.org/legal.html
- https://ffmpeg.org/download.html
- https://evermeet.cx/ffmpeg/

If you build this app yourself, you can either:

- provide your own `ffmpeg` and `ffprobe` paths in Settings,
- place executable binaries at `Resources/ffmpeg` and `Resources/ffprobe` before packaging,
- install FFmpeg separately through a package manager.
