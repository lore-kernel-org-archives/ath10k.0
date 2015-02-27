Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YRUJ5-0007aO-Jr
 for ath10k@lists.infradead.org; Fri, 27 Feb 2015 23:26:55 +0000
Received: from [192.168.100.236] (unknown [50.251.239.81])
 (using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id D61AD40A4C5
 for <ath10k@lists.infradead.org>; Fri, 27 Feb 2015 15:26:31 -0800 (PST)
Message-ID: <54F0FD17.2080603@candelatech.com>
Date: Fri, 27 Feb 2015 15:26:15 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Getting a 'no-ack' tx status?
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

Someone reported to me that they never see the
tx_done->no_ack flag set on their AP, even when stations are falling
off the network due to not receiving ACKs.

	if (tx_done->no_ack)
		info->flags &= ~IEEE80211_TX_STAT_ACK;


I am having no luck finding the corresponding code in the 10.1.467
firmware that would cause this to work, but maybe I am just not looking
in the right place.

Has anyone done any testing to see if ath10k actually reports ACK failures
properly back up the stack?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
