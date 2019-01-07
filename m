Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-eopbgr10066.outbound.protection.outlook.com ([40.107.1.66]
 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ggUMy-0002I3-Ch
 for ath10k@lists.infradead.org; Mon, 07 Jan 2019 12:51:06 +0000
From: Andreas Tobler <andreas.tobler@cloudguard.ch>
Subject: ath10k Invalid peer id 255 in peer stats buffer
Date: Mon, 7 Jan 2019 12:50:57 +0000
Message-ID: <153eb99c-07e5-9ce7-b3b2-40b166da6e7a@cloudguard.ch>
Content-Language: en-US
Content-ID: <6BF555261B9C124B9924A7FFD7DAF5B7@eurprd04.prod.outlook.com>
MIME-Version: 1.0
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

All,

We have the following scenario here:

- station (qca988x) connects to ap
- connection is up and running
- ap shuts down

-> station gives continuously the following warning on the console:

ath10k_pci 0000:02:00.0: Invalid peer id 255 in peer stats buffer

The warning comes from the ath10k_fetch_10_2_tx_stats function.

- once the ap is up and running again, the console output is gone and we 
no more see the warning unless we shut down the ap again.

The kernel we see this on is a 4.19.x.
The firmware of the qca988x card is 10.2.4.70.69.

So far I only have a way to silence the warning if I omit it if the 
peer_id is == 255. I think this is not the right way.

Has anybody else seen this warning? With the exact same peer_id?

TIA,
Andreas
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
