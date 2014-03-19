Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x22f.google.com ([2a00:1450:4010:c04::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQC2I-0002tp-Ua
 for ath10k@lists.infradead.org; Wed, 19 Mar 2014 08:39:44 +0000
Received: by mail-lb0-f175.google.com with SMTP id w7so5639799lbi.34
 for <ath10k@lists.infradead.org>; Wed, 19 Mar 2014 01:39:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87a9cxhwzh.fsf@kamboji.qca.qualcomm.com>
References: <1393937548-7482-1-git-send-email-janusz.dziedzic@tieto.com>
 <87a9cxhwzh.fsf@kamboji.qca.qualcomm.com>
Date: Wed, 19 Mar 2014 09:39:14 +0100
Message-ID: <CALhHN=p5E55ia5PvfdOoLBizrUywmPsayg8BD5R_A1wsAE2FEQ@mail.gmail.com>
Subject: Re: [RFC 00/14] ath10k: Refactor rx path little bit
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

On 11 March 2014 11:04, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Janusz Dziedzic <janusz.dziedzic@tieto.com> writes:
>
>> Refactor rx path, mainly split/reduce calculation we
>> did before. Now we caculate variable/flags only once
>> per-ppdu, while before we did some calculations for
>> each mpdu. Kill some not needed code and fill directly
>> ieee80211_rx_status structure.
>> TP veryfication required.
>>
>> Janusz Dziedzic (14):
>>   ath10k: add ath10k_htt_rx_amsdu_allowed function
>>   ath10k: Fill per-ppdu info in rx_info only once
>>   ath10k: move rx related functions to htt_rx.c
>>   ath10k: rename process_rx_rates to ath10k_htt_rx_h_rates
>>   ath10k: introduce ieee80211_rx_status to htt_rx_info
>>   ath10k: kill signal field in htt_rx_info
>>   ath10k: setup rx channel per ppdu
>>   ath10k: kill rate substruct and tsf from htt_rx_info
>>   ath10k: kill fcs_err from htt_rx_info
>>   ath10k: kill mic_err/amsdu_more from htt_rx_info
>>   ath10k: kill status from htt_rx_info
>>   ath10k: kill encrypt_type from htt_rx_info
>>   ath10k: return error when ath10k_htt_rx_amsdu_pop() fail
>>   ath10k: improve way we play with attention flags
>
> I did now a quick review:
>
> I didn't fully understand your idea with rx status template.
>
Mainly I split calculations we have to do per-ppdu and per-mpdu.
Before, we did calculation for each mpdu even that wasn't required. In
case of heavy
traffic we will have eg. 15 mpdus in one ppdu. In case of attention flags
we did 4 times __cpu_to_le32() for each rx`ed packet - while one calculation
will be enough. For me this seems like resources (CPU) usage improvement.

After some refactoring tries I decided to introduce this
ieee80211_rx_status template. Seems this is easiest option here.
This will be also similar code as we have already for fragmented RX packets.

Some patches are just some code cleanup (moving code, grouping in
function etc...)

> I think the patchset is too long, it will be easier if you split these
> into two. First set with all the easy and obvious stuff and a second one
> for the rx status template.
>
Will send V2

> Some of the patches are missing commit logs. Even if the patch is
> obvious, please write a small commit log. Just oneliner would be enough.
>
> I would prefer the commit logs to answer more why the change is needed.
>
> --
> Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
