Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from james.theweblords.de ([217.11.55.87])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eGBI5-0000jx-24
 for ath10k@lists.infradead.org; Sat, 18 Nov 2017 22:08:47 +0000
Date: Sat, 18 Nov 2017 23:08:18 +0100
From: Peter =?UTF-8?B?R3Jvw59l?= <pegro@friiks.de>
Subject: Support for 5/10 MHz channel width
Message-ID: <20171118230818.5e07509a@friiks.de>
MIME-Version: 1.0
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
Cc: Peter =?UTF-8?B?R3Jvw59l?= <pegro@friiks.de>

Hi everyone.

I'm curious about whether there are technical limitations or if it would be
possible for the ath10k driver and firmware to support half-rate channel widths
of 5 and 10 MHz?

The ath9k driver supports it. It was introduced by Simon Wunderlich in 2013
[1], also listing possible useful applications, some of which I'm interested in.

From what I got looking at the ath10k driver code, the enum wmi_phy_mode used
in mac.c:chan_to_phymode() has no corresponding values for these channel
widths. So assume a change to the firmware would be also required.

So again, I'm just curious ;)

Regards
Peter

[1] https://www.spinics.net/lists/linux-wireless/msg109641.html

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
