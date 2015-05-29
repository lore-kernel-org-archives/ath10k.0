Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YyNRb-0003Tl-G3
 for ath10k@lists.infradead.org; Fri, 29 May 2015 16:47:39 +0000
Received: from [192.168.100.236] (unknown [50.251.239.81])
 (using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id EB24D40B2CD
 for <ath10k@lists.infradead.org>; Fri, 29 May 2015 09:47:17 -0700 (PDT)
Message-ID: <55689815.6050404@candelatech.com>
Date: Fri, 29 May 2015 09:47:17 -0700
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

This firmware has a small feature added, but is otherwise
similar to the previous firmware.

It now returns the value of the NIC's temperature sensor as
the second octet of the 'OPMODE' register in the register
dump report.

I think the units are degrees Fahrenheit, but I am not
certain about that at this point.  Typical values from my
mostly idle NIC in a test system read around 103 to 110.

The register dump debugfs file itself requires patches
from my kernels, so for stock kernel users, this does
not add anything useful.

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
