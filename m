Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XlpPp-0006gc-9V
 for ath10k@lists.infradead.org; Wed, 05 Nov 2014 01:29:41 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2] ath10k: handle ieee80211 header and payload tracing
 separately
References: <1414661336-20764-1-git-send-email-rmanohar@qti.qualcomm.com>
 <874muf7t9u.fsf@kamboji.qca.qualcomm.com>
 <20141104051643.GA14509@qca.qualcomm.com>
Date: Wed, 5 Nov 2014 03:29:13 +0200
In-Reply-To: <20141104051643.GA14509@qca.qualcomm.com> (Rajkumar Manoharan's
 message of "Tue, 4 Nov 2014 10:46:45 +0530")
Message-ID: <87k33a1lli.fsf@kamboji.qca.qualcomm.com>
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
To: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>, ath10k@lists.infradead.org

Rajkumar Manoharan <rmanohar@qti.qualcomm.com> writes:

> On Tue, Nov 04, 2014 at 01:34:37AM +0200, Kalle Valo wrote:
>> Rajkumar Manoharan <rmanohar@qti.qualcomm.com> writes:
>> 
>> > For packet log, the transmitted frame 802.11 header alone is sufficient.
>> > Recording entire packet is also consuming lot of disk space. To optimize
>> > this, tx and rx data tracepoints are splitted into header and payload
>> > tracepoints.
>> >  
>> > -DECLARE_EVENT_CLASS(ath10k_data_event,
>> > +#define ATH10K_FRM_HDR_LEN  \
>> > +	ieee80211_hdrlen(((struct ieee80211_hdr *)data)->frame_control)
>> 
>> This macro does not look good. I would recommend to follow what Johannes
>> suggested:
>>
>> "It would be worth hiding that inside the tracepoint's assign function,
>> so instead of passing data/len here you'd pass the full skb, or the full
>> skb data/skb len, like this:
>> 
>> ar, skb->data, skb->len
>> 
>> to both tracers. Then inside the tracer you can do the hdrlen check, and
>> that way move the code into the tracing so it's not hit when tracing is
>> disabled."
>
> v2 does the same. tracing functions just take ar, skb->data and skb->len.
> header check is handled inside tracing funtions.
>
> I do not understand your concerns. :(

Sorry, I was confusing. I meant that wouldn't it be better to pass the
skb pointer instead of skb-data and skb->len? I understood that was what
Johannes suggested.

But ATH10K_FRM_HDR_LEN is the problem. To simplify this, what if you
just always send the first 30 bytes (or whatever would be the max header
length)? Also should you check that skb->len is at least the length
defined by ieee80211_hdrlen()?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
