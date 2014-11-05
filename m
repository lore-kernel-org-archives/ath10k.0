Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xlx7d-0007CC-8V
 for ath10k@lists.infradead.org; Wed, 05 Nov 2014 09:43:25 +0000
Date: Wed, 5 Nov 2014 15:14:39 +0530
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: Re: [PATCH v2] ath10k: handle ieee80211 header and payload tracing
 separately
Message-ID: <20141105094437.GA21839@qca.qualcomm.com>
References: <1414661336-20764-1-git-send-email-rmanohar@qti.qualcomm.com>
 <874muf7t9u.fsf@kamboji.qca.qualcomm.com>
 <20141104051643.GA14509@qca.qualcomm.com>
 <87k33a1lli.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87k33a1lli.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>, ath10k@lists.infradead.org

On Wed, Nov 05, 2014 at 03:29:13AM +0200, Kalle Valo wrote:
> Rajkumar Manoharan <rmanohar@qti.qualcomm.com> writes:
> 
> > On Tue, Nov 04, 2014 at 01:34:37AM +0200, Kalle Valo wrote:
> >> Rajkumar Manoharan <rmanohar@qti.qualcomm.com> writes:
> >> 
> >> > -DECLARE_EVENT_CLASS(ath10k_data_event,
> >> > +#define ATH10K_FRM_HDR_LEN  \
> >> > +	ieee80211_hdrlen(((struct ieee80211_hdr *)data)->frame_control)
> >> 
> >> This macro does not look good. I would recommend to follow what Johannes
> >> suggested:
> >>
> >
> > v2 does the same. tracing functions just take ar, skb->data and skb->len.
> > header check is handled inside tracing funtions.
> >
> > I do not understand your concerns. :(
> 
> Sorry, I was confusing. I meant that wouldn't it be better to pass the
> skb pointer instead of skb-data and skb->len? I understood that was what
> Johannes suggested.
> 
> But ATH10K_FRM_HDR_LEN is the problem. To simplify this, what if you
> just always send the first 30 bytes (or whatever would be the max header
> length)? Also should you check that skb->len is at least the length
> defined by ieee80211_hdrlen()?
>
The goal of header & payload split is to reduce the amount of data being
collected. Sending maximum header size always will unnecessarily
increase the trace.dat size as hdr_size for mgmt and beacon always be 24.
This will also increase tracing traffic when it is being collected in
remote machine.

since tracepoints are being called only after the preprocessing,
skb->len never be lesser than 802.11 header size.

The macro is defined to ease readability and reduce # of line changes.
I originally thought of naming the macro as IEEE80211_HDR_LEN. But such
definition does not look correct inside driver.

-Rajkumar

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
