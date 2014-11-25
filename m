Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XtCMe-0007a6-6O
 for ath10k@lists.infradead.org; Tue, 25 Nov 2014 09:24:52 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: don't drop corrupted mgmt frames
References: <1416839648-31803-1-git-send-email-michal.kazior@tieto.com>
 <87egsr1wj7.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQnk+40Pxkxfcu47Z-3j=8h2iMP8tKqXKf2GhAY3WkQxCw@mail.gmail.com>
Date: Tue, 25 Nov 2014 11:24:26 +0200
In-Reply-To: <CA+BoTQnk+40Pxkxfcu47Z-3j=8h2iMP8tKqXKf2GhAY3WkQxCw@mail.gmail.com>
 (Michal Kazior's message of "Tue, 25 Nov 2014 10:22:04 +0100")
Message-ID: <871tor1vlh.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior <michal.kazior@tieto.com> writes:

> On 25 November 2014 at 10:04, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>> Michal Kazior <michal.kazior@tieto.com> writes:
> [...]
>>> @@ -1394,12 +1396,19 @@ static bool ath10k_htt_rx_amsdu_allowed(struct ath10k *ar,
>>>               return false;
>>>       }
>>>
>>> +     is_mgmt = !!(rxd->attention.flags &
>>> +                  __cpu_to_le32(RX_ATTENTION_FLAGS_MGMT_TYPE));
>>> +     has_fcs_err = !!(rxd->attention.flags &
>>> +                      __cpu_to_le32(RX_ATTENTION_FLAGS_FCS_ERR));
>>
>> I think I asked this before in some other patch, but isn't '!!' operator
>> useless here? is_mgmt is a boolean so the compiler should convert it
>> correctly without '!!' anyway, right?
>
> If I remove `!!` I get:
>
>  warning: incorrect type in assignment (different base types)
>     expected bool [unsigned] [usertype] is_mgmt
>     got restricted __le32

Oh. Sorry, my bad.

> I could do a temporary `u32 attention` to get rid of the `!!`. You
> want me to update it?

Please don't, this is fine.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
