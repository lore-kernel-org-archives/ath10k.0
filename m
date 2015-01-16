Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YCAQg-0000LZ-Dg
 for ath10k@lists.infradead.org; Fri, 16 Jan 2015 17:11:27 +0000
Received: from [192.168.100.236] (unknown [50.251.239.81])
 (using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id E9DBD40D965
 for <ath10k@lists.infradead.org>; Fri, 16 Jan 2015 09:11:03 -0800 (PST)
Message-ID: <54B94627.1080706@candelatech.com>
Date: Fri, 16 Jan 2015 09:11:03 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: 3.17+ blocks on firmware crash, 3.19 does not..what fixed it?
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

If 3.17 kernel has lots of vdevs, and firmware crashes, there can be lots
of timeouts due to timing out wmi commands.  3.19 appears to fix this.

I need to backport this behaviour if possible....any idea what commit(s)
fixed this issue?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
