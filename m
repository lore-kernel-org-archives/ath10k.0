Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XBfyI-0008So-5n
 for ath10k@lists.infradead.org; Mon, 28 Jul 2014 08:07:50 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2] ath10k: extend debug code for RX path
References: <1406528765-4669-1-git-send-email-janusz.dziedzic@tieto.com>
 <53D5EF33.1080208@gmail.com>
 <CALhHN=rOF+-8gJCM4tBNk39ksd_F_w_h2GB=njP6N6PXqkZiXg@mail.gmail.com>
Date: Mon, 28 Jul 2014 11:07:12 +0300
In-Reply-To: <CALhHN=rOF+-8gJCM4tBNk39ksd_F_w_h2GB=njP6N6PXqkZiXg@mail.gmail.com>
 (Janusz Dziedzic's message of "Mon, 28 Jul 2014 09:52:30 +0200")
Message-ID: <87ppgplxe7.fsf@kamboji.qca.qualcomm.com>
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
Cc: Varka Bhadram <varkabhadram@gmail.com>, linux-wireless@vger.kernel.org, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Janusz Dziedzic <janusz.dziedzic@tieto.com> writes:

> On 28 July 2014 08:35, Varka Bhadram <varkabhadram@gmail.com> wrote:
>> On 07/28/2014 11:56 AM, Janusz Dziedzic wrote:
>>>
>>> Print sequence number, AMSDU_MORE flag and AC when additional
>>> debug enabled in RX path. This is usefull for debugging purpose.
>>>
>>> Signed-off-by: Janusz Dziedzic<janusz.dziedzic@tieto.com>
>>> ---
>>>   drivers/net/wireless/ath/ath10k/htt_rx.c |   41
>>> ++++++++++++++++++++++++++++--
>>>   1 file changed, 39 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c
>>> b/drivers/net/wireless/ath/ath10k/htt_rx.c
>>> index d80fcda..f7c8021 100644
>>> --- a/drivers/net/wireless/ath/ath10k/htt_rx.c
>>> +++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
>>> @@ -818,19 +818,55 @@ static bool ath10k_htt_rx_h_channel(struct ath10k
>>> *ar,
>>>         return true;
>>>   }
>>>   +static const char * const tid_to_ac[] = {
>>
>>
>> No space required '*' and const.
>
> Seems checkpatch didn't find this.

From a quick grep I saw that kernel has both "* const" and "*const". I
would say keep it as it is.

>>> +static char *ath10k_get_tid(struct ieee80211_hdr *hdr, char *out, size_t
>>> size)
>>> +{
>>> +       u8 *qc;
>>> +       int tid;
>>> +
>>> +       if (!ieee80211_is_data_qos(hdr->frame_control))
>>> +               return "";
>>
>>
>> return NULL would be more readable...?
>>
> We don't need extra "(null)" in printf, empty string is what I expect
> here (same as other params in this dbg info).
> Anyway I can return "out" here and initialize as empty before calling
> ath10k_get_tid().

IMHO return "" is more readable here.

>>> +                  is_multicast_ether_addr(ieee80211_get_DA(hdr)) ?
>>> +                                                       "mcast" : "ucast",
>>
>>
>> should match open paranthesis...
>>
>> is_multicast_ether_addr(ieee80211_get_DA(hdr)) ?
>>
>>                         "mcast" : "ucast",
>>
> Could you describe this more (I didn't find clear description about this)?

AFAICS there is no open parenthesis here to which align the indentation.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
