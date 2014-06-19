Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WxhYG-0005rP-MK
 for ath10k@lists.infradead.org; Thu, 19 Jun 2014 18:59:13 +0000
Received: from [192.168.100.236] (firewall.candelatech.com [70.89.124.249])
 (using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id 5665340A69D
 for <ath10k@lists.infradead.org>; Thu, 19 Jun 2014 11:58:47 -0700 (PDT)
Message-ID: <53A332E7.2060400@candelatech.com>
Date: Thu, 19 Jun 2014 11:58:47 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: General firmware stability issue.
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

When using our firmware and kernel mods, we often see our AP system
crash the firmware after several days of various testing.

Often after this, it takes a full reboot to bring the system back.

For those with ability to debug firmware source,
at least some of the time, it is a heap list corruption/assert
that crashes us, but I have not nailed down exactly where/why yet.

Based on some email I received, I believe this problem may
happen on standard firmware as well.

I am curious to know if anyone else sees this type of problem,
and with what regularity.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
