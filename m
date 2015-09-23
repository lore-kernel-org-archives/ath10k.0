Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zettf-00049B-Mr
 for ath10k@lists.infradead.org; Wed, 23 Sep 2015 23:56:24 +0000
Received: from [192.168.100.149] (firewall.candelatech.com [50.251.239.81])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id A900940A539
 for <ath10k@lists.infradead.org>; Wed, 23 Sep 2015 16:56:02 -0700 (PDT)
From: Ben Greear <greearb@candelatech.com>
Subject: CT 4.2 kernel now supports 80Mhz IBSS
Message-ID: <56033C12.9020102@candelatech.com>
Date: Wed, 23 Sep 2015 16:56:02 -0700
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
To: ath10k <ath10k@lists.infradead.org>

I forget exactly all who was asking for this...but hopefully
they are reading this list...

I was missing a patch that allowed HT80 IBSS in my 4.2.

The beta-15 CT firmware appears to do HT80 IBSS just fine
with the 4.2 kernel now.

I have not attempted to enable this feature on my 4.0 kernel yet.

Please also note, I've been hacking on rate-ctrl logic in both 4.0
and 4.2 kernels (and beta-15 firmware)..so if you try it and find
something weird, especially in probe requests or association requests,
please do let me know.  Notes of success are welcome as well of course!

http://www.candelatech.com/ath10k.php

http://dmz2.candelatech.com/git/gitweb.cgi

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
