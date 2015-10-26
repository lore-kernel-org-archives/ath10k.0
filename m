Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zqpjm-00024E-HT
 for ath10k@lists.infradead.org; Mon, 26 Oct 2015 21:55:30 +0000
Received: from [192.168.100.149] (firewall.candelatech.com [50.251.239.81])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id 07BA940A959
 for <ath10k@lists.infradead.org>; Mon, 26 Oct 2015 14:55:09 -0700 (PDT)
From: Ben Greear <greearb@candelatech.com>
Subject: Station mode for 4x4 ath10k with 10.4.1.00030-1 ?
Message-ID: <562EA13C.3050906@candelatech.com>
Date: Mon, 26 Oct 2015 14:55:08 -0700
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

Has anyone been able to get station mode to work on the 4x4
hardware?

I have tried today's 'ath' tree and firmware 10.4.1.00030-1 and
the station cannot associate to another ath10k (3x3) AP nearby.
This is using OPEN authentication.

I just see auth-timeouts...

I'm curious if anyone has had any success with 4x4 in station mode?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
