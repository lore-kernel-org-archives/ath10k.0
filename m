Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gv2eq-0003nI-3c
 for ath10k@lists.infradead.org; Sat, 16 Feb 2019 16:17:42 +0000
Subject: Re: QCA9888: Driver/Firmware Crash After Initialization
References: <460b8a83-bb24-17c7-1e73-21c6ddd0280f@wagsky.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <81a7f20d-49d2-24d1-9b9e-69b58ea5d721@candelatech.com>
Date: Sat, 16 Feb 2019 08:17:29 -0800
MIME-Version: 1.0
In-Reply-To: <460b8a83-bb24-17c7-1e73-21c6ddd0280f@wagsky.com>
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
To: Jeff Kletsky <lede@allycomm.com>, ath10k@lists.infradead.org

On 02/15/2019 05:12 PM, Jeff Kletsky wrote:
>
> TL;DR
>
> QCA9880 on PCIe on IPQ4019 bring-up is seen, can be can be configured,
> will come up, but seems to time out in ath10k-ct driver communication.
>
> "Hangs always", with firmware crashes occasionally seen.

Please send me full dmesg output of the boot attempt.

Thanks,
Ben

>
> Theories include:
>
> * Problem with ath10k driver and/or firmware
> * Misconfiguration of GPIO or other DTS issues
>
>
> Similar behavior seen on the "plain" ath10k drivers / firmware
>
> "Linksys Dallas WiFi AP router based on Qualcomm AP DK07.1-c1 "
>
> firmware ver 10.4b-ct-9888-fW-012-5815a26a
>
>
> My search of this list, or the Internet, in general, didn't reveal
> anything obvious.  Logs below use ath10k-ct drivers/firmware based on
> the suggestions of a more-experienced OpenWrt dev than I am.
>
>
> ==> How can I debug / resolve this?
>
>
> Logs linked below, additional data available as requested.
>
> Thanks!
>
> Jeff Kletsky
>
>
> ---
>
>
> (the details)
>
> Hardware is a Linksys EA8300 "Dallas", with OEM DTS declaring
> model = "Linksys Dallas WiFi AP router based on Qualcomm AP DK07.1-c1 ";
> running on a bring-up under current OpenWrt `master` from 2019-02-14.
>
>
> $ git merge-base openwrt/master HEAD
> 94993a79f8269274e9087d2ce3aed10f4e34cb5f
>
>
> Device boots and the IPQ4019 wireless subsystems seem
> responsive. Serial and SSH access available, along with any
> OpenWrt-packaged utilities.
>
> at10k-ct drivers and firmware for the QCA9888 appear to load both the
> extracted pre-cal data from the ART partition, as well as either the
> "default" board data, or that from the OEM firmware from the "FCC"
> directory, boardData_2_0_QCA9888_5G_Y9690_SBS_HB.bin
>
> The location of the pre-cal data as well as that choice of board data
> has been confirmed by inspection of the OEM's initialization shell
> scripts.
>
> The OEM firmware executes a three-step init process, based on the logs:
>   1) "Caldata" from ART extraction
>   2) boardData_2_0_QCA9888_5G_Y9690_SBS_HB.bin
>   3) athwlan.bin and athwlan.codeswap.bin
>
>
>
> The logs around initialization of the QCA9888 seems reasonable, with
> the "expected" lack of failure messages suggesting success.
>
> (Side note: it would be greatly appreciated one day if those messages
>  showed successes as well.)
>
>
>
> Observed behavior, on editing `/etc/config/wireless` to enable the
> QCA9888 (only) and `wifi up`
>
> * Device brings up AP
>   (as seen by `iw dev wlanN-M scan` on another device)
> * One of three failure types "always" seen (there may be more):
>   * Wireless comes up for 1-2 min, then becomes non-responsive
>   * Rare: Firmware crash reported, wireless system becomes non-responsive
>   * Seen only once: Device runs; `wifi down` causes crash
> * Wireless subsystem does not recover
>
>     Full log of one "typical" run available at https://pastebin.com/3ruVuVyj
>     ath10k-ct, extracted pre-cal data,
>     boardData_2_0_QCA9888_5G_Y9690_SBS_HB.bin symlinked to board.bin
>     and board-2.bin as a zero-length file
>
>     Full log including "firmware crashed!" available at https://pastebin.com/Sk9cpLnD
>     ath10k-ct, extracted pre-cal data,
>     "stock" ath10k-firmware-qca9888-ct board files/links
>
> "Non-responsive" typically results in an attempt to restart the
> device, which provides logs similar to
>
> [  195.521893] ath10k_pci 0000:01:00.0: wmi command 40859 timeout, restarting hardware
> [  195.522265] ath10k_pci 0000:01:00.0: failed to send wmi nop: -11
> [  195.529372] ath10k_pci 0000:01:00.0: failed to send pdev bss chan info request: -108
> [  195.536021] ath10k_pci 0000:01:00.0: removing peer, cleanup-all, deleting: peer cdfcca00 vdev: 0 addr: 30:23:03:67:e9:57
> [  195.637550] ieee80211 phy0: Hardware restart was requested
> [  198.801805] ath10k_pci 0000:01:00.0: failed to receive control response completion, polling..
> [  199.841840] ath10k_pci 0000:01:00.0: Service connect timeout
> [  199.842149] ath10k_pci 0000:01:00.0: failed to connect htt (-110)
> [  199.943024] ath10k_pci 0000:01:00.0: Could not init core: -110
> [  199.943066] ------------[ cut here ]------------
> [  199.947930] WARNING: CPU: 1 PID: 36 at backports-4.19.7-1/net/mac80211/util.c:1940 ieee80211_reconfig+0x9c/0x130c [mac80211]
> [  199.952581] Hardware became unavailable during restart.
> [...]
>
> followed by many similar warnings, along the lines of
>
> [  200.459127] ------------[ cut here ]------------
> [  200.464051] WARNING: CPU: 1 PID: 36 at backports-4.19.7-1/net/mac80211/driver-ops.h:19 ieee80211_stop_ap+0x180/0x2f0 [mac80211]
> [  200.468514] wlan0:  Failed check-sdata-in-driver check, flags: 0x9
> [...]
>
> at various s/r within driver-ops code.
>
>
>
> ath10k-ct firmware identifies as
>
> [ 12.160172] ath10k_pci 0000:01:00.0:
>   firmware ver 10.4b-ct-9888-fW-012-5815a26a api 5
>   features mfp,peer-flow-ctrl,txstatus-noack,wmi-10.x-CT,ratemask-CT,
> regdump-CT,txrate-CT,flush-all-CT,pingpong-CT,ch-regs-CT,nop-CT,
>     set-special-CT,tx-rc-CT,cust-stats-CT,txrate2-CT
>   crc32 4a66be6f
>
> OpenWrt package identifiers
>
> ath10k-firmware-qca4019-ct - 2018-10-10-d366b80d-1
> ath10k-firmware-qca9888-ct - 2018-10-10-d366b80d-1
> kmod-ath10k-ct - 4.14.99+2018-12-20-118e16da-2
>
>
>
>
>
>
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
