Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WIo3t-00042P-Lm
 for ath10k@lists.infradead.org; Wed, 26 Feb 2014 23:38:50 +0000
Received: from [192.168.100.236] (firewall.candelatech.com [70.89.124.249])
 (authenticated bits=0)
 by ns3.lanforge.com (8.14.2/8.14.2) with ESMTP id s1QNcQ32011925
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
 for <ath10k@lists.infradead.org>; Wed, 26 Feb 2014 15:38:26 -0800
Message-ID: <530E7AF2.1080908@candelatech.com>
Date: Wed, 26 Feb 2014 15:38:26 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Need to get msdu-chaining working.
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


I'm using raw-rx mode in my firmware, and it's throughput is
extremely poor at higher speeds.  I see large numbers of warnings
about msdu_chaining, so I suspect this may be the reason.

Does anyone have any suggestions for what needs to be done
to handle these sorts of frames properly?

			/* FIXME: we do not support chaining yet.
			 * this needs investigation */
			if (msdu_chaining) {
				ath10k_warn("htt rx msdu_chaining is true\n");
				ath10k_htt_rx_free_msdu_chain(msdu_head);
				continue;
			}

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
