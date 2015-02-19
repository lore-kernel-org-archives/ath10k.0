Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YOYnt-0004IG-8F
 for ath10k@lists.infradead.org; Thu, 19 Feb 2015 21:38:37 +0000
Received: from [192.168.100.236] (unknown [50.251.239.81])
 (using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id 6D0BD40EA44
 for <ath10k@lists.infradead.org>; Thu, 19 Feb 2015 13:38:09 -0800 (PST)
Message-ID: <54E657C0.6080402@candelatech.com>
Date: Thu, 19 Feb 2015 13:38:08 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Sending frames on monitor interface?
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

Do any of the firmware versions support sending (raw) frames on
the monitor interface?

It seems 10.1 just asserts if someone tries this.  I can fix at least
some of this, but firmware seems to want a peer in order to transmit
any packets...maybe adding self-peer to the monitor interface is
a way to get around this?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
