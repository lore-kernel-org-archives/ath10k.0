Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ve0-f180.google.com ([209.85.128.180])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WfaOy-000071-C1
 for ath10k@lists.infradead.org; Wed, 30 Apr 2014 19:42:44 +0000
Received: by mail-ve0-f180.google.com with SMTP id jz11so2714983veb.25
 for <ath10k@lists.infradead.org>; Wed, 30 Apr 2014 12:42:20 -0700 (PDT)
MIME-Version: 1.0
From: Avery Pennarun <apenwarr@gmail.com>
Date: Wed, 30 Apr 2014 15:36:06 -0400
Message-ID: <CAHqTa-1D+xrg9=BMzP-offjArA=9-XQ8LcSyun1cqPyePrBrKA@mail.gmail.com>
Subject: ath10k firmware crash after 4 hours of heavy TCP traffic
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
To: ath10k <ath10k@lists.infradead.org>

Can someone help me decode this firmware crash so I know where to
look?  It's possible I have more memory barrier type problems, as I
did before, but it's very hard to figure these out without the
firmware printing more helpful error messages.

Unfortunately there were no interesting messages in the kernel logs
leading up to this.  hostapd said TX_STATUS received, as usual, about
2 seconds earlier.

In this test, we had three stations connected to the ath10k AP for
about 4 hours, with heavy TCP traffic in both directions.  This is
with ath10k-stable-3.11.8.

<3>[4305.499544] : ath10k: firmware crashed!
<3>[4305.499561] : ath10k: hardware name qca988x hw2.0 version 0x4100016c
<3>[4305.499571] : ath10k: firmware version: 10.1.467.2-1
<3>[4305.500641] : ath10k: target register Dump Location: 0x0040AC94
<3>[4305.501691] : ath10k: target Register Dump
<3>[4305.501703] : ath10k: [00]: 0x4100016C 0x000015B3 0x009A7340 0x00955B31
<3>[4305.501714] : ath10k: [04]: 0x009A7340 0x00060130 0x00000020 0x00000000
<3>[4305.501725] : ath10k: [08]: 0x00411124 0x00000000 0x00415B0C 0x00000001
<3>[4305.501735] : ath10k: [12]: 0x00000009 0x00000000 0x00958360 0x0095836B
<3>[4305.501746] : ath10k: [16]: 0x00958080 0x0094085D 0x00000000 0x00000000
<3>[4305.501756] : ath10k: [20]: 0x409A7340 0x0040ADA4 0x00411388 0x0040D144
<3>[4305.501766] : ath10k: [24]: 0x809A80DE 0x0040AE04 0x0040ADEC 0xC09A7340
<3>[4305.501777] : ath10k: [28]: 0x809A7885 0x0040AE24 0x0040AE48 0x00411124
<3>[4305.501787] : ath10k: [32]: 0x809486FA 0x0040AE44 0x00000001 0x00000000
<3>[4305.501797] : ath10k: [36]: 0x80948E2C 0x0040AEA4 0x0041D728 0x00411778
<3>[4305.501807] : ath10k: [40]: 0x80942EB3 0x0040AEC4 0x0041D728 0x00000001
<3>[4305.501817] : ath10k: [44]: 0x80940F18 0x0040AF14 0x00000010 0x00403AC0
<3>[4305.501827] : ath10k: [48]: 0x80940EEA 0x0040AF44 0x00400000 0x00000000
<3>[4305.501837] : ath10k: [52]: 0x80940F31 0x0040AF64 0x00401C10 0x00400600
<3>[4305.501848] : ath10k: [56]: 0x40940024 0x0040AF84 0x004068E8 0x004068E8

Thanks!

Avery

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
