<div align="center">

<img src="noctune-logo.svg" alt="Noctune logo" width="132" />

# Noctune

**Your music, your library, your next favorite track.**

A desktop music player for Windows, Linux, and macOS, with high-quality playback, synced lyrics, listening-history tools, and personalized discovery.

<p>
  <a href="https://github.com/Erpt77/Noctune/releases"><img src="https://img.shields.io/github/v/release/Erpt77/Noctune?style=for-the-badge&label=Latest%20release&color=8b83ff" alt="Latest release" /></a>
  <a href="https://github.com/Erpt77/Noctune/actions"><img src="https://img.shields.io/github/actions/workflow/status/Erpt77/Noctune/desktop.yml?branch=main&style=for-the-badge&label=Builds" alt="Build status" /></a>
  <img src="https://img.shields.io/badge/platform-Windows%20%7C%20Linux%20%7C%20macOS-8b83ff?style=for-the-badge" alt="Windows, Linux, and macOS" />
</p>

[**Downloads**](https://github.com/Erpt77/Noctune/releases) · [Builds & test results](https://github.com/Erpt77/Noctune/actions) · [Report a bug](https://github.com/Erpt77/Noctune/issues)

</div>

---

## Screenshots

<div align="center">
  <img src="screenshots/homepage.png" alt="Noctune home screen" width="84%" />
  <br/><br/>
  <img src="screenshots/player.png" alt="Noctune music player and lyrics" width="84%" />
</div>

## What is Noctune?

Noctune is a desktop music player focused on a comfortable listening experience and music discovery. It combines playback and library tools with synced lyrics, listening-history integrations, and personalized Daily Mixes.

## Features

- **Desktop playback** — listen to music in a dedicated desktop app.
- **Personalized Daily Mixes** — Noctune-generated mixes based on local listening history, liked songs, downloads, and Last.fm signals when connected. These are Spotify-style recommendations, not Spotify's private Daily Mix feed.
- **YouTube Music integration** — access supported YouTube Music features from the app.
- **Synced lyrics** — follow lyrics while a track plays when lyric data is available.
- **Last.fm scrobbling** — connect Last.fm to track listening activity and support music discovery (requires your own Last.fm API key and shared secret).
- **Local audio playback** — open local audio files, including FLAC, and play them through the desktop player.
- **Library tools** — manage your music and playback experience in one place.
- **Cross-platform builds** — packages are prepared for Windows, Linux, and macOS.

> **Spotify account linking is not implemented yet.** Noctune does not currently connect to Spotify or import Spotify Daily Mixes. Available recommendations depend on local listening signals and configured services. Lossless downloads also require a configured addon/source that actually provides lossless audio.

## Downloads

Visit **[Noctune Releases](https://github.com/Erpt77/Noctune/releases)** for published installers and packages.

| Operating system | Package formats |
| --- | --- |
| Windows | .exe installer and portable .zip |
| Linux | .AppImage, .deb, and .rpm |
| macOS | .zip app bundle |

If no release has been published yet, open **[GitHub Actions](https://github.com/Erpt77/Noctune/actions)**, select the latest successful **Build and Release Desktop Apps** run, and look under **Artifacts**. Actions artifacts are build outputs and may expire; published release files are the preferred download location.

## Installation

1. Open the [Releases page](https://github.com/Erpt77/Noctune/releases).
2. Download the file that matches your operating system.
3. Install or launch it:
   - **Windows:** run the .exe installer, or extract the portable .zip.
   - **Linux:** open the .deb with your package installer, or make the .AppImage executable and run it. Use the .rpm on compatible distributions.
   - **macOS:** extract the .zip and move or launch the app as appropriate for your system.

## Build status and contributing

The [GitHub Actions page](https://github.com/Erpt77/Noctune/actions) shows build and test results for the desktop targets. Bug reports and feature suggestions are welcome through [GitHub Issues](https://github.com/Erpt77/Noctune/issues).

## Disclaimer

Noctune is an independent, open-source desktop project. It is not affiliated with, endorsed by, or sponsored by Google, YouTube, YouTube Music, Spotify, Apple, or Last.fm. Product names and trademarks belong to their respective owners.

Noctune does not host or distribute copyrighted music. Access to content and third-party services depends on those services and their terms. Use the app responsibly and follow applicable service terms and copyright laws.

## Credits

Noctune is a community fork based on [LastWave Desktop](https://github.com/Clash-Projects/LastWave-Desktop). Thanks to the original project contributors and the open-source libraries that make this project possible.
