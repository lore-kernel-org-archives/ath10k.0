Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ea0-f178.google.com ([209.85.215.178])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VFnHX-0007C7-Qq
 for ath10k@lists.infradead.org; Sat, 31 Aug 2013 15:40:12 +0000
Received: by mail-ea0-f178.google.com with SMTP id a15so1476944eae.37
 for <ath10k@lists.infradead.org>; Sat, 31 Aug 2013 08:39:46 -0700 (PDT)
From: Christian Lamparter <chunkeey@googlemail.com>
Subject: Re: Re: Crash when loading module
Date: Sat, 31 Aug 2013 17:31:25 +0200
MIME-Version: 1.0
Message-Id: <201308311731.26207.chunkeey@googlemail.com>
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
To: ath10k@lists.infradead.org, kvalo@qca.qualcomm.com

> Found a way now:
>
> http://lists.infradead.org/pipermail/ath10k/2013-August/000279.html
>
> Zaki, I would appreciate if you could test that patch and see if ath10k
> still crashes (it shouldn't). And if you want to provide your full name
> I can add your name to the Reported-by tag.

I get this before it crashes now. (This is a QCA-9880-AR1A from TP-Link Archer C7)

[  271.140000] ath10k: Warning: chip id 0x043200ff is not known, expect problems

Could it be, that this is just a typo, or are there several v1.0 chip_ids?

#define QCA988X_HW_1_0_CHIP_ID         0x043000ff

vs

#define QCA988X_HW_1_0_CHIP_ID         0x043200ff

Regards,
	Chr

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
