Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fxAZj-0001dc-T3
 for ath10k@lists.infradead.org; Tue, 04 Sep 2018 12:36:59 +0000
MIME-Version: 1.0
Date: Tue, 04 Sep 2018 18:06:44 +0530
From: Balaji Pothunoori <bpothuno@codeaurora.org>
Subject: Re: [PATCH v3] ath10k: average ack rssi support for data frames
In-Reply-To: <87va7l78vp.fsf@kamboji.qca.qualcomm.com>
References: <1536062951-17955-1-git-send-email-bpothuno@codeaurora.org>
 <87va7l78vp.fsf@kamboji.qca.qualcomm.com>
Message-ID: <aa4584654d70628c0f553d96786b49ea@codeaurora.org>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 2018-09-04 17:49, Kalle Valo wrote:
> Balaji Pothunoori <bpothuno@codeaurora.org> writes:
> 
>> Average ack rssi value is weighted average of ack rssi for
>> no of msdu's has been sent.
>> This feature is enabled by the host driver if firmware is capable.
>> After receiving event from host, firmware allocates the necessary
>> memory to store the ack_rssi for data packets during the init time.
>> 
>> After each successful transmission, If tx completion status is OK
>> and 24th bit is set in HTT message header then host will fetch the
>> ack_rssi else host can ignore the ack_rssi field
>> 
>> Signed-off-by: Balaji Pothunoori <bpothuno@codeaurora.org>
>> ---
>> v2:
>>    Addressed ath10k-check warnings
>> v3:
>>    cfg80211/mac80211 changes are already merged hence
>>    rebased ath10k patch alone.
> 
> Heh, we had a collision. Just 2 hours ago I rebased v2, fixed some
> conflicts and it's now in pending branch:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=ca376d236d335ccc9475ea1ab49df4643d8246b7
> 
> So please check that, and if it's good most likely I'll drop this v3.

Thanks kalle,
I am fine with the changes and you can ignore this v3.

Regards,
Balaji.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
