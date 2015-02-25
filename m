Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YQgdY-0003qG-V8
 for ath10k@lists.infradead.org; Wed, 25 Feb 2015 18:24:45 +0000
Received: from [192.168.100.236] (unknown [50.251.239.81])
 (using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id 49491409E87
 for <ath10k@lists.infradead.org>; Wed, 25 Feb 2015 10:24:22 -0800 (PST)
Message-ID: <54EE1355.3010306@candelatech.com>
Date: Wed, 25 Feb 2015 10:24:21 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Question on setting tx-power in ath10k.
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

I have added some debugging in my CT firmware based on 10.1.467, and I have noticed
that anything below 5db is treated as zero by the firmware.  This is due primarily to
subtracting a fixed amount based on the NIC's configured chainmask.

I am guessing this is not entirely correct, since at /b rates, for instance, we
will be transmitting on only a single chain, so it does not matter how many
chains the hardware has?

Anyone have any insight on how this stuff is *supposed* to work?

If you have access to firmware source, plz contact me off the mailing list
and I can provide more details about the code that looks broken.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
