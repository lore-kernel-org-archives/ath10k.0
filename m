Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XTZ8N-000460-O9
 for ath10k@lists.infradead.org; Mon, 15 Sep 2014 16:28:15 +0000
Received: from [192.168.100.236] (firewall.candelatech.com [70.89.124.249])
 (using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id 4174240B79B
 for <ath10k@lists.infradead.org>; Mon, 15 Sep 2014 09:27:45 -0700 (PDT)
Message-ID: <54171381.2040900@candelatech.com>
Date: Mon, 15 Sep 2014 09:27:45 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Spamming logs on firmware crash.
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

Looks like my firmware died horribly and cannot recover.  That happens,
and I'm not sure what to do about it, but maybe we can at least not spam
the logs endlessly with this sort of thing?

I'd actually like some way to indicate to user-space that a reboot
is required (since warm/cold start have failed to recover the firmware).

May be a udev event?  I could also do an ethtool stat that could
be polled....

[253648.757661] ath10k_pci 0000:04:00.0: boot target indicator ffffffff
[253648.757663] systemd-journald[353]: /dev/kmsg buffer overrun, some messages lost.
[253648.757664] ath10k_pci 0000:04:00.0: boot target indicator ffffffff
[253648.757668] ath10k_pci 0000:04:00.0: boot target indicator ffffffff
[253648.757673] ath10086] ath10k_pci 0000:04:00.0: boot target indicator ffffffff
[253648.758091] ath10k_pci 0000:04:00.0: boot target indicator ffffffff
[253648.758095] ath10k_pci 0000:04:00.0: boot target indicator ffffffff
[253648.758099] ath10k_pci 0000:04:00.0: boot target indicator ffffffff
[253648.758103] ath10k_pci 0000:04:00.0: boot target indicator ffffffff
[253648.758108] ath10k_pci 0000:04:00.0: boot target indicator ffffffff
[253648.758112] ath10k_pci 0000:04:00.0: boot target indicator ffffffff
[253648.758116] ath10k_pci 0000:04:00.0: boot target indicator ffffffff
[253648.758119] systemd-journald[353]: /dev/kmsg buffer overrun, some messages lost.
[253648.758120] ath10k_pci 0000:04:00.0: boot target indicator ffffffff
[253648.758124] ath10k_pci 0000:04:00.0: boot target indicator ffffffff
[253648.758128] ath10k_pci 0000:04:00.0: boot target indicator ffffffff
[253648.758131] ath10k_pci 0000:04:00.0: boot target indicator ffffffff
[253648.758134] systemd-journald[353]: /dev/kmsg buffer overrun, some messages lost.
[253648.758136] ath10k_pci 0000:04:00.0: boot target indicator ffffffff
[253648.758140] ath10k_pci 0000:04:00.0: boot target indicator ffffffff


Kernel is Linux ath10k-2220 3.17.0-rc2-wl-ath+, has some of my patches,
and was using my CT firmware.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
