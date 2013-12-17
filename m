Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mtareserve3.acsu.buffalo.edu ([128.205.7.163]
 helo=mtareserve1.acsu.buffalo.edu)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vt2Yl-0003xE-3P
 for ath10k@lists.infradead.org; Tue, 17 Dec 2013 21:52:11 +0000
Received: from localmailB.acsu.buffalo.edu (localmailb.acsu.buffalo.edu
 [128.205.5.200])
 by mtareserve1.acsu.buffalo.edu (Postfix) with ESMTP id 29C512D79
 for <ath10k@lists.infradead.org>; Tue, 17 Dec 2013 16:51:45 -0500 (EST)
Received: from localmailB.acsu.buffalo.edu (localhost [127.0.0.1])
 by localhost (Postfix) with SMTP id 255ADCBDF
 for <ath10k@lists.infradead.org>; Tue, 17 Dec 2013 16:51:45 -0500 (EST)
Received: from localmailB.acsu.buffalo.edu (localhost [127.0.0.1])
 by localmailB.acsu.buffalo.edu (Postfix) with ESMTP id 956BBCBDC
 for <ath10k@lists.infradead.org>; Tue, 17 Dec 2013 16:51:44 -0500 (EST)
Received: from smtp.buffalo.edu (smtp4.acsu.buffalo.edu [128.205.5.229])
 by localmailB.acsu.buffalo.edu (Prefixe) with ESMTP id 90222CBDB
 for <ath10k@lists.infradead.org>; Tue, 17 Dec 2013 16:51:44 -0500 (EST)
Received: from mail-qa0-f53.google.com (mail-qa0-f53.google.com
 [209.85.216.53]) (Authenticated sender: lsun3@buffalo.edu)
 by smtp.buffalo.edu (Postfix) with ESMTPSA id 754058F92
 for <ath10k@lists.infradead.org>; Tue, 17 Dec 2013 16:51:44 -0500 (EST)
Received: by mail-qa0-f53.google.com with SMTP id j5so3080923qaq.19
 for <ath10k@lists.infradead.org>; Tue, 17 Dec 2013 13:51:43 -0800 (PST)
MIME-Version: 1.0
Date: Tue, 17 Dec 2013 16:51:41 -0500
Message-ID: <CAHR6CfXUBFTq=EDHwa3dNL21VaBvQ8sOeW+JYeUAtv7zg28rLA@mail.gmail.com>
Subject: Cannot use 80MHz channel
From: Li Sun <lsun3@buffalo.edu>
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

Hi,

I am trying to play around with the ath10k driver. I have two Qualcomm
Atheros QCA9880 Version 2 802.11ac chipsets. I put one of the cards in
AP mode using hostapd and connect the other one as a client.

I am using the hostapd config mentioned at
"wireless.kernel.org/en/users/Drivers/ath10k/configuration". The
client connects but the throughput is just around 300 Mbps (suggesting
40 MHz channel-width) and NOT any higher. It seems I am unable to use
the 80 MHz channel-width. Also, when I checked the kernel logs
(dmesg), I found the following message on the client side only:

capabilities/regulatory prevented using AP HT/VHT configuration, downgraded


Could this problem be related to CRDA ? I am in the US.

I am using the following config to build the driver:

kernel 3.6.3-030603-generic

ath:
commit 915da50d3e13e2ad5518b43dcb8681
90d3811bc9
Merge: 8250e5b 5474efe
Author: Kalle Valo
Date:   Thu Oct 24 08:43:47 2013 +0300


backport tree:
commit db67a3f06e3cbd0ac2196f7373e5e927fc1a866f
Author: Luis R. Rodriguez
Date:   Tue Aug 27 18:04:25 2013 -0700


FrameAggregator

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
