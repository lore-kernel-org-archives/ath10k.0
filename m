Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28]
 helo=alexa-out-lv-01.qualcomm.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dwaT5-0003rP-4p
 for ath10k@lists.infradead.org; Mon, 25 Sep 2017 20:59:08 +0000
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: RE: [PATCH] ath10k: add new cipher suite support
Date: Mon, 25 Sep 2017 20:58:40 +0000
Message-ID: <88e4ab8e9f5d4ac6a598b1bc2fccd9a6@NALASEXR01H.na.qualcomm.com>
References: <1506115070-10467-1-git-send-email-rmanohar@qti.qualcomm.com>
 <bff1aa84-d199-7b10-3718-33323a984954@dd-wrt.com>
In-Reply-To: <bff1aa84-d199-7b10-3718-33323a984954@dd-wrt.com>
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
To: Sebastian Gottschall <s.gottschall@dd-wrt.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: Jouni Malinen <jouni@qca.qualcomm.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "rmanohar@codeaurora.org" <rmanohar@codeaurora.org>

> Am 22.09.2017 um 23:17 schrieb Rajkumar Manoharan:
> > -	ar->hw->wiphy->n_cipher_suites = ARRAY_SIZE(cipher_suites);
> > +
> > +	/* QCA988x and QCA6174 family chips do not support CCMP-256,
> GCMP-128
> > +	 * and GCMP-256 ciphers in hardware.
> > +	 */
> > +	if (!ar->hw_params.n_cipher_suites)
> > +		ar->hw->wiphy->n_cipher_suites = ARRAY_SIZE(cipher_suites);
> this is a bug. you do not set ar->hw->wiphy->n_cipher_suites if its non zero. this
> breaks ath10k crypto support for all chipsets except for QCA998X
>
Oops.. My bad.. I overlooked it. Will send next version.

-Rajkumar
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
