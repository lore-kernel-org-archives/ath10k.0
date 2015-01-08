Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y9KZg-0004EU-8B
 for ath10k@lists.infradead.org; Thu, 08 Jan 2015 21:25:01 +0000
Received: from [192.168.100.236] (unknown [50.251.239.81])
 (using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id 0014240C7D4
 for <ath10k@lists.infradead.org>; Thu,  8 Jan 2015 13:24:37 -0800 (PST)
Message-ID: <54AEF595.9030205@candelatech.com>
Date: Thu, 08 Jan 2015 13:24:37 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Anyone seeing tx-credits 'hang'?
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

I am still working on tracking down tx-credits hang, where it appears
to the driver that firmware does not return tx credits, and the driver
then gets lots of -11 errors from htc/wmi and will not recover (well,
once it recovered after hanging for about 45 minutes, for reasons that are totally
beyond me.  I do not normally wait so long).

I am using a hacked ath10k driver and CT firmware, but I am suspicious that the problem
is not unique to me, though I probably hit the problem much more often
due to the types of stress tests I am running.

I have implemented a keep-alive between my driver and CT firmware,
and firmware will assert if it does not get a message within
about 10 seconds.  This is a wmi-message, so if we hang due to credits,
the firmware will assert and dump a nice crash log (and host can recover).

One crash I looked at closely appears to show the firmware thinking it
has returned all credits, but driver never received them.  What is more,
it seems that the driver thought it sent one additional wmi command
that the firmware did not receive in the wmi message handling code.

I am curious if anyone else has seen these problems (even if very rarely),
and if anyone has done any additional debugging on what might be the issue.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
