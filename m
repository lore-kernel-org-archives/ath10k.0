Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WumOS-0002r1-Ol
 for ath10k@lists.infradead.org; Wed, 11 Jun 2014 17:33:01 +0000
Received: from [192.168.100.236] (firewall.candelatech.com [70.89.124.249])
 (using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id 289DA40AB50
 for <ath10k@lists.infradead.org>; Wed, 11 Jun 2014 10:32:39 -0700 (PDT)
Message-ID: <539892B6.5040504@candelatech.com>
Date: Wed, 11 Jun 2014 10:32:38 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Updated 'CT' firmware available, fixes scan on DFS channels.
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

I've uploaded new CT firmware that appears to fix the scan problems
reported by Vu Hai Nguyen (Thanks for taking time to bisect the problem
and test patches!)

Linked with change-log towards bottom of this page:

http://www.candelatech.com/ath10k.php


As always, I'm curious to know of bugs or successes when using
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
