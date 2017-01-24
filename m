Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtprelay0117.hostedemail.com ([216.40.44.117]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cVtcD-0005Kn-G1
 for ath10k@lists.infradead.org; Tue, 24 Jan 2017 05:25:59 +0000
Message-ID: <1485235529.12563.39.camel@perches.com>
Subject: Re: [PATCH 2/3] ath10k: use dma_zalloc_coherent()
From: Joe Perches <joe@perches.com>
Date: Mon, 23 Jan 2017 21:25:29 -0800
In-Reply-To: <8737g9ox1k.fsf@qca.qualcomm.com>
References: <1485183876-27080-1-git-send-email-srinivas.kandagatla@linaro.org>
 <1485183876-27080-2-git-send-email-srinivas.kandagatla@linaro.org>
 <1485213569.12563.32.camel@perches.com> <8737g9ox1k.fsf@qca.qualcomm.com>
Mime-Version: 1.0
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
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>

On Tue, 2017-01-24 at 05:18 +0000, Valo, Kalle wrote:
> Joe Perches <joe@perches.com> writes:
> =

> > On Mon, 2017-01-23 at 15:04 +0000, Srinivas Kandagatla wrote:
> > > use dma_zalloc_coherent() instead of dma_alloc_coherent and memset().
> > =

> > []
> > > diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wire=
less/ath/ath10k/pci.c
> > =

> > []
> > > @@ -896,7 +896,7 @@ static int ath10k_pci_diag_read_mem(struct ath10k=
 *ar, u32 address, void *data,
> > >  	 */
> > >  	alloc_nbytes =3D min_t(unsigned int, nbytes, DIAG_TRANSFER_LIMIT);
> > >  =

> > > -	data_buf =3D (unsigned char *)dma_alloc_coherent(ar->dev,
> > > +	data_buf =3D (unsigned char *)dma_zalloc_coherent(ar->dev,
> > >  						       alloc_nbytes,
> > >  						       &ce_data_base,
> > >  						       GFP_ATOMIC);
> > =

> > trivia:
> > =

> > Nicer to realign arguments and remove the unnecessary cast.
> > =

> > Perhaps:
> > =

> > 	data_buf =3D dma_zalloc_coherent(ar->dev,=A0alloc_nbytes, &ce_data_bas=
e,
> > 				      =A0GFP_ATOMIC);
> =

> Sure, but that should be in a separate patch.

I don't think so, trivial patches can be combined.

It's also nicer to realign all modified multiline
arguments when performing these changes.

Coccinelle generally does it automatically.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
