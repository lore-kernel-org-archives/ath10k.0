Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ua0-x22a.google.com ([2607:f8b0:400c:c08::22a])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1erGeG-0002YM-TG
 for ath10k@lists.infradead.org; Thu, 01 Mar 2018 05:20:59 +0000
Received: by mail-ua0-x22a.google.com with SMTP id x4so3115583uaj.11
 for <ath10k@lists.infradead.org>; Wed, 28 Feb 2018 21:20:46 -0800 (PST)
MIME-Version: 1.0
From: vikas v <vikasv210@gmail.com>
Date: Thu, 1 Mar 2018 10:50:15 +0530
Message-ID: <CAHRgcqvDMb3Z0NUO50NPUTK_qWntQ5Gj6wkayfFLWEg1k96fJg@mail.gmail.com>
Subject: Linksys WUSB6100M not coming up with ath10k
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

Hi ,

Device Model : Linksys WUSB6100M
Kernel : 4.14.0-rc5-wt-ath+, 4.2
Backports version : 4.14-rc4, 4.14-rc5

Kernel Source : https://github.com/erstrom/linux-ath

Am trying to bringup the above specified USB card with ath10k driver.
After reading the FW files am getting the following logs.

[ 6214.584941] usb 2-1.4: USB disconnect, device number 13
[ 6218.904243] usb 2-1.4: new high-speed USB device number 14 using ehci-pci
[ 6219.014440] usb 2-1.4: New USB device found, idVendor=13b1, idProduct=0042
[ 6219.014446] usb 2-1.4: New USB device strings: Mfr=1, Product=2,
SerialNumber=3
[ 6219.014450] usb 2-1.4: Product: USBWLAN
[ 6219.014454] usb 2-1.4: Manufacturer: Qualcomm Atheros
[ 6219.014457] usb 2-1.4: SerialNumber: 12345678
[ 6219.015314] usb 2-1.4: WARNING: ath10k USB support is incomplete,
don't expect anything to work!
[ 6219.015672] usb 2-1.4: Direct firmware load for
ath10k/pre-cal-usb-2-1.4.bin failed with error -2
[ 6219.015695] usb 2-1.4: Direct firmware load for
ath10k/cal-usb-2-1.4.bin failed with error -2
[ 6219.016134] usb 2-1.4: qca9377 hw1.1 target 0x05020001 chip_id
0x00000000 sub 0000:0000
[ 6219.016138] usb 2-1.4: kconfig debug 1 debugfs 1 tracing 0 dfs 0 testmode 0
[ 6219.017441] usb 2-1.4: firmware ver WLAN.TF.1.0-00002-QCATFSWPZ-5
api 6 features ignore-otp crc32 c3e0d04f
[ 6219.055734] usb 2-1.4: board_file api 1 bmi_id N/A crc32 544289f7
[ 6221.308242] usb 2-1.4: Service connect timeout
[ 6221.308252] usb 2-1.4: Invalid resp message ID 0x1
[ 6221.308257] usb 2-1.4: failed to connect htt (-71)
[ 6221.412265] usb 2-1.4: could not init core (-71)
[ 6221.412358] usb 2-1.4: could not probe fw (-71)

Please share the fix for this errors or suggest appropriate driver and
kernel version.

Thanks ,
VIkas

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
