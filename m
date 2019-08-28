Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-tai-01.qualcomm.com ([103.229.16.226])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2nkP-0002ko-Kd
 for ath10k@lists.infradead.org; Wed, 28 Aug 2019 02:31:47 +0000
Subject: RE: [PATCH 2/7] ath10k: change max RX bundle size from 8 to 32 for
 sdio
From: Wen Gong <wgong@qti.qualcomm.com>
Date: Wed, 28 Aug 2019 02:31:34 +0000
Message-ID: <166d63589ee043c9bc5fab8e837a5aa1@aptaiexm02f.ap.qualcomm.com>
References: <1566302108-18219-1-git-send-email-wgong@codeaurora.org>
 <1566302108-18219-3-git-send-email-wgong@codeaurora.org>
 <CANMq1KBRMnVqw5rcnVcJs1UjYJxh+RqAEKSAjboojoMgJQpSDw@mail.gmail.com>
In-Reply-To: <CANMq1KBRMnVqw5rcnVcJs1UjYJxh+RqAEKSAjboojoMgJQpSDw@mail.gmail.com>
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
To: Nicolas Boichat <drinkcat@chromium.org>, Wen Gong <wgong@codeaurora.org>
Cc: "open list:NETWORKING DRIVERS (WIRELESS)" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

> -----Original Message-----
> From: ath10k <ath10k-bounces@lists.infradead.org> On Behalf Of Nicolas
> Boichat
> Sent: Tuesday, August 27, 2019 3:43 PM
> To: Wen Gong <wgong@codeaurora.org>
> Cc: open list:NETWORKING DRIVERS (WIRELESS) <linux-
> wireless@vger.kernel.org>; ath10k@lists.infradead.org
> Subject: [EXT] Re: [PATCH 2/7] ath10k: change max RX bundle size from 8 to
> 32 for sdio
> 
> > @@ -501,6 +501,7 @@ static int ath10k_sdio_mbox_alloc_bundle(struct
> ath10k *ar,
> >         int ret, i;
> >
> >         *bndl_cnt = FIELD_GET(ATH10K_HTC_FLAG_BUNDLE_MASK, htc_hdr-
> >flags);
> > +       *bndl_cnt += (FIELD_GET(GENMASK(3, 2), htc_hdr->flags) << 4);
> 
> GENMASK(3, 2): Please define this macro somewhere.
> 
> Also, I'd merge the 2 lines in 1.
Patch v2 has sent, https://patchwork.kernel.org/patch/11116677/
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
