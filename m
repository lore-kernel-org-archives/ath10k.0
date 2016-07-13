Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bNNsW-0004rG-PN
 for ath10k@lists.infradead.org; Wed, 13 Jul 2016 17:23:21 +0000
Received: from [192.168.100.149] (firewall.candelatech.com [50.251.239.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id B334C40AF76
 for <ath10k@lists.infradead.org>; Wed, 13 Jul 2016 10:22:59 -0700 (PDT)
Subject: Re: Anyone brought up 9984 NIC on x86-64?
References: <578673DA.1010907@candelatech.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <578678F3.9020800@candelatech.com>
Date: Wed, 13 Jul 2016 10:22:59 -0700
MIME-Version: 1.0
In-Reply-To: <578673DA.1010907@candelatech.com>
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

On 07/13/2016 10:01 AM, Ben Greear wrote:
> I added a few patches to my 4.7 kernel to enable ath10k to load for 9984,
> but it immediately crashes due to IOMMU error when trying to allocate
> memory.
>
> I'm building the latest linux-ath tree now and will test that when it
> is done, but I am curious to know if anyone has successfully booted
> 9984 on x86-64?
>
> Thanks,
> Ben
>

Today's stock linux-ath and stock 9984 firmware with 9984 NIC crashes on bootup as well :(

How completely frustrating!

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
