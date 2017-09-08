Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x22f.google.com ([2a00:1450:400c:c09::22f])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dqCON-0003pH-Oy
 for ath10k@lists.infradead.org; Fri, 08 Sep 2017 06:03:55 +0000
Received: by mail-wm0-x22f.google.com with SMTP id f199so9047094wme.0
 for <ath10k@lists.infradead.org>; Thu, 07 Sep 2017 23:03:25 -0700 (PDT)
MIME-Version: 1.0
From: Nathaniel Filardo <nwfilardo@gmail.com>
Date: Fri, 8 Sep 2017 02:03:23 -0400
Message-ID: <CAKsvP2bZpQP2YiLh28HYhsxvParUyuXOk=qENJv20E8n6Fg5pw@mail.gmail.com>
Subject: LED support for QCA9980
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

Hallo ath10k@,

It seems that LED support is still missing in the latest versions of
the Linux ath10k driver; if that's not so, please ignore this message
entirely. :)

Thanks to some hero's sleuthing around a GPL source dump
(https://forum.openwrt.org/viewtopic.php?pid=336237#p336237) and a
later suggestion to try flipping bits from userspace (using
https://github.com/billfarrow/pcimem), I can report that, at least for
the two QCA9980s in my possession (within the TP-Link C2600 gateway I
have) that the speculation is correct: kicking on bit 17 (the value of
ATH_BEELINER_LED) in 0x85018 of resource0 makes bit 17 in 0x85000 an
active-low controller for the LEDs attached to the chip.

I'd attempt to wire this knowledge into the ath10k driver and the
broader LED framework within Linux and submit a patch, but I have no
idea where to begin such a task.  Perhaps it is, nevertheless, useful
to know and have confirmed?  I know blinking LEDs are a low priority
relative to getting packets on and off the air. :)

Cheers,
--nwf;

P.S. Please CC as I am not subscribed to ath10k@.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
