Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1e1zMQ-0002o0-Fj
 for ath10k@lists.infradead.org; Tue, 10 Oct 2017 18:34:38 +0000
From: Ben Greear <greearb@candelatech.com>
Subject: What should setting rate on 'AP' interface mean?
Message-ID: <e99d4daa-fdc2-ce26-8ffb-bd3cf131e87c@candelatech.com>
Date: Tue, 10 Oct 2017 11:34:10 -0700
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

I was trying to use 'iw' to set rates on an AP interface, hoping it would
set tx-rates on all of the stations (peers) to the same thing.

It appears that the ath10k driver will set ratesets on all stations if
we specify more than one rate, but if we specify a single rate, it does
not iterate through all stations, and just sets the 'vdev' fixed rate.

So, should the driver somehow attempt to set single rate on all the stations when
using a single rate?

Or, do we need an API to force rates for individual stations (peers) and leave
the driver in the current configuration?

Or is it the firmware's responsibility to set the rate for all peers when
we set the vdev fixed rate on an AP vdev?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
