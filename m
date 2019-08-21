Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-tai-02.qualcomm.com ([103.229.16.227])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0Jyk-0006pr-Kr
 for ath10k@lists.infradead.org; Wed, 21 Aug 2019 06:20:20 +0000
Subject: RE: [PATCH 4/7] ath10k: disable TX complete indication of htt for sdio
From: Wen Gong <wgong@qti.qualcomm.com>
Date: Wed, 21 Aug 2019 06:20:09 +0000
Message-ID: <00992d0991704b0fae73a500bb2eb504@aptaiexm02f.ap.qualcomm.com>
References: <1566302108-18219-1-git-send-email-wgong@codeaurora.org>
 <1566302108-18219-5-git-send-email-wgong@codeaurora.org>
 <87blwkt480.fsf@toke.dk>
In-Reply-To: <87blwkt480.fsf@toke.dk>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: =?iso-8859-1?Q?Toke_H=F8iland-J=F8rgensen?= <toke@redhat.com>, Wen Gong <wgong@codeaurora.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>

> -----Original Message-----
> From: ath10k <ath10k-bounces@lists.infradead.org> On Behalf Of Toke
> H=F8iland-J=F8rgensen
> Sent: Tuesday, August 20, 2019 8:24 PM
> To: Wen Gong <wgong@codeaurora.org>; ath10k@lists.infradead.org
> Cc: linux-wireless@vger.kernel.org
> Subject: [EXT] Re: [PATCH 4/7] ath10k: disable TX complete indication of =
htt
> for sdio
> =

> Wen Gong <wgong@codeaurora.org> writes:
> =

> > Tx complete message from firmware cost bus bandwidth of sdio, and bus
> > bandwidth is the bollteneck of throughput, it will effect the bandwidth
> > occupancy of data packet of TX and RX.
> >
> > This patch disable TX complete indication from firmware for htt data
> > packet, it results in significant performance improvement on TX path.
> =

> Wait, how does that work? Am I understanding it correctly that this
> replaces a per-packet TX completion with a periodic one sent out of
> band?
When this patch applied, firmware will not indicate tx complete for tx
Data, it only indicate HTT_T2H_MSG_TYPE_TX_CREDIT_UPDATE_IND,
This htt msg will tell how many data tx complete without status(status mayb=
e success/fail).
> =

> And could you explain what the credits thing is for, please? :)
For high latency bus chip, all the tx data's content(include ip/udp/tcp hea=
der
and payload) will be transfer to firmware's memory via bus.
And firmware has limited memory for tx data, the tx data's content must
Saved in firmware memory before it tx complete, if ath10k transfer tx
data more than the limit, firmware will occur error. The credit is used
to avoid ath10k exceed the limit.
> =

> -Toke
> =

> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
