Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YmnYm-0005PJ-OF
 for ath10k@lists.infradead.org; Mon, 27 Apr 2015 18:15:13 +0000
Received: from [192.168.100.236] (unknown [50.251.239.81])
 (using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id 15BF940B79B
 for <ath10k@lists.infradead.org>; Mon, 27 Apr 2015 11:14:51 -0700 (PDT)
Message-ID: <553E7C9A.1000503@candelatech.com>
Date: Mon, 27 Apr 2015 11:14:50 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: ath10k CT firmware crash help.
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

Hello!

I have been trying to make progress on a particular firmware crash
in my 10.1 CT firmware, but I am not having much luck.

For anyone using my firmware, I would appreciate if you could keep
a look-out for crashes that match the crash signature
at the bottom of this page:

http://www.candelatech.com/ath10k.php

In general, I am interested in all firmware crashes from my
firmware, but I am especially interested to know if the CE engine
assert happens on other's platforms.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
