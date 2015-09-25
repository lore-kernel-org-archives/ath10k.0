Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZfbzS-0003Tn-Gs
 for ath10k@lists.infradead.org; Fri, 25 Sep 2015 23:01:19 +0000
From: Ben Greear <greearb@candelatech.com>
Subject: Can we ignore frames with invalid BSSID in IBSS mode?
Message-ID: <5605D228.7050609@candelatech.com>
Date: Fri, 25 Sep 2015 16:00:56 -0700
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

It seems that ath10k ar988X hardware has a bug where the BSSID
for IBSS AMSDU frames is all zeros.  The 'main' 636 ath10k firmware
does not seem to use AMSDUs for IBSS, and when I enable it in my CT
firmware, then I see the breakage.  So, I suspect it is not
just a simple software/firmware bug.

If I simply ignore the bssid_match check in ieee80211_accept_frame,
then it seems everything runs fine.

So, I'm curious if anyone knows what sorts of bad things could happen
if the bssid_match check is ignored?  Maybe bcast/mcast frames could
be accepted when they shouldn't be in certain cases?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
