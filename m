Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.duncanthrax.net ([2001:470:70c5:1111::170])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X07W7-0006zo-DS
 for ath10k@lists.infradead.org; Thu, 26 Jun 2014 11:07:00 +0000
Received: from port-92-198-130-130.static.qsc.de ([92.198.130.130]
 helo=[10.128.129.30])
 by smtp.eurescom.eu with esmtpsa (TLSv1:DHE-RSA-AES128-SHA:128)
 (Exim 4.80.1) (envelope-from <svens@stackframe.org>)
 id 1X07Ve-0005WR-RE
 for ath10k@lists.infradead.org; Thu, 26 Jun 2014 13:06:30 +0200
Message-ID: <53ABFFAC.1050603@stackframe.org>
Date: Thu, 26 Jun 2014 13:10:36 +0200
From: Sven Schnelle <svens@stackframe.org>
MIME-Version: 1.0
Subject: Firmware crash
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

Hi List,

i've seen a strange firmware crash:

Athos/Xt BSP version Oct 19 2012-16:00:59
Baud rate host set is 115200.
Mac address is : 00:03:07:12:34:56
alloc rem: 197524
**WMI Service Ready **
NUM_DEV=16
TGT_VER: 4100016C
RegDomain: 0, CfgCtl: 224 - 224
ar_wal_peer_attach: num_peer_entries 145, num_tid_entries 443
allocated 64 tids at 0x439a08 (each 96 bytes)
allocated 379 tids in IRAM at 0x9baeb4 (each 96 bytes)
allocated 64 stateless tids at 0x43b230 (each 40 bytes)
### turn on Tx completion index tracking ###
**WMI Ready **
TGT_VER: 4100016C
RegDomain: 3A, CfgCtl: 16 - 16
peer create command for ****0:3:7:12:34:56****
_wlan_vdev_set_param: unimplemented command 0x2
_wlan_vdev_set_param: unimplemented command 0x7
_wlan_vdev_set_param: unimplemented command 0x8
TODO: Add DBGLOG for WMM Params
TODO: Add DBGLOG for WMM Params
TODO: Add DBGLOG for WMM Params
TODO: Add DBGLOG for WMM Params
TSF id: 1, free_tsf_id_map: 1
assertion failed? pc=0x9a0e15, line=0, dump area=0x401930
Target ID: 0x4100016c (1090519404)
Debug Info:
0x4100016c 0x00000000 0x009a0e15 0x00000000
0x00000000 0x00000000 0x00000000 0x00000000
0x00000000 0x00000000 0x00000000 0x00000000
0x00000000 0x00000000 0x00000000 0x00000000
0x00000000 0x00000000 0x00000000 0x009a0e15
0x00000000 0x00401930 0x00000000 0x00000000
0x00000000 0x00000000 0x00000000 0x00000000
0x00000000 0x00000000 0x00000000 0x00000000
0x00000000 0x00000000 0x00000000 0x00000000
0x00000000 0x00000000 0x00000000 0x00000000
0x00000000 0x00000000 0x00000000 0x00000000
0x00000000 0x00000000 0x00000000 0x00000000
0x00000000 0x00000000 0x00000000 0x00000000
0x00000000 0x00000000 0x00000000 0x00000000
0x00000000 0x00000000 0x00000000 0x00000000

This happened on two APs at the same time, which were running before without
problems. As both APs are in short distance (about 10m) i guess it was 
caused
by some packet on the Air.

I see a 'assertion failed' above, can anyone tell what that assertion is?

Firmware Version is:

[   27.120000] ath10k: hardware name qca988x hw2.0 version 0x4100016c
[   27.130000] ath10k: firmware version: 10.1.467.2-1


Thanks
Sven

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
