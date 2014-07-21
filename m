Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X9HQW-0000Gt-IR
 for ath10k@lists.infradead.org; Mon, 21 Jul 2014 17:31:05 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: handle attention flags correctly when A-MSDU
References: <1405342041-7114-1-git-send-email-janusz.dziedzic@tieto.com>
 <87pph225mq.fsf@kamboji.qca.qualcomm.com>
 <CALhHN=q2XcvPiLpeDgw_DksU1xzQLvJtxjzk8iZte-VMd+viLg@mail.gmail.com>
Date: Mon, 21 Jul 2014 20:30:32 +0300
In-Reply-To: <CALhHN=q2XcvPiLpeDgw_DksU1xzQLvJtxjzk8iZte-VMd+viLg@mail.gmail.com>
 (Janusz Dziedzic's message of "Mon, 21 Jul 2014 10:53:16 +0200")
Message-ID: <87ha2ay5zb.fsf@kamboji.qca.qualcomm.com>
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
To: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Cc: linux-wireless@vger.kernel.org, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Janusz Dziedzic <janusz.dziedzic@tieto.com> writes:

> On 18 July 2014 14:50, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>> Janusz Dziedzic <janusz.dziedzic@tieto.com> writes:
>>
>>> In case of A-MSDU RX we should check flags for all
>>> MSDU subframes to be sure we have correct FCS status.
>>>
>>> Before we check attention flags only for first frame
>>> where we didn't have correct info about FCS status in
>>> case of A-MSDU. Next didn't mark RX_FLAG_FAILED_FCS_CRC
>>> for skb. As a side efect we see big TP drop when TCP used.
>>> This was easy to reproduce when AP interface was used
>>> and added monitor interface run in promiscuous mode.
>>>
>>> Reported-by: Denton Gentry <denton.gentry@gmail.com>
>>> Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>
>>
>> I'm having a hard time to understand the commit log. I think it would
>> make it easier to read if you first clearly describe the bug you are
>> fixing and then, in a separate paragraph, tell how you fix it.
>
> Will change that.

Thanks. What you wrote in this email was really good, I understand the
issue now and I'm sure so do others. I think you should put the same in
the commit log, there's no max limit for that anyway :)

Also add verb "using" to the title: "ath10k: handle attention flags
correctly when using A-MSDU"

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
