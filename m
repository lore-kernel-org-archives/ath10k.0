Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WUmVF-0003KP-VV
 for ath10k@lists.infradead.org; Tue, 01 Apr 2014 00:24:34 +0000
Received: from [192.168.100.236] (firewall.candelatech.com [70.89.124.249])
 (authenticated bits=0)
 by ns3.lanforge.com (8.14.2/8.14.2) with ESMTP id s310OAgi018892
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
 for <ath10k@lists.infradead.org>; Mon, 31 Mar 2014 17:24:10 -0700
Message-ID: <533A0729.4030907@candelatech.com>
Date: Mon, 31 Mar 2014 17:24:09 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: More on ath10k_flush.
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

So, I tried adding lots of debug to the ath10k_flush,
and I think I might have found the issue.

My test case is:  create 32 stations, start TCP on all of them,
then reset (effectively ifdown;ifup) the station vifs.

I get lots of spews because the ath10k_flush call thinks it is
hanging.  But, based on the debug, I think the problem is that
the tx logic is continuing to accept packets while the flush
is trying to happen.

If my debugging stats are correct, the NIC managed to send around 4000
frames during the flush attempt, and the ath10k driver processed lots of
tx completions as well.  But there are still lots of pkts
pending tx and the tx queue was never empty.

ath10k: failed to flush transmit queue (skip 0 ar-state 1 pending_tx 1009  pre-pending-tx: 1045): 0
ath10k: pre: htc-send-tot: 3423  htt-tx 2545397  tx-compl 2544355  mgt-tx 0  mgt-compl 0
ath10k: post: htc-send-tot: 3424  htt-tx 2630981  tx-compl 2630156  mgt-tx 0  mgt-compl 0
ath10k: pre: hw-queued: 124395  hw-reaped: 124394
ath10k: post: hw-queued: 128418  hw-reaped: 128417


Do we need to somehow shut down all tx logic during the ath10k_flush
so that (other?) stations cannot transmit?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
