Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x230.google.com ([2a00:1450:4010:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X85NS-0006MA-8D
 for ath10k@lists.infradead.org; Fri, 18 Jul 2014 10:27:00 +0000
Received: by mail-la0-f48.google.com with SMTP id gl10so2668107lab.7
 for <ath10k@lists.infradead.org>; Fri, 18 Jul 2014 03:26:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1405441966-32681-1-git-send-email-sw@simonwunderlich.de>
References: <1405441966-32681-1-git-send-email-sw@simonwunderlich.de>
Date: Fri, 18 Jul 2014 12:26:33 +0200
Message-ID: <CALhHN=q_EapV6wTpicByf_Ga+qfpFe0edAsdufLSkwLRmhm2-Q@mail.gmail.com>
Subject: Re: [RFC 0/2] ath10k spectral scan support
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
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
To: Simon Wunderlich <sw@simonwunderlich.de>
Cc: mathias.kretschmer@fokus.fraunhofer.de, kgiori@qca.qualcomm.com, linux-wireless@vger.kernel.org, sven@narfation.org, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 15 July 2014 18:32, Simon Wunderlich <sw@simonwunderlich.de> wrote:
> This is the first patchset iteration for review to implement the ath10k
> spectral scan feature. The patchset is still experimental, but we were
> able to detect our analogue 5.8 GHz TV repeater in the sample data. :)
>
> As for ath9k, a proof of concept data plotter has been implemented, and
> is currently available for ath10k in its own branch of FFT_eval [1].
>
Tested this with fft_eval, seems works quite good.
There is small problem with scan timeout, when spectral scan activated
and channels with high load checked, I often hit scan timeout.
Seems we should increase scan timeout in ath10k_start_scan() when
spectral activated.

BR
Janusz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
