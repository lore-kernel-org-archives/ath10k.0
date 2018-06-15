Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fTcRT-0003Y2-JT
 for ath10k@lists.infradead.org; Fri, 15 Jun 2018 00:18:17 +0000
Subject: Re: [PATCH v2] ath10k: Update the phymode along with bandwidth change
 request
References: <1528482759-12604-1-git-send-email-ryanhsu@codeaurora.org>
 <87h8m5ag8l.fsf@kamboji.qca.qualcomm.com>
From: Ryan Hsu <ryanhsu@codeaurora.org>
Message-ID: <4735b5f6-702c-d26e-a9d8-24f4c0e66a82@codeaurora.org>
Date: Thu, 14 Jun 2018 17:16:19 -0700
MIME-Version: 1.0
In-Reply-To: <87h8m5ag8l.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, timur.kristof@gmail.com

On 06/14/2018 02:07 AM, Kalle Valo wrote:

> BTW, I don't recommend using "---" or similar delimeters in the actual
> commit log. Git uses that string as a separator between the commit log
> and actual patch and that broke my patchwork script. I fixed the commit
> log manually in the pending branch, and added Timur's Tested-by, please
> check (I hope I got UTF-8 correct!):
>
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=master-pending&id=5aee6aeda5dae74e1c79256fc1df2e7599038fa7
>

Thanks Kalle, patch looks good to me, will avoid use "---".

-- 
Ryan Hsu


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
