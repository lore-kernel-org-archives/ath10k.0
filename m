Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-tai-01.qualcomm.com ([103.229.16.226])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hLPkG-00064p-Sd
 for ath10k@lists.infradead.org; Tue, 30 Apr 2019 10:12:18 +0000
Subject: RE: [PATCH] ath10k: add peer id check in ath10k_peer_find_by_id
From: Wen Gong <wgong@qti.qualcomm.com>
Date: Tue, 30 Apr 2019 10:12:09 +0000
Message-ID: <7d528d143ae14de2a489c6986f71ac45@aptaiexm02f.ap.qualcomm.com>
References: <1554260478-4161-1-git-send-email-wgong@codeaurora.org>
 <CANMq1KAU1B4Bweq3O6O8HOMwT7fHjj9tDyxqMsn_vn4gwxXL=Q@mail.gmail.com>
 <87wojbrg0m.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87wojbrg0m.fsf@kamboji.qca.qualcomm.com>
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
To: "kvalo@codeaurora.org" <kvalo@codeaurora.org>, Nicolas Boichat <drinkcat@chromium.org>
Cc: Claire Chang <tientzu@chromium.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Wen Gong <wgong@codeaurora.org>

> -----Original Message-----
> From: ath10k <ath10k-bounces@lists.infradead.org> On Behalf Of Kalle Valo
> Sent: Tuesday, April 30, 2019 5:37 PM
> To: Nicolas Boichat <drinkcat@chromium.org>
> Cc: Claire Chang <tientzu@chromium.org>; linux-wireless@vger.kernel.org;
> ath10k@lists.infradead.org; Wen Gong <wgong@codeaurora.org>
> Subject: [EXT] Re: [PATCH] ath10k: add peer id check in
> ath10k_peer_find_by_id
> >> --- a/drivers/net/wireless/ath/ath10k/txrx.c
> >> +++ b/drivers/net/wireless/ath/ath10k/txrx.c
> >> @@ -157,6 +157,9 @@ struct ath10k_peer
> *ath10k_peer_find_by_id(struct ath10k *ar, int peer_id)
> >>  {
> >>         struct ath10k_peer *peer;
> >>
> >> +       if (peer_id >= sizeof(peer->peer_ids) * BITS_PER_BYTE)
> >
> > I'd use >= BITS_PER_TYPE(peer->peer_ids).
> 
> Nice, I didn't know about that. Wen, please submit v2 using this.
> 
> --
> Kalle Valo
Yes, 
I have send v2 yesterday:
[PATCH v2] ath10k: add peer id check in ath10k_peer_find_by_id
> 
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
