Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqsfi-0006c3-LG
 for ath10k@lists.infradead.org; Tue, 05 Feb 2019 04:49:24 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH REGRESSION] Revert "ath10k: add quiet mode support for
 QCA6174/QCA9377"
References: <20181107185643.240346-1-briannorris@chromium.org>
 <20190204164254.86E0860734@smtp.codeaurora.org>
 <CA+ASDXO4bMY9tWjeKND1+7yBC47XimNEohQEpyA-TZxgS7Xiiw@mail.gmail.com>
Date: Tue, 05 Feb 2019 06:49:13 +0200
In-Reply-To: <CA+ASDXO4bMY9tWjeKND1+7yBC47XimNEohQEpyA-TZxgS7Xiiw@mail.gmail.com>
 (Brian Norris's message of "Mon, 4 Feb 2019 14:54:27 -0800")
Message-ID: <87pns6dely.fsf@kamboji.qca.qualcomm.com>
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
Cc: Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org, Yu Wang <yyuwang@codeaurora.org>, Rakesh Pillai <pillair@codeaurora.org>

Brian Norris <briannorris@chromium.org> writes:

> On Mon, Feb 4, 2019 at 8:43 AM Kalle Valo <kvalo@codeaurora.org> wrote:
>> Brian Norris <briannorris@chromium.org> wrote:
>>
>> > This reverts commit cfb353c0dc058bc1619cc226d3cbbda1f360bdd3.
>> >
>> > WCN3990 firmware does not yet implement this feature, and so it crashes
>> > like this:
>> >
>> >   fatal error received: err_qdi.c:456:EX:wlan_process:1:WLAN RT:207a:PC=b001b4f0
>> >
>> > This feature can be re-implemented with a proper service bitmap or other
>> > feature-discovery mechanism in the future. But it should not break
>> > working boards.
>> >
>> > Fixes: cfb353c0dc05 ("ath10k: add quiet mode support for QCA6174/QCA9377")
>> > Cc: Yu Wang <yyuwang@codeaurora.org>
>> > Cc: Rakesh Pillai <pillair@codeaurora.org>
>> > Cc: Govind Singh <govinds@codeaurora.org>
>> > Cc: <stable@vger.kernel.org>
>> > Signed-off-by: Brian Norris <briannorris@chromium.org>
>>
>> This regression should be fixed by (which is in v4.20):
>>
>> 53884577fbce ath10k: skip sending quiet mode cmd for WCN3990
>>
>> So this revert should not be needed anymore and I'll drop this.
>
> Yes, that seems to work for me. I'll probably replace the revert with
> the above in my downstream. Thanks!
>
> Can't really be fixed now, but it would have been nice to have a Fixes
> tag on that one.

Indeed. Sorry, missed that.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
