Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bF77i-0002i1-JH
 for ath10k@lists.infradead.org; Mon, 20 Jun 2016 21:52:51 +0000
From: Ben Greear <greearb@candelatech.com>
Subject: Stand-alone ath10k-ct driver.
Message-ID: <57686587.9050607@candelatech.com>
Date: Mon, 20 Jun 2016 14:52:07 -0700
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

I have made an attempt to provide a stand-alone ath10k driver that should compile
and work against stock 4.7 kernels.  This should provide better support for CT ath10k
firmware without having to apply large numbers of patches.  My 4.7 kernel has only been very lightly tested
to date, and the stand-alone driver is only compile tested.  I will update the
ath-ct repo often as testing progresses on 4.7.

If there are brave souls that want to try it out, I'd appreciate any feedback.

https://github.com/greearb/ath-ct

See the README.txt for some details.  This will require at least some familiarity
with building kernels since I do not have any nice automation to compile against
the current running kernel yet, for instance.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
