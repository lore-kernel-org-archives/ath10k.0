Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wka7m-0005BN-Qh
 for ath10k@lists.infradead.org; Wed, 14 May 2014 14:25:39 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 0/2] ath10k: warm reset fixes 2014-05-14
References: <1400050658-2763-1-git-send-email-michal.kazior@tieto.com>
 <87bnv0fnjm.fsf@kamboji.qca.qualcomm.com>
Date: Wed, 14 May 2014 17:25:10 +0300
In-Reply-To: <87bnv0fnjm.fsf@kamboji.qca.qualcomm.com> (Kalle Valo's message
 of "Wed, 14 May 2014 17:22:05 +0300")
Message-ID: <877g5ofneh.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Kalle Valo <kvalo@qca.qualcomm.com> writes:

> Michal Kazior <michal.kazior@tieto.com> writes:
>
>> Warm reset was not able to recover from a device
>> crash so ath10k was falling back to cold reset
>> which would occasionally hang the system or
>> generate a data bus error with some device chips.
>>
>> Warm reset now works a lot more reliably (at least
>> on my T430). It's able to recover from a "hard"
>> simulate fw crash and some firmware asserts I've
>> forced meaning it should recover in most cases
>> without falling back to the cold reset.
>>
>> There's still one case of a crash warm reset is
>> incapable to recover from: IOMMU faults (when
>> supported and enabled and device tries to access
>> non-DMA mapped host memory) trigger device crash
>> and leave CE totally unresponsive before and after
>> the warm reset.
>>
>>
>> Michal Kazior (2):
>>   ath10k: improve warm reset reliability
>>   ath10k: retry warm reset a few times
>
> The patches don't apply anymore and the conflict was not trivial enough
> for me to fix it. Can you rebase, please?

Sorry, I replied to the wrong thread. Please ignore what I said above!

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
