Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eH472-00062O-4L
 for ath10k@lists.infradead.org; Tue, 21 Nov 2017 08:41:02 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCHv3 1/2] ath10k: add per peer htt tx stats support for 10.4
Date: Tue, 21 Nov 2017 08:40:34 +0000
Message-ID: <87h8toc9dq.fsf@kamboji.qca.qualcomm.com>
References: <1479227849-10042-1-git-send-email-akolli@qti.qualcomm.com>
 <87tvxocbcn.fsf@kamboji.qca.qualcomm.com>
 <9ab6ffcf-0131-1fb1-13ef-076ec54bd582@dd-wrt.com>
 <4295821.C9ZrSID8fs@bentobox>
In-Reply-To: <4295821.C9ZrSID8fs@bentobox> (Sven Eckelmann's message of "Tue, 
 21 Nov 2017 09:20:32 +0100")
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
To: Sven Eckelmann <sven.eckelmann@openmesh.com>
Cc: Yifeng Tu <yifeng@qti.qualcomm.com>, Daniel Jeang <dyjeong@qti.qualcomm.com>, Anilkumar Kolli <akolli@qti.qualcomm.com>, "akolli@codeaurora.org" <akolli@codeaurora.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Sebastian Gottschall <s.gottschall@dd-wrt.com>

Sven Eckelmann <sven.eckelmann@openmesh.com> writes:

> On Dienstag, 21. November 2017 09:00:54 CET Sebastian Gottschall wrote:
> [...]
>> >> Why is the support for 10.2.4 firmware not upstreamed? I mean the one which is
>> >> using pktlog to transfer the PEER_STATS information.
>> > I'm not sure what you are asking. If you are asking the firmware release
>> > mentioned in the commit log that's in ath10k-firmware:
>> >
>> > https://github.com/kvalo/ath10k-firmware/tree/master/QCA4019/hw1.0/3.2.1
>> >
>> > But I'm sure you know that already.
>> 
>> i believe he is just talking about a patch which allows to get station 
>> statistics like rx and tx rate on the firmare 10.2 series which is 
>> qca988x mainly
>> 
>> this patch was posted here months ago but never got upstream
>
> Yes, I was talking about that patch (which I didn't find on the
> mailing list - so a link would be helpful). QCA is gathering a lot of
> patches (a00-*) at
> https://source.codeaurora.org/quic/qsdk/oss/system/feeds/wlan-open/tree/mac80211/patches?h=coconut
> which are often not upstreamed.

Oh, that. I have always told the team working on that repository that
they should upstream everything but obviously they don't :/

> The patch
> a00-0075-ath10k-Add-support-to-parse-per-station-tx-stats-for.patch is
> the one which is receiving the TX statistics stuff from 10.2.

I tried to find that patch from the ath10k list archives but didn't find
it. I only did a quick search so of course it might be submitted still,
so if anyone finds a link please let me know.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
