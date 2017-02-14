Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cdejv-0007ej-RX
 for ath10k@lists.infradead.org; Tue, 14 Feb 2017 15:10:02 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: All '0' in agg_status
Date: Tue, 14 Feb 2017 15:09:18 +0000
Message-ID: <87vascq06i.fsf@kamboji.qca.qualcomm.com>
References: <CAJ-VmomSTUAONqeOTZEqm_ApU64r1=RSqm8=Y6u+Km+OkL_JQA@mail.gmail.com>
 <328523ea1b53d27f8a72b776481c15dc@cvweb05.wmail.nhnsystem.com>
 <44c5a11bf373394ee73ca1dfa9f6d37a@cvweb08.wmail.nhnsystem.com>
 <81378355ff1438395ca925d181791dbb@cvweb06.wmail.nhnsystem.com>
In-Reply-To: <81378355ff1438395ca925d181791dbb@cvweb06.wmail.nhnsystem.com>
 (Kwang Min Kim's message of "Tue, 14 Feb 2017 17:26:37 +0900 (KST)")
Content-Language: en-US
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
To: Kwang Min Kim <gwondori@nimbus.kr>
Cc: =?ks_c_5601-1987?B?sK2w5r/P?= <bigskang@nimbus.kr>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Kwang Min Kim <gwondori@nimbus.kr> writes:

> I have two questions.
>
> 1. As a result of debugging 'ath10k' and 'mac80211', if there is a problem, ADDBA request and DELBA request are receive at 'station' side at the same time.
>    Could it be this?
>
>
> 2. The code below seems to fix the problem. (I did not consider the impact elsewhere.)
>    Is it the correct code? How do I fix the incorrect code?
>
> --- net/mac80211/iface.c
> +++ net/mac80211/iface.c

For mac80211 changes you should ask about that in linux-wireless mailing
list, but better also CC the ath10k list.

https://wireless.wiki.kernel.org/en/developers/mailinglists

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
