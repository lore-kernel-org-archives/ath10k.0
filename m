Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.duncanthrax.net ([2001:470:70c5:1111::170])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WtNNS-000510-N1
 for ath10k@lists.infradead.org; Sat, 07 Jun 2014 20:38:12 +0000
Message-ID: <5393781C.8090403@stackframe.org>
Date: Sat, 07 Jun 2014 22:37:48 +0200
From: Sven Schnelle <svens@stackframe.org>
MIME-Version: 1.0
Subject: Re: compat-wireless-2014-05-22 breaks ath10k in an Archer C7 v2
References: <CALCETrU=8+tnptdfva4p27nA-5=E31DwXagoLqUxYcLtEKrB+w@mail.gmail.com>
 <CA+BoTQmUyvTr+ga81EacbMkE4UVtMBP2PfBs_vH-PF4OvHuZQg@mail.gmail.com>
 <53905134.8010303@stackframe.org> <87tx7zoafw.fsf@kamboji.qca.qualcomm.com>
 <5390594F.4070801@stackframe.org>
 <CA+BoTQ=QCNcbWmhEd1vyXDZY1yy0yvz_VSFqnOzOzYGMyxjGJw@mail.gmail.com>
In-Reply-To: <CA+BoTQ=QCNcbWmhEd1vyXDZY1yy0yvz_VSFqnOzOzYGMyxjGJw@mail.gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: ath10k@lists.infradead.org

Hi Michal,

Am 05.06.2014 14:20, schrieb Michal Kazior:
> This seems to confirm otp fails to load with error code 2. The assert 
> stack trace points to copy engine in ROM image. Wierd. Anyway, I've 
> extracted firmware files from TP-Link Archer C7 original rootfs. Can 
> you give it a try, please? See the OpenWRT ticket: 
> https://dev.openwrt.org/ticket/16589 

i tried, but the result doesn't look better:

[    9.640000] ath10k: pci irq legacy irq_mode 0 reset_mode 0
[    9.730000] ath10k: otp calibration failed: 2
[   10.540000] ath10k: UART prints enabled
[   10.600000] ath10k: qca988x hw2.0 (0x4100016c, 0x043202ff) fw 
10.1.467-tplink-a-c7 api 2 htt 2.1

I removed the error return in ath10k, that's why the firmware starts 
even with the otp error. I don't see the Assertion failure with this otp 
firmware:

CLI>build_version=0x11, rom_version=0x41020000, ram_version=0x11, 
stack_size=6348
reset reason=0x5

Image startup of Normal mode
Mac address is : 00:03:7f:4f:00:16
alloc rem: 197492
**WMI Service Ready **
NUM_DEV=16
TGT_VER: 4100016C
RegDomain: 0, CfgCtl: 224 - 224
ar_wal_peer_attach: num_peer_entries 145, num_tid_entries 443
allocated 64 tids at 0x439a28 (each 96 bytes)
allocated 379 tids in IRAM at 0x9baf34 (each 96 bytes)
allocated 64 stateless tids at 0x43b250 (each 40 bytes)
### turn on Tx completion index tracking ###
**WMI Ready **

Just to be sure, here are the md5sums of the firmware files i'm using:

root@OpenWrt:/# md5sum /lib/firmware/ath10k/QCA988X/hw2.0/*
710fb9b582eda3d23728dee757d9ff85 
/lib/firmware/ath10k/QCA988X/hw2.0/board.bin
13385cef5d83c3fa96dfaaeb69c155d9 
/lib/firmware/ath10k/QCA988X/hw2.0/firmware-2.bin
3c2251c94974367c170e90030ca04f99 /lib/firmware/ath10k/QCA988X/hw2.0/utf.bin

Sven

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
