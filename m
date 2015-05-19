Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YunJv-0007em-C0
 for ath10k@lists.infradead.org; Tue, 19 May 2015 19:36:55 +0000
Received: from [192.168.100.236] (unknown [50.251.239.81])
 (using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id 644B0409E87
 for <ath10k@lists.infradead.org>; Tue, 19 May 2015 12:36:34 -0700 (PDT)
Message-ID: <555B90C1.7090604@candelatech.com>
Date: Tue, 19 May 2015 12:36:33 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: New CT 10.1 beta firmware available.
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

I have uploaded the latest CT ath10k firmware:

http://www.candelatech.com/downloads/ath10k-fw-beta/

http://www.candelatech.com/ath10k.php

This fixes ANQP in station mode, for me.  This changes
a piece of code relating to stations that probably was hit
very rarely..but I'm slightly worried that some scenario might
have depended on the old behaviour.

Please let me know if you see anything strange.  From what I can tell,
AP mode should not be affected.  We will put this through our internal
test rigs as well in the coming days.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
