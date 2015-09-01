Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZWt7a-0002wW-KK
 for ath10k@lists.infradead.org; Tue, 01 Sep 2015 21:29:38 +0000
From: Ben Greear <greearb@candelatech.com>
Subject: CT firmware beta-15 can now tune noise-floor thresholds.
Message-ID: <55E618AB.50902@candelatech.com>
Date: Tue, 1 Sep 2015 14:29:15 -0700
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

Here is the changelog note.  This requires a corresponding driver patch to
enable configuring the firmware.  I tested this on my 4.0.4+ kernel.  I
will be adding this patch to my 3.17 and 4.2 (and future) kernels as well.

Should be useful for anyone trying (and failing) to pass ETSI CCA Adaptivity testing.

You are more likely to cause something to be worse than better, so don't use this
feature unless you know what you are doing and understand the consequences.

This firmware also has some debugging for a case where rate-ctrl gets stuck at
6Mbps and spews lots of dbglog messages into the logs.  This is not easy to
reproduce, but in case someone is debugging such an issue...please send me
full kernel logs if you detect the problem...maybe I can decode them and understand
the problem a bit better now.  You will need to be using my kernel (patches) in order to
get useful firmware logs, by the way.

   *  Enable setting noise-floor-threshold and min-cca-power.  If set, this will over
      ride the defaults, including eeprom (though firmware ignores these settings
      in the eeprom anyway.)  Don't mess with this unless you understand the
      consequences.  But, if set properly, noise-floor-threshold tweaking may fix
      ETSI CCA adapatibility test failures.


http://www.candelatech.com/ath10k.php


Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
