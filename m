Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WUf29-0007Zd-UV
 for ath10k@lists.infradead.org; Mon, 31 Mar 2014 16:26:02 +0000
Received: from [192.168.100.236] (firewall.candelatech.com [70.89.124.249])
 (authenticated bits=0)
 by ns3.lanforge.com (8.14.2/8.14.2) with ESMTP id s2VGPeLD007943
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
 for <ath10k@lists.infradead.org>; Mon, 31 Mar 2014 09:25:40 -0700
Message-ID: <53399703.1060302@candelatech.com>
Date: Mon, 31 Mar 2014 09:25:39 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Clean-ish rebase on top of 3.14.0 (final)?
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

Kalle:  In case you end up with your tree in a clean rebase
on stock 3.14.0 (or as clean as is reasonable), could you let
us know and give us a bit of time before pulling down more
upstream stuff?

The reason is that I would like to freeze a 3.14 kernel with
whatever ath10k patches are currently in your tree and attempt
to stabalize it...

If that is not convenient, then don't worry..I can make it work
one way or another.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
