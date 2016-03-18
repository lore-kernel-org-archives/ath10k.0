Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85 #2 (Red Hat Linux))
 id 1ah14w-00075w-Uj
 for ath10k@lists.infradead.org; Fri, 18 Mar 2016 20:33:04 +0000
Received: from [192.168.100.149] (firewall.candelatech.com [50.251.239.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id 46FE740B2C6
 for <ath10k@lists.infradead.org>; Fri, 18 Mar 2016 13:25:59 -0700 (PDT)
From: Ben Greear <greearb@candelatech.com>
Subject: Why does the driver configure only 2 keys per peer?
Message-ID: <56EC6456.2060007@candelatech.com>
Date: Fri, 18 Mar 2016 13:25:58 -0700
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

For instance:

#define TARGET_10_4_NUM_PEER_KEYS		2

But, there are 4 key-ids, and so the driver can attempt to allocate 3 per peer.

Now, the self-peer probably only has one key ever (and that is blank key),
but that still averages to 5 per vdev (when vdev has 2 peers), and if AP peers can have more than 2
keys, then the average is even worse for them.

In 10.1, I ended up using '4' instead of 2.

I guess I'm about to repeat that change for 10.4 firmware.

But, I'm curious why someone thought 2 was OK to begin with?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
