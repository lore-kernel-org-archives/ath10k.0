Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aLyoN-0002ae-P1
 for ath10k@lists.infradead.org; Wed, 20 Jan 2016 19:53:00 +0000
Received: by mail-wm0-x244.google.com with SMTP id u188so6301298wmu.0
 for <ath10k@lists.infradead.org>; Wed, 20 Jan 2016 11:52:39 -0800 (PST)
Received: from [10.0.0.10] ([185.120.125.21])
 by smtp.gmail.com with ESMTPSA id w1sm26456067wmd.2.2016.01.20.11.52.36
 for <ath10k@lists.infradead.org> (version=TLSv1/SSLv3 cipher=OTHER);
 Wed, 20 Jan 2016 11:52:37 -0800 (PST)
From: vagner <vagnerrener@gmail.com>
Subject: Qualcomm Atheros Device 0042 (rev 30) - Finally working :)
Message-ID: <569FE583.8010105@gmail.com>
Date: Wed, 20 Jan 2016 21:52:35 +0200
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org


     Hi,

> I bought a Lenovo laptop 4 weeks ago with an atheros on that and have 
> since tried to make the wireless card to work...
> Today I came across this drive...
> https://github.com/ajaybhatia/Qualcomm-Atheros-QCA9377-Wifi-Linux
> I installed linux-image-4.4  from debian experimental, downloaded your 
> drive and installed it with "./install.sh". It deteted my card and 
> made that work!
>
> uname -a
>
> 4.4.0-rc8-rt-amd64 #1 SMP PREEMPT RT Debian 4.4~rc8-1~exp1 
> (2016-01-04) x86_64 GNU/Linux
>
> The only thing that I am still facing is that, I get a boot message 
> error,  saying that it does not load the board bin.
>
> But it is working  for now...
>
> +++++++++++++++++++++++++++++
>
> lspci
>  Network controller: Qualcomm Atheros Device 0042 (rev 30)
>
> lshw -C network
>
>  *-network
>        description: Wireless interface
>        product: Qualcomm Atheros
>        vendor: Qualcomm Atheros
>        physical id: 0
>        bus info: pci@0000:02:00.0
>        logical name: wlp2s0
>        version: 30
>        serial: b8:86:87:53:d8:11
>        width: 64 bits
>        clock: 33MHz
>        capabilities: pm msi pciexpress bus_master cap_list ethernet 
> physical wireless
>        configuration: broadcast=yes driver=ath10k_pci 
> driverversion=4.4.0-rc8-rt-amd64 firmware=WLAN.TF.1.0-00267-1 
> ip=10.0.0.10 latency=0 link=yes multicast=yes wireless=IEEE 802.11abgn
>        resources: irq:130 memory:a1000000-a11fffff
>

> boot error message:
>
>  dmesg |grep ath10

> [   11.143242] ath10k_pci 0000:02:00.0: pci irq msi-x interrupts 8 
> irq_mode 0 reset_mode 0
> [   11.398620] ath10k_pci 0000:02:00.0: firmware: failed to load 
> ath10k/cal-pci-0000:02:00.0.bin (-2)
> [   11.398671] ath10k_pci 0000:02:00.0: Direct firmware load for 
> ath10k/cal-pci-0000:02:00.0.bin failed with error -2
> [   11.416212] ath10k_pci 0000:02:00.0: firmware: direct-loading 
> firmware ath10k/QCA9377/hw1.0/firmware-5.bin
> [   11.416218] ath10k_pci 0000:02:00.0: qca9377 hw1.0 target 
> 0x05020000 chip_id 0x003820ff sub 17aa:4035
> [   11.416221] ath10k_pci 0000:02:00.0: kconfig debug 1 debugfs 1 
> tracing 0 dfs 0 testmode 0
> [   11.416648] ath10k_pci 0000:02:00.0: firmware ver 
> WLAN.TF.1.0-00267-1 api 5 features ignore-otp crc32 79cea2c7
> [   11.478184] ath10k_pci 0000:02:00.0: firmware: failed to load 
> ath10k/QCA9377/hw1.0/board-2.bin (-2)
> [   11.478230] ath10k_pci 0000:02:00.0: Direct firmware load for 
> ath10k/QCA9377/hw1.0/board-2.bin failed with error -2
> [   11.610801] ath10k_pci 0000:02:00.0: firmware: direct-loading 
> firmware ath10k/QCA9377/hw1.0/board.bin
> [   11.610822] ath10k_pci 0000:02:00.0: board_file api 1 bmi_id N/A 
> crc32 544289f7
> [   13.397208] ath10k_pci 0000:02:00.0: htt-ver 3.1 wmi-op 4 htt-op 3 
> cal otp max-sta 32 raw 0 hwcrypto 1
> [   13.483133] ath10k_pci 0000:02:00.0 wlp2s0: renamed from wlan0
> [  186.996289] Modules linked in: appletalk ax25 ipx p8023 p8022 psnap 
> llc cpufreq_userspace cpufreq_powersave cpufreq_stats 
> cpufreq_conservative bnep binfmt_misc nfsd auth_rpcgss oid_registry 
> nfs_acl nfs lockd grace fscache sunrpc parport_pc ppdev lp parport 
> arc4 rtsx_usb_sdmmc rtsx_usb_ms mmc_core memstick rtsx_usb mfd_core 
> uvcvideo videobuf2_vmalloc videobuf2_memops videobuf2_v4l2 
> videobuf2_core v4l2_common videodev media ath10k_pci(O) btusb btrtl 
> joydev snd_hda_codec_hdmi ath10k_core(O) snd_hda_codec_conexant 
> snd_hda_codec_generic intel_rapl iosf_mbi intel_powerclamp coretemp 
> ath(O) kvm_intel mac80211(O) kvm irqbypass crct10dif_pclmul 
> crc32_pclmul crc32c_intel snd_hda_intel snd_hda_codec snd_hda_core 
> snd_hwdep snd_pcm snd_timer snd soundcore sha256_ssse3 sha256_generic 
> hmac drbg ansi_cprng cfg80211(O)
> [  186.996362] CPU: 1 PID: 574 Comm: irq/133-ath10k_ Tainted: 
> G           O    4.4.0-rc8-rt-amd64 #1 Debian 4.4~rc8-1~exp1
> [  186.996405]  [<ffffffffa0849a12>] ? 
> ath10k_wmi_event_mgmt_rx+0x232/0x3e0 [ath10k_core]
> [  186.996411]  [<ffffffffa083d5b0>] ? 
> ath10k_htc_build_tx_ctrl_skb+0xb0/0xb0 [ath10k_core]
> [  186.996416]  [<ffffffffa083d80d>] ? 
> ath10k_htc_rx_completion_handler+0x25d/0x4f0 [ath10k_core]
> [  186.996422]  [<ffffffffa083d5b0>] ? 
> ath10k_htc_build_tx_ctrl_skb+0xb0/0xb0 [ath10k_core]
> [  186.996426]  [<ffffffffa0647eb6>] ? 
> ath10k_pci_process_rx_cb+0x186/0x200 [ath10k_pci]
> [  186.996433]  [<ffffffffa064a978>] ? 
> ath10k_ce_per_engine_service+0x78/0xd0 [ath10k_pci]
> [  347.908870] ath10k_pci 0000:02:00.0: no channel configured; 
> ignoring frame(s)!
>
    Vagner

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
