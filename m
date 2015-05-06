Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YpnUT-0000tt-Ak
 for ath10k@lists.infradead.org; Wed, 06 May 2015 00:47:10 +0000
Received: from [192.168.100.236] (unknown [50.251.239.81])
 (using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id F281740B2CD
 for <ath10k@lists.infradead.org>; Tue,  5 May 2015 17:46:47 -0700 (PDT)
Message-ID: <55496477.50909@candelatech.com>
Date: Tue, 05 May 2015 17:46:47 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Anyone tried ANQP query with ath10k?
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

I have what I believe is an identical setup, except that one station
is on ath9k, and another is on ath10k.  The ath9k can query ANQP
just fine.  When sniffing, I never even see any ANQP queries go out
for the ath10k station.

Maybe I still have misconfiguration...I'm curious if anyone has tried
this?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
