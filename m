Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z3SDt-0007dh-LS
 for ath10k@lists.infradead.org; Fri, 12 Jun 2015 16:54:30 +0000
Received: from [192.168.100.236] (unknown [50.251.239.81])
 (using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id 1AA1A40A626
 for <ath10k@lists.infradead.org>; Fri, 12 Jun 2015 09:54:08 -0700 (PDT)
Message-ID: <557B0EAF.3090002@candelatech.com>
Date: Fri, 12 Jun 2015 09:54:07 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Updated CT firmware uploaded.
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
To: ath10k <ath10k@lists.infradead.org>

Changes since last email of this nature:

Added (untested, and not-publicly-documented) feature to configure
some timings (slot, sifs, cts/rts).

Fix htt-tx status codes so that stations are properly disconnected
when AP dies.  The bug seems real, but for one reason or another,
stock 10.1 firmware still manages to disconnect stations, so this
is a bit of a regression fix.  It may provide additional advantages
over stock 10.1 behaviour, but I am not certain of that.

And note:  For anyone doing IBSS/ADHOC with my firmware, please use
the beta builds until I can do an official version-14 release.

http://www.candelatech.com/ath10k.php

http://www.candelatech.com/downloads/ath10k-fw-beta/

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
