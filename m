Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YW7rR-00087G-Pw
 for ath10k@lists.infradead.org; Thu, 12 Mar 2015 18:29:34 +0000
Message-ID: <5501DAF7.1000800@candelatech.com>
Date: Thu, 12 Mar 2015 11:29:11 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Specific tx rates with ath10k
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
To: ath10k <ath10k@lists.infradead.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>

Ath10k firmware gives ability to set specific fixed rate-control rates
for beacons/mgt, multicast, broadcast, and regular traffic.

The ath10k driver only sets regular traffic currently.

I had previously hacked my firmware to just set all rate types when
ath10k driver requested to set the rate.

But, that is not what my customer needs.

So, I am now planning to add some debugfs entries to allow users to set
beacon/mgt, multicast and broadcast rates individually (I don't have time or interest
right now to try patching things top to bottom to try to get this feature
into mac80211 stack or 'iw').

My question is, for when user just runs a command like this:

./local/sbin/iw dev vap1 set bitrates legacy-2.4 6 ht-mcs-2.4

What is the desired behaviour?

Set all rates (beacons/mgt, bcast, multicast, regular) to the same
fixed speed, or just a certain subset of these traffic types?

I can make my firmware do whatever combination is required, and then
users can over-ride the values by using debugfs.....

As a note, ath10k firmware will NOT send beacons at HT speeds, so
if you fix an HT rate, then firmware will ignore that for the beacons/mgt
ratecontrol type.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
