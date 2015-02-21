Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YPDuT-0001Dk-Cd
 for ath10k@lists.infradead.org; Sat, 21 Feb 2015 17:32:09 +0000
Received: from [50.34.201.20] (unknown [50.34.201.20])
 (using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id 6642440A539
 for <ath10k@lists.infradead.org>; Sat, 21 Feb 2015 09:31:47 -0800 (PST)
Message-ID: <54E8C102.4090201@candelatech.com>
Date: Sat, 21 Feb 2015 09:31:46 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: CT firmware 10.1.467-13 is released.
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
To: ath10k <ath10k@lists.infradead.org>

Here are the highlights:

Add IBSS/AHDOC support.
Work-around tx-credits hang due to WMI/CE lockup in firmware (requires ath10k driver patches)
Attempt to fix a few asserts reported by users (scan code, rate-ctrl, resource-mgr, etc)

Known bugs:
CE transport failure assert (Only seen on IMX6 hardware at this time)
WMI keepalive failure, probably due to inability to send mgt frames in bad RF environment.


Downloads and more info is here:

http://www.candelatech.com/ath10k.php

As always, I am interested to hear of users having success or otherwise with
this firmware.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
