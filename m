Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aGAN8-0004E0-UR
 for ath10k@lists.infradead.org; Mon, 04 Jan 2016 19:00:52 +0000
From: Ben Greear <greearb@candelatech.com>
Subject: VHT 20Mhz, MCS 9 RX rate reported by (my) ath10k
Message-ID: <568AC14D.4000102@candelatech.com>
Date: Mon, 4 Jan 2016 11:00:29 -0800
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

While trying to track down some funny results from 'iw station dump',
I find that my ath10k NIC is occasionally reporting MCS 9, 20Mhz bandwidth,
which I guess must be an invalid rate.

This is with non-stock firmware and patched driver, but I have mostly messed
with the TX rate reporting, not RX rate, so I'm not sure this is a local
issue.

Previously, I have also verified that ath10k can send and receive CCK rates
on 5Ghz, which is also evidently not supposed to be valid, so I'm suspicious
that maybe it can do MCS 9 at 20Mhz as well.  Or, maybe it is just reporting
bogus values.

Either way, I'd like it to do better than show a zero rate in the
station dump.  Any suggestions for the least-bad way to report a
non-zero rate when I have a NIC reporting this rate info?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
