Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YHybT-00087L-BZ
 for ath10k@lists.infradead.org; Sun, 01 Feb 2015 17:46:35 +0000
Received: from [50.34.201.20] (unknown [50.34.201.20])
 (using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id 6FA2140CE8E
 for <ath10k@lists.infradead.org>; Sun,  1 Feb 2015 09:46:13 -0800 (PST)
Message-ID: <54CE6664.9090101@candelatech.com>
Date: Sun, 01 Feb 2015 09:46:12 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Unable to read firmware registers on crash?
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

I am trying to debug a case where firmware occasionally crashes and
the driver cannot read any crash dump to debug problem further.

Any idea what might be the problem and how I might could read info
from the firmware (or hack firmware to deliver the crash info in some
other means...maybe though a previously reserved piece of memory on
the host??)

[147334.397148] ath10k: firmware crashed! (uuid ff405224-b2a4-493d-b619-19ad8152d190)
[147334.404808] ath10k: hardware name qca988x hw2.0 version 0x4100016c
[147334.411111] ath10k: firmware version: 10.1.467-ct-community-full-013
[147334.429603] ath10k: failed to read diag value at 0x1300804: -16
[147334.435647] ath10k: failed to read FW dump area address: -16


Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
