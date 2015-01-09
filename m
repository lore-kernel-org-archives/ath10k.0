Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y9dxA-0001kt-CI
 for ath10k@lists.infradead.org; Fri, 09 Jan 2015 18:06:32 +0000
Received: from [192.168.100.236] (unknown [50.251.239.81])
 (using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id 37E5740C28A
 for <ath10k@lists.infradead.org>; Fri,  9 Jan 2015 10:06:11 -0800 (PST)
Message-ID: <54B01892.4080609@candelatech.com>
Date: Fri, 09 Jan 2015 10:06:10 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Question on CE_DESC_FLAGS_META_DATA field.
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

While poking in the CE code, I notice this below.

Shouldn't the CE_DESC_FLAGS_META_DATA_LSB be 2, and if not,
can someone explain why?

[greearb@ben-dt2 ath10k]$ grep CE_DESC_FLAGS_META_DATA *h
ce.h:#define CE_DESC_FLAGS_META_DATA_MASK 0xFFFC
ce.h:#define CE_DESC_FLAGS_META_DATA_LSB  3

and this from core.h:

#define MS(_v, _f) (((_v) & _f##_MASK) >> _f##_LSB)

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
