Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XlWSh-0000Mm-Vb
 for ath10k@lists.infradead.org; Tue, 04 Nov 2014 05:15:24 +0000
Date: Tue, 4 Nov 2014 10:46:45 +0530
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: Re: [PATCH v2] ath10k: handle ieee80211 header and payload tracing
 separately
Message-ID: <20141104051643.GA14509@qca.qualcomm.com>
References: <1414661336-20764-1-git-send-email-rmanohar@qti.qualcomm.com>
 <874muf7t9u.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <874muf7t9u.fsf@kamboji.qca.qualcomm.com>
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

On Tue, Nov 04, 2014 at 01:34:37AM +0200, Kalle Valo wrote:
> Rajkumar Manoharan <rmanohar@qti.qualcomm.com> writes:
> 
> > For packet log, the transmitted frame 802.11 header alone is sufficient.
> > Recording entire packet is also consuming lot of disk space. To optimize
> > this, tx and rx data tracepoints are splitted into header and payload
> > tracepoints.
> >  
> > -DECLARE_EVENT_CLASS(ath10k_data_event,
> > +#define ATH10K_FRM_HDR_LEN  \
> > +	ieee80211_hdrlen(((struct ieee80211_hdr *)data)->frame_control)
> 
> This macro does not look good. I would recommend to follow what Johannes
> suggested:
>
> "It would be worth hiding that inside the tracepoint's assign function,
> so instead of passing data/len here you'd pass the full skb, or the full
> skb data/skb len, like this:
> 
> ar, skb->data, skb->len
> 
> to both tracers. Then inside the tracer you can do the hdrlen check, and
> that way move the code into the tracing so it's not hit when tracing is
> disabled."
v2 does the same. tracing functions just take ar, skb->data and skb->len.
header check is handled inside tracing funtions.

I do not understand your concerns. :(

-Rajkumar

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
