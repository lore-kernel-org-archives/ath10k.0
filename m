Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XmTBW-0008Ai-4z
 for ath10k@lists.infradead.org; Thu, 06 Nov 2014 19:57:34 +0000
Message-ID: <545BD297.5040806@candelatech.com>
Date: Thu, 06 Nov 2014 11:57:11 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: New ath10k CT firmware released.
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
To: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

I have uploaded the latest CT version of the ath10k firmware.

http://www.candelatech.com/ath10k.php

This firmware fixes bugs in raw-tx mode, though probably only
non-encrypted frames can be sent in this manner, and it requires
an out-of-tree patch from Michal Kazior to make it work:

http://comments.gmane.org/gmane.linux.drivers.ath10k.devel/246

This firmware also significantly improves association times when using
more than one vdev.  This, requires an additional kernel patch:

http://dmz2.candelatech.com/git/gitweb.cgi?p=linux-3.17.dev.y/.git;a=commitdiff;h=a9756b6e2efffbec4101dbe81e9d6a2c503239ff;hp=5bfa637376c352fc17c56afc7b1d2e752750162c

And, you may want the near-by patches that allow disabling some
logging, especially if using serial console.

There is also a small fix to max-nss logic in the firmware rate-control,
but I am not sure this is required.  It _is_ required that you use
currently-out-of-tree patches if you want anything other than 3x3 station
connecting to 3x3 AP to work properly with ath10k.

As always, I am interested to know how people are using
the CT firmware, and I would welcome any help with getting
even basic support (such as reserved feature flags)
for this firmware in the upstream kernel.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
