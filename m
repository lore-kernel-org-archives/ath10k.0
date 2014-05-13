Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WkLHY-00084z-W5
 for ath10k@lists.infradead.org; Tue, 13 May 2014 22:34:45 +0000
Received: from [192.168.100.236] (firewall.candelatech.com [70.89.124.249])
 (using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id CA2B840A339
 for <ath10k@lists.infradead.org>; Tue, 13 May 2014 15:34:21 -0700 (PDT)
Message-ID: <53729DED.6000104@candelatech.com>
Date: Tue, 13 May 2014 15:34:21 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: FYI:  msdu-desc must be multiple of 8.
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

I just hit strange and wonderful crashes because I managed to use
an msdu-desc length that was not an even multiple of 8.  Firmware
has assumption (bug, really) about this.

Bug is only triggerable if you fill up tx-descs, so have to flood UDP
to hit easily.  I was trying 812 buffers, but 808 works just fine.
(non CT firmware will not let you do less that 1024, no matter what you
request, btw).

Easy to fix though once you know the problem.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
