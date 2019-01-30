Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goejU-0004Yp-2i
 for ath10k@lists.infradead.org; Wed, 30 Jan 2019 01:32:05 +0000
Subject: Re: [PATCH] ath10k: snoc: remove set but not used variable 'ar_snoc'
References: <1536200965-121172-1-git-send-email-yuehaibing@huawei.com>
 <4b16caf3-9a25-99d0-5b35-f27d6e5a5c65@huawei.com>
 <CA+ASDXMQto_dqPOuUEX9vqqbWmor8qvpwxBVTg6tSnHkfsCzpw@mail.gmail.com>
From: YueHaibing <yuehaibing@huawei.com>
Message-ID: <a2b059fe-e527-0cff-2114-26f5bdaf7443@huawei.com>
Date: Wed, 30 Jan 2019 09:31:51 +0800
MIME-Version: 1.0
In-Reply-To: <CA+ASDXMQto_dqPOuUEX9vqqbWmor8qvpwxBVTg6tSnHkfsCzpw@mail.gmail.com>
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
To: Brian Norris <briannorris@chromium.org>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>


On 2019/1/30 2:12, Brian Norris wrote:
> On Mon, Jan 28, 2019 at 9:53 PM YueHaibing <yuehaibing@huawei.com> wrote:
>>
>> ping...
> 
> For some reason, your patch shows up as Deferred in patchwork:
> 
> https://patchwork.kernel.org/patch/10589789/
> 
> So the maintainers have accidentally (?) ignored it. I'm not what the
> official suggestion is for that, but you might just resend.

Thank you for your review,  I'll resend it.

> 
> In any case...
> 
>> On 2018/9/6 10:29, YueHaibing wrote:
>>> From: Yue Haibing <yuehaibing@huawei.com>
>>>
>>> Fixes gcc '-Wunused-but-set-variable' warning:
>>>
>>> drivers/net/wireless/ath/ath10k/snoc.c: In function 'ath10k_snoc_tx_pipe_cleanup':
>>> drivers/net/wireless/ath/ath10k/snoc.c:681:22: warning:
>>>  variable 'ar_snoc' set but not used [-Wunused-but-set-variable]
>>>
>>> Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
> 
> ...patch looks fine to me:
> 
> Reviewed-by: Brian Norris <briannorris@chromium.org>
> 
> 


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
