Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VON44-0005Vw-Q1
 for ath10k@lists.infradead.org; Tue, 24 Sep 2013 07:29:46 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [RFC 0/4] ath10k: improve RX performance
References: <1379335757-15180-1-git-send-email-michal.kazior@tieto.com>
 <87mwn2bu0i.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQnxqgz_90+Q8_FhM6PZh8CEW12dOA+ZGqHeYjK=Bbu9wA@mail.gmail.com>
Date: Tue, 24 Sep 2013 10:29:10 +0300
In-Reply-To: <CA+BoTQnxqgz_90+Q8_FhM6PZh8CEW12dOA+ZGqHeYjK=Bbu9wA@mail.gmail.com>
 (Michal Kazior's message of "Tue, 24 Sep 2013 09:19:50 +0200")
Message-ID: <8761tqbruh.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> On 24 September 2013 08:42, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>> Michal Kazior <michal.kazior@tieto.com> writes:
>>
>>> This patchset gives clear RX performance
>>> improvement on AP135. Throughput is at least
>>> doubled (300mbps -> 600mbps, UDP RX, 2x2).
>>>
>>> Patches depend on my RFC patch "mac80211: support
>>> reporting A-MSDU subframes individually".
>>
>> Preferably I can apply these changes only after the mac80211 patch goes
>> to net-next (to avoid unnecessary rebasing). Is there a way to
>> workaround the need for the mac80211 patch in ath10k so that we could
>> apply these patches ASAP? And once the mac80211 patch is commited we
>> could just remove the workaround in ath10k.
>
> The workaround could be to clear the retransmission flag when
> reporting A-MSDU frames individually.

That sounds very good. Can you do that and resend the patchset, please?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
