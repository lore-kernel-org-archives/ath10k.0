Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bhsr9-0003XP-MY
 for ath10k@lists.infradead.org; Thu, 08 Sep 2016 06:30:40 +0000
Date: Thu, 8 Sep 2016 12:00:09 +0530
From: Mohammed Shafi Shajakhan <mohammed@codeaurora.org>
Subject: Re: [v5] ath10k: Fix broken NULL func data frame status for 10.4
Message-ID: <20160908063009.GA5735@atheros-ThinkPad-T61>
References: <1472199140-8404-1-git-send-email-mohammed@qca.qualcomm.com>
 <48c9092d7f6c468092ef093779624a36@euamsexm01a.eu.qualcomm.com>
 <1473151041373.34060@qti.qualcomm.com>
 <87bmzzugep.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87bmzzugep.fsf@kamboji.qca.qualcomm.com>
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
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: "Raja, Tamizh Chelvam" <c_traja@qti.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "Shajakhan,
 Mohammed Shafi (Mohammed Shafi)" <mohammed@qti.qualcomm.com>

On Thu, Sep 08, 2016 at 05:09:03AM +0000, Valo, Kalle wrote:
> "Shajakhan, Mohammed Shafi (Mohammed Shafi)" <mohammed@qti.qualcomm.com>
> writes:
> > please revert this patch, Raj suggested this patch introduced a
> > regression in sending NULL func frames :(
> >
> > We will fix the wrong tx status report for NULL func frames
> > appropriately (if needed in ath10k firmware) Sorry for the regression,
> > kindly revert it until a proper fix is figured out.
> 
> Like we discussed privately, it is better that you send the revert (or a
> fix if you find one) yourself. Then we have a proper commit log etc.
>
[shafi] thanks Kalle, agreed the revert is under hold (to fix this properly
and not make use of this workaround)

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
