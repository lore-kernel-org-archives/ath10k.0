Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YJ8Zy-00046S-0e
 for ath10k@lists.infradead.org; Wed, 04 Feb 2015 22:37:50 +0000
Received: from [172.16.16.200] (unknown [12.217.161.130])
 (using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id 7C17440D1BD
 for <ath10k@lists.infradead.org>; Wed,  4 Feb 2015 14:37:28 -0800 (PST)
Message-ID: <54D29F71.50603@candelatech.com>
Date: Wed, 04 Feb 2015 14:38:41 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: station kickout
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

In AP mode, it seems that 3.17-ish kernels (at least) always set station kickout
to hard-coded value of 50.

Is this something that should be configurable?  Maybe a module parameter
if nothing else?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
