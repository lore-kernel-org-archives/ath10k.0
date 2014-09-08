Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XR1Eg-0005If-Vv
 for ath10k@lists.infradead.org; Mon, 08 Sep 2014 15:52:11 +0000
Received: from [172.20.7.90] (wsip-24-234-46-157.lv.lv.cox.net [24.234.46.157])
 (using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id CDFDF40BE43
 for <ath10k@lists.infradead.org>; Mon,  8 Sep 2014 08:51:46 -0700 (PDT)
Message-ID: <540DD093.5070702@candelatech.com>
Date: Mon, 08 Sep 2014 08:51:47 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: RTS threshold ignored in ath10k?
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

We did some tests using ath9k and ath10k.  It seems that ath10k
completely ignores RTS threshold settings.

I haven't had time to look into the code yet, but will try to
do so next week.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
