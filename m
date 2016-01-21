Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-yk0-x22f.google.com ([2607:f8b0:4002:c07::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aMAlL-0004z8-66
 for ath10k@lists.infradead.org; Thu, 21 Jan 2016 08:38:39 +0000
Received: by mail-yk0-x22f.google.com with SMTP id k129so40669041yke.0
 for <ath10k@lists.infradead.org>; Thu, 21 Jan 2016 00:38:18 -0800 (PST)
MIME-Version: 1.0
Date: Thu, 21 Jan 2016 09:38:18 +0100
Message-ID: <CANCHnQoi_PiQC=Y2H_5eotKG1g9La1=Sxcob2C2cww-MfX8QYQ@mail.gmail.com>
Subject: 5GHz AP on a QCA988x
From: Jeroen Roovers <jeroen.roovers@airfi.aero>
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

02:00.0 Network controller: Qualcomm Atheros QCA986x/988x 802.11ac
Wireless Network Adapter
        Flags: bus master, fast devsel, latency 0, IRQ 28
        Memory at fe200000 (64-bit, non-prefetchable) [size=2M]
        Expansion ROM at fe400000 [disabled] [size=64K]
        Capabilities: [40] Power Management version 2
        Capabilities: [50] MSI: Enable+ Count=1/8 Maskable+ 64bit-
        Capabilities: [70] Express Endpoint, MSI 00
        Capabilities: [100] Advanced Error Reporting
        Capabilities: [140] Virtual Channel
        Capabilities: [160] Device Serial Number 00-00-00-00-00-00-00-00
        Kernel driver in use: ath10k_pci
        Kernel modules: ath10k_pci

Vendor/device ID: 168c:003c

I am trying to get a 5GHZ AP working on the above device, using a
Linux 4.4.0 kernel on a generic PC right now, in hopes of getting same
to work on an embedded (ARM, but it's not important) system in the
near future.

Any attempt to get that up ends in a regulatory-based refusal to open
IR on any 5GHz band frequency, even when I add "regulatory onus" and a
new XZ region (hey, this is intended to work especially in
"international waters") in a db.txt I define myself which should grant
everything I ever wanted. Is there something the firmware is
overriding here?

Firmware as of the latest would be:

/lib/firmware/ath10k/QCA988X/hw2.0/firmware-5.bin_10.2.4.70.17-2

I could attach logs but I thought I might be missing something very obvious.


Kind regards,
     jer

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
