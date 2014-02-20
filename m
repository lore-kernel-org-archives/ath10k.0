Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WGX90-00064j-3i
 for ath10k@lists.infradead.org; Thu, 20 Feb 2014 17:10:43 +0000
Received: from [192.168.100.236] (firewall.candelatech.com [70.89.124.249])
 (authenticated bits=0)
 by ns3.lanforge.com (8.14.2/8.14.2) with ESMTP id s1KHAG7Z000420
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
 for <ath10k@lists.infradead.org>; Thu, 20 Feb 2014 09:10:17 -0800
Message-ID: <530636F8.1070201@candelatech.com>
Date: Thu, 20 Feb 2014 09:10:16 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Anyone seeing problem with running out of credits?
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

Next on my bug list is a problem where the driver claims that
it has no more tx credits, and the firmware never releases any
more credits.

I generally see this after 'resetting' a bunch of station VIFs
several times.

The firmware does not crash, but perhaps it hangs.  I am using
a modified 10.1.389 firmware.

I have double checked the firmware and it appears it should
properly release the credits in all cases, but of course it
could still have issues.

The last command that received a credit and so was sent is 0x9011,
which appears to be vdev-create.

I am curious if anyone else has seen such problems in testing?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
