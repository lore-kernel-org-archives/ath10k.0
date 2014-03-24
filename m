Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x22e.google.com ([2a00:1450:4010:c03::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WS1x3-00027s-5p
 for ath10k@lists.infradead.org; Mon, 24 Mar 2014 10:17:53 +0000
Received: by mail-la0-f46.google.com with SMTP id hr17so3450961lab.19
 for <ath10k@lists.infradead.org>; Mon, 24 Mar 2014 03:17:28 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87vbv46klt.fsf@kamboji.qca.qualcomm.com>
References: <1395394341-3958-1-git-send-email-janusz.dziedzic@tieto.com>
 <1395394341-3958-5-git-send-email-janusz.dziedzic@tieto.com>
 <87vbv46klt.fsf@kamboji.qca.qualcomm.com>
Date: Mon, 24 Mar 2014 11:17:28 +0100
Message-ID: <CALhHN=q0bK3qUDRtm-_zRKs-RFCpiVcGHihQPuHvMW7CVLiePg@mail.gmail.com>
Subject: Re: [PATCH 4/8] ath10k: setup rx channel per ppdu
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 24 March 2014 09:56, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Janusz Dziedzic <janusz.dziedzic@tieto.com> writes:
>
>> Setup band and frequency in ieee80211_rx_status
>> only once - for ppdu.
>>
>> Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>
>
> [...]
>
>> @@ -775,23 +794,7 @@ static void ath10k_process_rx(struct ath10k *ar, struct htt_rx_info *info)
>>       if (info->amsdu_more)
>>               status->flag |= RX_FLAG_AMSDU_MORE;
>>
>> -     status->signal = info->signal;
>
> What about the signal, how is it set now? I don't see that anywhere in
> this patch.
>
This belongs to next patch - will fix it.

BR
janusz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
