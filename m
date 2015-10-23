Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZphlE-0001GE-2Z
 for ath10k@lists.infradead.org; Fri, 23 Oct 2015 19:12:21 +0000
Received: from [192.168.100.149] (firewall.candelatech.com [50.251.239.81])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id 5DC4D40A5C4
 for <ath10k@lists.infradead.org>; Fri, 23 Oct 2015 12:11:57 -0700 (PDT)
From: Ben Greear <greearb@candelatech.com>
Subject: QCA 4x4 board.bin issues.
Message-ID: <562A867C.4030901@candelatech.com>
Date: Fri, 23 Oct 2015 12:11:56 -0700
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

Hello!

I'm trying to bring up a qca99x0 NIC from Compex, based on CUS239 from what
I can tell,  on today's ath.git and stock firmware from ath10k-firmware tree.

I tried naming the boardData_AR900B_CUS239_5G_v2_001.bin to board-2.bin
but it evidently has bad magic.

Should it actually be board-2.bin, or named something differently?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
