Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZbuqE-000629-3A
 for ath10k@lists.infradead.org; Tue, 15 Sep 2015 18:20:30 +0000
From: Ben Greear <greearb@candelatech.com>
Subject: Default rates for broadcast, multicast, and management frames?
Message-ID: <55F86158.2090907@candelatech.com>
Date: Tue, 15 Sep 2015 11:20:08 -0700
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

ath10k firmware allows one to set fixed rates for broadcast, multicast, and management/beacon
frames.  I think upstream firmware may not have full support, but the API is there in 10.1,
at least, and CT firmware has full support.

I think the defaults are 6Mbps, but not certain of that.

CT kernels have a patch that gives debugfs access to set this, and I am also
working on automatically decreasing the rate down to 1Mbps if user has specified
only /b legacy rates, etc.

Instead of using whatever the firmware chooses for defaults, I think it is
better if the driver explicitly set the rates as desired.

So, what are the suggested defaults for these rate types?  Stick with 6Mbps for
/b/g and /a modes?  Set to 1Mbps of /b mode?  Different defaults for different
types?

Also, at least some ucast/bcast frames may be turned into directed frames and
then it may use normal peer rate-ctrl logic, as far as I remember.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
