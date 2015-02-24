Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YQJWi-0005oM-S3
 for ath10k@lists.infradead.org; Tue, 24 Feb 2015 17:44:09 +0000
Received: from [192.168.100.236] (unknown [50.251.239.81])
 (using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id A231040A626
 for <ath10k@lists.infradead.org>; Tue, 24 Feb 2015 09:43:46 -0800 (PST)
Message-ID: <54ECB852.3030208@candelatech.com>
Date: Tue, 24 Feb 2015 09:43:46 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Any idea why we cannot disable /b rates?
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

I'm going to start digging into the code, but in case someone already
knows...

I ran this command to try to disable any frames set at /b rates (AP is on channel 1).

But, according to ath10k sniffer, beacons are still sent with 1Mbps rate.

iw dev vap1 set bitrates legacy-2.4 12 mcs-2.4


Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
