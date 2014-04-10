Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WYFEd-0003oo-DZ
 for ath10k@lists.infradead.org; Thu, 10 Apr 2014 13:41:44 +0000
Received: from [50.54.140.2] (50-54-140-2.evrt.wa.frontiernet.net
 [50.54.140.2]) (authenticated bits=0)
 by ns3.lanforge.com (8.14.2/8.14.2) with ESMTP id s3ADfFXH023333
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
 for <ath10k@lists.infradead.org>; Thu, 10 Apr 2014 06:41:15 -0700
Message-ID: <53469F7B.2080202@candelatech.com>
Date: Thu, 10 Apr 2014 06:41:15 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Question on ath10k_mgmt_tx_flush
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Can we optimize this method to return early if the tx-credits
are fully replenished (ie, == 2) instead of just sleeping the
2 x beacon-interval?  That would indicate all messages
have been flushed, right?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
