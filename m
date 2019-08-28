Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-tai-02.qualcomm.com ([103.229.16.227])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2pWm-0005tt-MI
 for ath10k@lists.infradead.org; Wed, 28 Aug 2019 04:25:50 +0000
Subject: RE: [PATCH 1/7] ath10k: enable RX bundle receive for sdio
From: Wen Gong <wgong@qti.qualcomm.com>
Date: Wed, 28 Aug 2019 04:25:40 +0000
Message-ID: <032d964e076f4d34ac516863b031bf17@aptaiexm02f.ap.qualcomm.com>
References: <1566302108-18219-1-git-send-email-wgong@codeaurora.org>
 <1566302108-18219-2-git-send-email-wgong@codeaurora.org>
 <CANMq1KBR0nd+XOJWpgWyoJdsFgZByQyjD-0dpttygiN0OfiD5Q@mail.gmail.com>
 <2ec213d88ebb4b89812826866b39886d@aptaiexm02f.ap.qualcomm.com>
 <CANMq1KCiH8-16esCfwi+60=ArZKC0G83Qs-W2Hq5GARar=6D9g@mail.gmail.com>
In-Reply-To: <CANMq1KCiH8-16esCfwi+60=ArZKC0G83Qs-W2Hq5GARar=6D9g@mail.gmail.com>
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
To: Nicolas Boichat <drinkcat@chromium.org>
Cc: "open list:NETWORKING DRIVERS (WIRELESS)" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Wen Gong <wgong@codeaurora.org>

> -----Original Message-----
> From: ath10k <ath10k-bounces@lists.infradead.org> On Behalf Of Nicolas
> Boichat
> Sent: Tuesday, August 27, 2019 4:08 PM
> To: Wen Gong <wgong@qti.qualcomm.com>
> Cc: open list:NETWORKING DRIVERS (WIRELESS) <linux-
> wireless@vger.kernel.org>; ath10k@lists.infradead.org; Wen Gong
> <wgong@codeaurora.org>
> Subject: [EXT] Re: [PATCH 1/7] ath10k: enable RX bundle receive for sdio
> 
> On Tue, Aug 27, 2019 at 4:03 PM Wen Gong <wgong@qti.qualcomm.com>
> wrote:
> >
> > > -----Original Message-----
> > > From: ath10k <ath10k-bounces@lists.infradead.org> On Behalf Of Nicolas
> > > Boichat
> > > Sent: Tuesday, August 27, 2019 3:41 PM
> > > To: Wen Gong <wgong@codeaurora.org>
> > > Cc: open list:NETWORKING DRIVERS (WIRELESS) <linux-
> > > wireless@vger.kernel.org>; ath10k@lists.infradead.org
> > > Subject: [EXT] Re: [PATCH 1/7] ath10k: enable RX bundle receive for sdio
> > The bundled buffer len is 256 * 3 = 768, it has 256 bytes for each packet,
> the left size is padding which
> > Is not needed, but the left padding is not same for each packet, before read
> all the buffer from sdio bus,
> > It does not know each packet's act len, it only know the 1st packet's act len.
> > So it need to copy all the alloc_len's buffer to ensure it will not lose data.
> 
> Gotcha, thanks.
Patch v2 sent with the changes, https://patchwork.kernel.org/patch/11116681/
> 
> > > Actually, just use skb_put_data.
> > >
> > > Also, do you have the same issue as
> > > https://patchwork.kernel.org/patch/11116215/ w.r.t. act_len being
> > > incorrect?
> > >
> > > > +               pkt->status = 0;
> > > > +               skb_put(skb, pkt->act_len);
> 
> So I guess this is incorrect, see patchwork linked above.
> 
> > > > +               pkt_offset += pkt->alloc_len;
> > > >         }
> > > >
> > > >         return 0;
> > > >
> > >
> > > _______________________________________________
> > > ath10k mailing list
> > > ath10k@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/ath10k
> 
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
