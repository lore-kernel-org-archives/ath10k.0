Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YZ4kr-0007Bt-DU
 for ath10k@lists.infradead.org; Fri, 20 Mar 2015 21:46:57 +0000
Received: from [192.168.100.236] (unknown [50.251.239.81])
 (using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id 91FDD40B2CD
 for <ath10k@lists.infradead.org>; Fri, 20 Mar 2015 14:46:33 -0700 (PDT)
Message-ID: <550C9539.50805@candelatech.com>
Date: Fri, 20 Mar 2015 14:46:33 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Repeated firmware crash when admin down.
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

Someone reported this bug to me.  It is repeatable on various firmware,
including my own and official QCA firmware.

I am not certain of the hardware platform, but I think it might be a Ventana
imx6 board.

Kernel is based on 3.19-mumble.

I cannot reproduce on x86 (but testing on 3.17 kernel and different flavour of
Linux, so who knows.)

They simply admin-down wlanX, and then the firmware crashes over and over.
They cannot get any register dump.
When they admin up the interface, the crashes stop and system resumes normally.

I had them try it with my firmware and a driver patch
which will attempt to do ping-pong register dump
over pci register reads in case the firmware's normal PCI messaging transport
is down, but the register value always reads as '0xdeadbeef'.

Driver patch is linked below, 'val' is 0xdeadbeef after the million read attempts.

(Need a few additional patches to define CT firmware flag and such, but you can
 see the logic easily enough.)
http://dmz2.candelatech.com/?p=linux-3.17.dev.y/.git;a=commit;h=52333b889f0c818d2766d0d514ac31e5c53ce0ab

Any ideas what might be the problem?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
