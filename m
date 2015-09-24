Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZfEPM-0007DN-Bs
 for ath10k@lists.infradead.org; Thu, 24 Sep 2015 21:50:28 +0000
From: Ben Greear <greearb@candelatech.com>
Subject: IBSS and AMSDU on ath10k
Message-ID: <5604700D.6020504@candelatech.com>
Date: Thu, 24 Sep 2015 14:50:05 -0700
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

Hello!

I'm trying to figure out why IBSS with AMSDU breaks on CT firmware (ath10k).

First, I have no idea if it works on any other firmware....

The problem I see is that the first frame of the AMPDU
has a single frame, and it looks fine and is received up the stack.

Subsequent frames in the AMPDU with 2+ subframes look mostly correct
at first glance, but the 'bssid' as decoded by the stack and sniffer
is 00:00:00:00:00:00, so the stack will not accept it.

I am guessing that frames are either really broken on the air, or
the re-assembly in the ath10k driver is broken.

The same systems in managed mode show proper bssid on the AMSDU
frames, so maybe it really is an on-air issue.

My ath10k sniffer might suffer the same problem, so I'm not actually
certain what is on the air.

The ath9k as sniffer cannot seem to decode any AMSDU frames, even
if the IBSS devices are using HT instead of VHT framerates.

I'm curious if anyone has any suggestions as to how this is supposed
to work.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
