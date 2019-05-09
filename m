Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hOiTG-0000jJ-Gq
 for ath10k@lists.infradead.org; Thu, 09 May 2019 12:48:24 +0000
Subject: RE: [PATCHv2] ath10k: Add wrapper function to ath10k debug
From: Venkateswara Naralasetty <vnaralas@qti.qualcomm.com>
Date: Thu, 9 May 2019 12:48:10 +0000
Message-ID: <f9e3446266064ef09f53cc54562013e2@APSANEXR01F.ap.qualcomm.com>
References: <1556283505-29539-1-git-send-email-vnaralas@codeaurora.org>
 <CABvG-CVxmnm=JsSsgYQqEzHHYU8RJDxqCZJn4Rzy=zPLtKY1hA@mail.gmail.com>
In-Reply-To: <CABvG-CVxmnm=JsSsgYQqEzHHYU8RJDxqCZJn4Rzy=zPLtKY1hA@mail.gmail.com>
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
To: =?iso-8859-2?Q?Micha=B3_Kazior?= <kazikcz@gmail.com>, Venkateswara
 Naralasetty <vnaralas@codeaurora.org>
Cc: Kan Yan <kyan@chromium.org>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>



> -----Original Message-----
> From: ath10k <ath10k-bounces@lists.infradead.org> On Behalf Of Michal
> Kazior
> Sent: Friday, April 26, 2019 7:15 PM
> To: Venkateswara Naralasetty <vnaralas@codeaurora.org>
> Cc: Kan Yan <kyan@chromium.org>; linux-wireless <linux-
> wireless@vger.kernel.org>; ath10k@lists.infradead.org
> Subject: [EXT] Re: [PATCHv2] ath10k: Add wrapper function to ath10k debug
> 
> On Fri, 26 Apr 2019 at 14:58, Venkateswara Naralasetty
> <vnaralas@codeaurora.org> wrote:
> >
> > ath10k_dbg() is called in ath10k_process_rx() with huge set of
> > arguments which is causing CPU overhead even when debug_mask is not
> set.
> > Good improvement was observed in the receive side performance when
> > call to ath10k_dbg() is avoided in the RX path.
> [...]
> 
> > +/* Avoid calling __ath10k_dbg() if debug_mask is not set and tracing
> > + * disabled.
> > + */
> > +#define ath10k_dbg(ar, dbg_mask, fmt, ...)                     \
> > +do {                                                           \
> > +       if ((ath10k_debug_mask & dbg_mask) ||                   \
> > +           trace_ath10k_log_dbg_enabled())                     \
> > +               __ath10k_dbg(ar, dbg_mask, fmt, ##__VA_ARGS__); \ }
> > +while (0)
> 
> Did you consider using jump labels (see include/linux/jump_label.h)?
> It's what tracing uses under the hood. I wonder if you could squeeze out a bit
> more performance with that? I guess you'd need to add `struct static_key
> ath10k_dbg_mask_keys[ATH10K_DBG_MAX]` and re-do
> ath10k_debug_mask enum a bit.
> 
I could not observe any significant Throughput/CPU improvement after using jump labels. For now shall we go with my patch?

Thanks,
Venkatesh.
> 
> Michal
> 
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
