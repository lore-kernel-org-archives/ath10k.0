Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y6qrl-0005so-L2
 for ath10k@lists.infradead.org; Fri, 02 Jan 2015 01:17:25 +0000
Received: from [192.168.100.236] (unknown [50.251.239.81])
 (using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id 7BB4040E9C7
 for <ath10k@lists.infradead.org>; Thu,  1 Jan 2015 17:17:01 -0800 (PST)
Message-ID: <54A5F18C.2050007@candelatech.com>
Date: Thu, 01 Jan 2015 17:17:00 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Firmware debug messages stopped sometime after 3.18
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

While trying to reproduce some bugs on ath10k in 3.19.0-rc2, I could not
get any debuglog messages from the firmware.  For instance, in stock kernel
it should print out something like this:

 wmi event debug mesg len 28

I got other wmi debug messages, so the debug level appeared correct.

The message shows up as expected in stock 3.18 kernel.

Was this done on purpose?

I've started a bisect...should track it down directly.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
