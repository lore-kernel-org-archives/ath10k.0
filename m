Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YLuMz-00077y-9U
 for ath10k@lists.infradead.org; Thu, 12 Feb 2015 14:03:53 +0000
Message-ID: <54DCB1BD.8090500@qti.qualcomm.com>
Date: Thu, 12 Feb 2015 19:29:25 +0530
From: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Fix interrupt storm
References: <1423717162-7788-1-git-send-email-vthiagar@qti.qualcomm.com>
 <CA+BoTQmFhuK5vt8UnDu7CkH2=vUqGY8WkkXEgwoSb-NUoEYH-w@mail.gmail.com>
 <54DC517B.80402@qti.qualcomm.com>
In-Reply-To: <54DC517B.80402@qti.qualcomm.com>
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

>
>>
>> Moreover I'm pretty sure this patch breaks STA 4addr bridging. I'm
>> worried it also breaks other stuff (e.g  some IBSS usecases or even
>> some AP usecases) but I don't have time to check this now.
>
> Can you please elaborate on this one?. I can review if we can for these
> cases as well before disabling promiscuous mode.

Instead of making the fix specific to some interface type (AP), it will be
good to understand the issue with STA and IBSS if we disable promiscuous mode.
As you know, it will be uglier if the fix has to be interface specific.

Vasanth

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
