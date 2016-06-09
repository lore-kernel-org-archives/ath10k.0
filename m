Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bB9em-00057B-6P
 for ath10k@lists.infradead.org; Thu, 09 Jun 2016 23:46:36 +0000
From: Ben Greear <greearb@candelatech.com>
Subject: Any reason to allow MGT TID to be paused by power-save?
Message-ID: <5759FFAF.4040609@candelatech.com>
Date: Thu, 9 Jun 2016 16:45:51 -0700
MIME-Version: 1.0
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
To: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

I'm trying to track down a tricky problem with a Mac book and power save
with my ath10k firmware.

At least part of the issue is that when the Mac sleeps, it goes into power-save
state as far as AP is concerned, and then it simply turns itself off.  When it wakes
up a short time later, it then tries to scan and re-associate.  But, if hostapd
hasn't timed out the station (due to longer idle timer), then STA still is treated
as being in power-save in the firmware.  It appears that this causes mgt-frames (probe responses)
not be sent back out of the firmware, so Mac gives up fairly quickly.

I fixed at least some of this by forcing a power-save wake on
receipt of probe requests and auth requests, but some issues remain
for one reason or another.

One thing that came to mind:  Is it *ever* a good idea to pause a mgt-tid due to
power-save?  A second non-pausable TID also exists in the firmware...maybe all
mgt frames should use that?  But if so, then why have a mgt tid at all?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
