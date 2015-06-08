Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z1zeR-0002qn-AD
 for ath10k@lists.infradead.org; Mon, 08 Jun 2015 16:11:51 +0000
Received: from [192.168.100.236] (unknown [50.251.239.81])
 (using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id 78B7E40A9E6
 for <ath10k@lists.infradead.org>; Mon,  8 Jun 2015 09:11:29 -0700 (PDT)
Message-ID: <5575BEB1.4010706@candelatech.com>
Date: Mon, 08 Jun 2015 09:11:29 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Does the reg_addr/reg_value reading work?
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

I am not getting expected values when I try to read registers
through the ath10k reg_addr/reg_value API.

For instance, I tried reading a particular register 0x80e0
(as defined in the firmware), and I get a zero value.  With a different
API that I wrote to dump some specific registers over the WMI API,
I get the expected value.

# echo 0x80e0 > /debug/ieee80211/wiphy0/ath10k/reg_addr
# cat /debug/ieee80211/wiphy0/ath10k/reg_value
0x000080e0:0x00000000
# cat /debug/ieee80211/wiphy0/ath10k/fw_regs

   ath10k Target Register Dump
             =================

           MAC-FILTER-ADDR-L32 0xd7ffffff
...

Is there some trick I am missing?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
