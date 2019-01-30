Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gonAO-0002YZ-ND
 for ath10k@lists.infradead.org; Wed, 30 Jan 2019 10:32:26 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: snoc: remove set but not used variable 'ar_snoc'
References: <1536200965-121172-1-git-send-email-yuehaibing@huawei.com>
 <4b16caf3-9a25-99d0-5b35-f27d6e5a5c65@huawei.com>
 <CA+ASDXMQto_dqPOuUEX9vqqbWmor8qvpwxBVTg6tSnHkfsCzpw@mail.gmail.com>
Date: Wed, 30 Jan 2019 12:32:17 +0200
In-Reply-To: <CA+ASDXMQto_dqPOuUEX9vqqbWmor8qvpwxBVTg6tSnHkfsCzpw@mail.gmail.com>
 (Brian Norris's message of "Tue, 29 Jan 2019 10:12:42 -0800")
Message-ID: <878sz2l9la.fsf@kamboji.qca.qualcomm.com>
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
To: Brian Norris <briannorris@chromium.org>
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>, ath10k@lists.infradead.org

Brian Norris <briannorris@chromium.org> writes:

> On Mon, Jan 28, 2019 at 9:53 PM YueHaibing <yuehaibing@huawei.com> wrote:
>>
>> ping...
>
> For some reason, your patch shows up as Deferred in patchwork:
>
> https://patchwork.kernel.org/patch/10589789/
>
> So the maintainers have accidentally (?) ignored it.

Actually I put it deliberately to deferred as I wanted to apply Govind's
QMI patches first and only then this. But unfortunately the deferred
patches have been piled up by other patches so I haven't taken this
patch yet.

> I'm not what the official suggestion is for that, but you might just
> resend.

No need to resend, I can just change the state from Deferred to New. But
I see that the patch was already resent so I'll drop this version now.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
