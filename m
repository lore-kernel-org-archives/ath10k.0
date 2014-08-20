Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XK5i5-0004ge-T9
 for ath10k@lists.infradead.org; Wed, 20 Aug 2014 13:13:54 +0000
Message-ID: <53F49EFC.5000008@candelatech.com>
Date: Wed, 20 Aug 2014 06:13:32 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH v7 2/8] ath10k: provide firmware crash info via debugfs
References: <20140819082038.16842.46876.stgit@potku.adurom.net>	<20140819082253.16842.32433.stgit@potku.adurom.net>	<CA+BoTQn2aq5EV4mvTs3Ww4i9gAJsmMM5iDfrFd=YfC0YxMi2WQ@mail.gmail.com>	<53F36C63.8040809@candelatech.com>
 <CA+BoTQ=ocpY2BDCGhMB7E9s4ykp18uXHMTc7rOn0qb7mDyZ5qw@mail.gmail.com>
In-Reply-To: <CA+BoTQ=ocpY2BDCGhMB7E9s4ykp18uXHMTc7rOn0qb7mDyZ5qw@mail.gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>


>>> Hmm should this really be sizeof()? Not next_idx (which effectively
>>> defines number of bytes of the dbglog)?
>>
>>
>> I haven't tried decoding this yet, but we may need to know the next_idx
>> to decode this properly.
>
> So basically a (length, payload) encoding would be necessary here
> instead of a single stream, right?

As long as you know the starting point for a message, you can decode the
rest of the message(s) as a stream of 32 bit ints.  The current code that
I wrote is a circular buffer, so after first wrap, we lose an idea of where
to start reading.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
