Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ffDzq-0003uk-Br
 for ath10k@lists.infradead.org; Tue, 17 Jul 2018 00:37:43 +0000
From: Ben Greear <greearb@candelatech.com>
Subject: Setting tx retry count in ath10k
Message-ID: <b0f67dd7-dea9-508e-7ad9-f6db3ac88b90@candelatech.com>
Date: Mon, 16 Jul 2018 17:37:24 -0700
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
To: ath10k <ath10k@lists.infradead.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>

I spent a bit of time looking into setting the tx retry count in
ath10k (wave-1 firmware).  The firmware has support for setting this as
a vdev parameter, and it defaults to '2', at least in my wave-1 firmware.

I enabled propagating the setting from mac80211, ie:
iw phy wiphy0 set retry short 2 long 2

And while debugging this, I noticed that mac80211 has a default of
4, but the ath10k firmware has a default of 2.  Now, I am not sure
if I should enable setting the retry count since it will change
the behaviour even if users don't set anything.

Any opinions on this?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
