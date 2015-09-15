Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zbxsz-0006MX-2s
 for ath10k@lists.infradead.org; Tue, 15 Sep 2015 21:35:33 +0000
Received: from [192.168.100.149] (firewall.candelatech.com [50.251.239.81])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id DE3B340A539
 for <ath10k@lists.infradead.org>; Tue, 15 Sep 2015 14:35:04 -0700 (PDT)
From: Ben Greear <greearb@candelatech.com>
Subject: Bug in CCK hw_rate definitions?
Message-ID: <55F88F08.1000703@candelatech.com>
Date: Tue, 15 Sep 2015 14:35:04 -0700
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

ath10k hw.h has this:

enum ath10k_hw_rate_cck {
	ATH10K_HW_RATE_CCK_LP_11M = 0,
	ATH10K_HW_RATE_CCK_LP_5_5M,
	ATH10K_HW_RATE_CCK_LP_2M,
	ATH10K_HW_RATE_CCK_LP_1M,

But, at least in 10.1 firmware, it appears that CCK hw_rates are 0x40, 0x41, etc
(For those of you with firmware, see ar600P_phy.c, 'RC' column of the rate table.)

Am I missing something or is the driver code just wrong?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
