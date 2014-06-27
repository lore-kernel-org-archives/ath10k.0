Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X0cT2-0006Qq-Dn
 for ath10k@lists.infradead.org; Fri, 27 Jun 2014 20:09:52 +0000
Received: from [192.168.100.236] (firewall.candelatech.com [70.89.124.249])
 (using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id 666E340A79A
 for <ath10k@lists.infradead.org>; Fri, 27 Jun 2014 13:09:28 -0700 (PDT)
Message-ID: <53ADCF78.8000809@candelatech.com>
Date: Fri, 27 Jun 2014 13:09:28 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: New CT firmware version 008 is uploaded.
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

This release includes the fix for the bug that Emanuel Taube reported,
and has a bunch of additional changes to improve mem usage.  I can get
44 vdevs created in firmware, though haven't tried actually using that many
concurrently quite yet.  The memory usage improvement was mainly by moving
stuff into IRAM, which can be touchy.  Yell if you see problems.

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
