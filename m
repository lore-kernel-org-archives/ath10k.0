Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail1.g8.pair.com ([66.39.4.88])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aunEz-0004VA-BL
 for ath10k@lists.infradead.org; Mon, 25 Apr 2016 20:36:21 +0000
Received: from [192.168.138.12] (pool-98-117-193-45.bltmmd.fios.verizon.net
 [98.117.193.45])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail1.g8.pair.com (Postfix) with ESMTPSA id 7B929E6244
 for <ath10k@lists.infradead.org>; Mon, 25 Apr 2016 16:35:59 -0400 (EDT)
From: Michael Ney <neym@vorklift.com>
Subject: QCA6174 firmware crash
Message-Id: <FEB50C50-4C7B-441A-A9E4-90D7E02C9939@vorklift.com>
Date: Mon, 25 Apr 2016 16:35:59 -0400
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
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

Hello,

I ran into a crash with the QCA6174 firmware and I was hoping someone knew a solution to it or could pass it on to Qualcomm Atheros to be resolved.

The hardware version is QCA6174 HW 2.1

The firmware version I am using is SW_RM.1.1.1-00157-QCARMSWPZ-1 (the same version available for download from Kalle Valo's git for QCA6174 HW 2.1).

The crash occurs when receiving certain frame types. 


Reproduction:

1. Place QCA6174 into monitor mode.

2. Use another card (such as an ath9k) to send an Null Data or QOS Null Data with CF-ACK or CF-Poll (frame type 2, frame subtypes 5, 6, 7, D, E, or F). The DA of the frame must not be the MAC of the QCA6174 (the crash does not happen if the DA is the MAC).

3. Firmware immediately crashes.


The crash's Firmware register dump is:

[00] 0x05010000 0x00000000 0x00000000 0x00000000
[04] 0x00000000 0x00000000 0x00000000 0x00000000
[..]
[16] 0x00000000 0x00000000 0x00000000 0x00000000
[20] 0x00000000 0x004019F0 0x00000000 0x00000000
[24] 0x00000000 0x00000000 0x00000000 0x00000000
[..]
[56] 0x00000000 0x00000000 0x00000000 0x00000000



Thanks for any help,

Michael


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
