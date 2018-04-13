Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f6yqb-0003p7-Ov
 for ath10k@lists.infradead.org; Fri, 13 Apr 2018 13:34:39 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: Interest in getting ath10k-ct firmware support upstream?
References: <dda6f5f1-9e40-d7f4-07de-92633a4fdfbe@candelatech.com>
Date: Fri, 13 Apr 2018 16:34:22 +0300
In-Reply-To: <dda6f5f1-9e40-d7f4-07de-92633a4fdfbe@candelatech.com> (Ben
 Greear's message of "Thu, 22 Mar 2018 14:46:00 -0700")
Message-ID: <87po33qlgh.fsf@kamboji.qca.qualcomm.com>
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
To: Ben Greear <greearb@candelatech.com>
Cc: ath10k <ath10k@lists.infradead.org>

Ben Greear <greearb@candelatech.com> writes:

> I'm in the midst of porting my out-of-tree ath10k patches forward to
> the 4.16 kernel.
>
> In case you are interested in allowing support for ath10k-ct firmware
> in the upstream kernel, now would be a good time for me to work on
> this.
>
> Please let me know if you are interested.

I don't really know what is needed for your firmware so difficult to
really comment. And ath10k really does not support any specific firmware
branch per se, it uses more finegrained feature based detection anyway.

But as we are adding SDIO, USB and SNOC busses to ath10k, which is quite
a enourmous task itself, and trying to support even a different firmware
sounds really difficult.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
