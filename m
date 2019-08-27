Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2WWW-0001YV-Gs
 for ath10k@lists.infradead.org; Tue, 27 Aug 2019 08:08:18 +0000
Received: by mail-qk1-x742.google.com with SMTP id m10so16300397qkk.1
 for <ath10k@lists.infradead.org>; Tue, 27 Aug 2019 01:08:16 -0700 (PDT)
MIME-Version: 1.0
References: <1566302108-18219-1-git-send-email-wgong@codeaurora.org>
 <1566302108-18219-2-git-send-email-wgong@codeaurora.org>
 <CANMq1KBR0nd+XOJWpgWyoJdsFgZByQyjD-0dpttygiN0OfiD5Q@mail.gmail.com>
 <2ec213d88ebb4b89812826866b39886d@aptaiexm02f.ap.qualcomm.com>
In-Reply-To: <2ec213d88ebb4b89812826866b39886d@aptaiexm02f.ap.qualcomm.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Tue, 27 Aug 2019 16:08:04 +0800
Message-ID: <CANMq1KCiH8-16esCfwi+60=ArZKC0G83Qs-W2Hq5GARar=6D9g@mail.gmail.com>
Subject: Re: [PATCH 1/7] ath10k: enable RX bundle receive for sdio
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
To: Wen Gong <wgong@qti.qualcomm.com>
Cc: "open list:NETWORKING DRIVERS (WIRELESS)" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Wen Gong <wgong@codeaurora.org>

On Tue, Aug 27, 2019 at 4:03 PM Wen Gong <wgong@qti.qualcomm.com> wrote:
>
> > -----Original Message-----
> > From: ath10k <ath10k-bounces@lists.infradead.org> On Behalf Of Nicolas
> > Boichat
> > Sent: Tuesday, August 27, 2019 3:41 PM
> > To: Wen Gong <wgong@codeaurora.org>
> > Cc: open list:NETWORKING DRIVERS (WIRELESS) <linux-
> > wireless@vger.kernel.org>; ath10k@lists.infradead.org
> > Subject: [EXT] Re: [PATCH 1/7] ath10k: enable RX bundle receive for sdio
> >
> > > -static int ath10k_sdio_mbox_rx_fetch(struct ath10k *ar)
> > > +static int ath10k_sdio_mbox_rx_fetch_bundle(struct ath10k *ar)
> > >  {
> > >         struct ath10k_sdio *ar_sdio = ath10k_sdio_priv(ar);
> > > +       struct ath10k_sdio_rx_data *pkt;
> > >         int ret, i;
> > > +       u32 pkt_offset, virt_pkt_len;
> > >
> > > +       virt_pkt_len = 0;
> > >         for (i = 0; i < ar_sdio->n_rx_pkts; i++) {
> > > -               ret = ath10k_sdio_mbox_rx_packet(ar,
> > > -                                                &ar_sdio->rx_pkts[i]);
> > > -               if (ret)
> > > +               virt_pkt_len += ar_sdio->rx_pkts[i].alloc_len;
> > > +       }
> > > +
> > > +       if (virt_pkt_len < ATH10K_SDIO_DMA_BUF_SIZE) {
> > > +               ret = ath10k_sdio_readsb(ar, ar_sdio->mbox_info.htc_addr,
> > > +                                        ar_sdio->vsg_buffer, virt_pkt_len);
> > > +               if (ret) {
> > > +                       i = 0;
> > >                         goto err;
> > > +               }
> > > +       } else {
> > > +               ath10k_err(ar, "size exceeding limit %d\n", virt_pkt_len);
> > > +       }
> > > +
> > > +       pkt_offset = 0;
> > > +       for (i = 0; i < ar_sdio->n_rx_pkts; i++) {
> > > +               struct sk_buff *skb = ar_sdio->rx_pkts[i].skb;
> > > +
> > > +               pkt = &ar_sdio->rx_pkts[i];
> > > +               memcpy(skb->data, ar_sdio->vsg_buffer + pkt_offset,
> > > +                      pkt->alloc_len);
> >
> > Why do you copy alloc_len if you only plan to use act_len?
> alloc_len is aligned to block size(256),  and act_len maybe not same for each packet in the bundle.
> Eg a bundle:
> Packet 1 len 240,   alloc_len: 256, 1st time: act_len 240, left padding size is 16,
> Packet 1 len 250, alloc_len: 256, 1st time: act_len 240, left padding size is 6,
> Packet 1 len 230,   alloc_len: 256, 1st time: act_len 240, left padding size is 26,
>
> The bundled buffer len is 256 * 3 = 768, it has 256 bytes for each packet, the left size is padding which
> Is not needed, but the left padding is not same for each packet, before read all the buffer from sdio bus,
> It does not know each packet's act len, it only know the 1st packet's act len.
> So it need to copy all the alloc_len's buffer to ensure it will not lose data.

Gotcha, thanks.

> > Actually, just use skb_put_data.
> >
> > Also, do you have the same issue as
> > https://patchwork.kernel.org/patch/11116215/ w.r.t. act_len being
> > incorrect?
> >
> > > +               pkt->status = 0;
> > > +               skb_put(skb, pkt->act_len);

So I guess this is incorrect, see patchwork linked above.

> > > +               pkt_offset += pkt->alloc_len;
> > >         }
> > >
> > >         return 0;
> > >
> >
> > _______________________________________________
> > ath10k mailing list
> > ath10k@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
