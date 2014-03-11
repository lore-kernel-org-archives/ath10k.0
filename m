Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WNJYn-0006YS-T4
 for ath10k@lists.infradead.org; Tue, 11 Mar 2014 10:05:22 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [RFC 00/14] ath10k: Refactor rx path little bit
References: <1393937548-7482-1-git-send-email-janusz.dziedzic@tieto.com>
Date: Tue, 11 Mar 2014 12:04:50 +0200
In-Reply-To: <1393937548-7482-1-git-send-email-janusz.dziedzic@tieto.com>
 (Janusz Dziedzic's message of "Tue, 4 Mar 2014 13:52:13 +0100")
Message-ID: <87a9cxhwzh.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Janusz Dziedzic <janusz.dziedzic@tieto.com> writes:

> Refactor rx path, mainly split/reduce calculation we
> did before. Now we caculate variable/flags only once
> per-ppdu, while before we did some calculations for
> each mpdu. Kill some not needed code and fill directly
> ieee80211_rx_status structure.
> TP veryfication required.
>
> Janusz Dziedzic (14):
>   ath10k: add ath10k_htt_rx_amsdu_allowed function
>   ath10k: Fill per-ppdu info in rx_info only once
>   ath10k: move rx related functions to htt_rx.c
>   ath10k: rename process_rx_rates to ath10k_htt_rx_h_rates
>   ath10k: introduce ieee80211_rx_status to htt_rx_info
>   ath10k: kill signal field in htt_rx_info
>   ath10k: setup rx channel per ppdu
>   ath10k: kill rate substruct and tsf from htt_rx_info
>   ath10k: kill fcs_err from htt_rx_info
>   ath10k: kill mic_err/amsdu_more from htt_rx_info
>   ath10k: kill status from htt_rx_info
>   ath10k: kill encrypt_type from htt_rx_info
>   ath10k: return error when ath10k_htt_rx_amsdu_pop() fail
>   ath10k: improve way we play with attention flags

I did now a quick review:

I didn't fully understand your idea with rx status template.

I think the patchset is too long, it will be easier if you split these
into two. First set with all the easy and obvious stuff and a second one
for the rx status template.

Some of the patches are missing commit logs. Even if the patch is
obvious, please write a small commit log. Just oneliner would be enough.

I would prefer the commit logs to answer more why the change is needed.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
