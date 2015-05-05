Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YplR3-0002uR-1j
 for ath10k@lists.infradead.org; Tue, 05 May 2015 22:35:29 +0000
Received: from [192.168.100.236] (unknown [50.251.239.81])
 (using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id 982C740B2CD
 for <ath10k@lists.infradead.org>; Tue,  5 May 2015 15:35:04 -0700 (PDT)
Message-ID: <55494598.2060603@candelatech.com>
Date: Tue, 05 May 2015 15:35:04 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: htt_rx questions in 4.0 kernel.
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

I am slowly tracking down problems with receiving data frames
on 3.19 and higher kernels, when using my rx-sw-crypt patch
and CT firmware.

I think the main thing my patch is changing in this case is that
the frames are received in raw mode with this patch enabled.

Hard to do a bisect, because the rx logic changed so much and I
have to apply fairly tricky patches to make my feature work, but
3.18 and earlier seem to work fine, and 3.19 and 4.0 does not.

Latest clue appears to be that ARP frames are received fine (data
contents looks right), but the stack fails the is_data() check.

While poking at this further, I noticed that ath10k_htt_rx_h_undecap
defines 'hdr' and assigns it, but never uses it.

I also do not see the first_hdr used when decapping raw
frames.

Maybe that is part of the problem?

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
