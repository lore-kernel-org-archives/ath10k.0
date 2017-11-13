Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eENY1-0005ht-O1
 for ath10k@lists.infradead.org; Mon, 13 Nov 2017 22:49:47 +0000
Received: from [192.168.43.60] (unknown [172.58.41.246])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id 798BB409E08
 for <ath10k@lists.infradead.org>; Mon, 13 Nov 2017 14:49:18 -0800 (PST)
Message-ID: <5A0A21C7.20505@candelatech.com>
Date: Mon, 13 Nov 2017 14:50:47 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Anyone get txbf to work on ath10k when using the linux driver?
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

 From what I can tell, the 10.4 firmware will not even enable txbf unless the driver
tells it too, and I don't think the driver is doing the correct call to enable this
(it is a testing interface hack, it appears).

But, maybe I am missing something?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
