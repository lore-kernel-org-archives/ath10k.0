Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iArQB-0006MB-Gc
 for ath10k@lists.infradead.org; Thu, 19 Sep 2019 08:04:13 +0000
MIME-Version: 1.0
Date: Thu, 19 Sep 2019 13:34:06 +0530
From: Balaji Pothunoori <bpothuno@codeaurora.org>
Subject: Re: [PATCH v4 3/3] ath10k: add support for controlling tx power to a
 station
In-Reply-To: <20190919002100.GA28186@localhost>
References: <1553856587-21611-1-git-send-email-bpothuno@codeaurora.org>
 <20190402223709.GB8910@localhost> <871rwdbu1p.fsf@kamboji.qca.qualcomm.com>
 <20190919002100.GA28186@localhost>
Message-ID: <7fbdeb414ce3b03c57fb6fa86cdf8dc5@codeaurora.org>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Bob Copeland <me@bobcopeland.com>
Cc: johannes@sipsolutions.net, Ashok Raj Nagarajan <arnagara@codeaurora.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

On 2019-09-19 05:51, Bob Copeland wrote:
> On Wed, Sep 18, 2019 at 04:41:54PM +0300, Kalle Valo wrote:
>> Bob Copeland <me@bobcopeland.com> writes:
>> > - on A, changed the global tx power limit to 1 dBm
>> >   -> result: signal level dropped to ~ -95 dBm
>> >
>> > Reading the description above, now I'm wondering if the txpower is
>> > max(sta-power,global-power)?  If so, that seems a bit unintuitive to me,
>> > or at least isn't what I hoped for.  I'd prefer to have per-sta power
>> > setting override the global power.
>> 
>> Balaji, please reply to Bob's questions. I missed this thread while
>> applying v5, sorry Bob.
> 
> Just to follow-up, I ran more experiments since writing the above
> email and it didn't look like it was doing max() either -- at least
> on my hardware/firmware combo it had no effect at all that I could 
> tell.
> 

For QCA9984 allowed tx power range values from 6 to 23,
Same info mentioned in : https://patchwork.kernel.org/patch/10968517/

> I did verify that the wmi update went through to the firmware.
> 
> I can't remember now, but I may have been testing mesh mode in case
> that makes a difference.

We gave fix for tx power configuration in firmware 10.4-3.9.0.2-00046 .

Can you try with that ?


Regards,
Balaji.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
