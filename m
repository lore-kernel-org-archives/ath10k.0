Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from icp-osb-irony-out4.external.iinet.net.au ([203.59.1.220])
 by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
 id 1i3E0Z-0005x0-Qx
 for ath10k@lists.infradead.org; Thu, 29 Aug 2019 06:34:13 +0000
From: Greg Ungerer <gerg@kernel.org>
Subject: problems with a 9377 based SDIO module
Message-ID: <176a3a2d-ff81-3b72-86af-73c70df729f4@kernel.org>
Date: Thu, 29 Aug 2019 16:33:58 +1000
MIME-Version: 1.0
Content-Language: en-US
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
Cc: erik.stromdahl@gmail.com


Hi Erik,

I have a Compex WSD377 WiFi module with SDIO interface on a new
iMX6 based platform. I am trying to get the module going but am
having problems with it at probe/init time.

Ultimately what I see at ath10k_sdio module load time is:

<4>ath10k_sdio mmc0:0001:1: WARNING: ath10k SDIO support is incomplete, don't expect anything to work!
<6>ath10k_sdio mmc0:0001:1: qca9377 hw1.1 sdio target 0x05020001 chip_id 0x00000000 sub 0000:0000
<6>ath10k_sdio mmc0:0001:1: kconfig debug 1 debugfs 0 tracing 0 dfs 0 testmode 0
<6>ath10k_sdio mmc0:0001:1: firmware ver WLAN.TF.1.1.1-00061-QCATFSWPZ-1 api 5 features ignore-otp crc32 7746e551
<3>ath10k_sdio mmc0:0001:1: failed to fetch board data for bus=sdio,vendor=0271,device=0701,subsystem-vendor=0000,subsystem-device=0000 from ath10k/QCA9377/hw1.0/board-2.bin
<6>ath10k_sdio mmc0:0001:1: board_file api 1 bmi_id N/A crc32 78c48ff6
<4>ath10k_sdio mmc0:0001:1: failed to write to address 0x828: -84
<4>ath10k_sdio mmc0:0001:1: unable to disable sdio interrupts: -84
<3>ath10k_sdio mmc0:0001:1: could not start HIF: -84
<3>ath10k_sdio mmc0:0001:1: could not init core (-84)
<4>mmc0: queuing unknown CIS tuple 0x01 (3 bytes)
<4>mmc0: queuing unknown CIS tuple 0x1a (5 bytes)
<4>mmc0: queuing unknown CIS tuple 0x1b (8 bytes)
<4>mmc0: queuing unknown CIS tuple 0x14 (0 bytes)
<3>ath10k_sdio mmc0:0001:1: could not probe fw (-84)

Tracing I can see that a fair bit of IO has gone on when it finally
gets to the "failed to write to address 0x828: -84". I assume the
bulk writes up to that point are the firmware download.

I am using a linux-5.2 kernel with your patches at
https://github.com/erstrom/linux-ath.git, v5.2-ath10k-sdio branch.

My primary concern is if I am using the write firmware.

I have a firmware-sdio-5.bin which is the QCA9377/hw1.0/untested/firmware-sdio-5.bin_WLAN.TF.1.1.1-00061-QCATFSWPZ-1
file from the ath10k-firmware tree at https://github.com/kvalo/ath10k-firmware.git.
And the board-sdio.bin which is the bdwlan30.bin from https://github.com/boundarydevices/qca-firmware.git.

I ended up with those from comments made in
https://ath10k.infradead.narkive.com/lgpFutCZ/patch-00-11-sdio-support-for-ath10k
But maybe I am off-track here?

Does the kernel trace give any clues as what the problem may be?
Any other ideas?

Regards
Greg


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
