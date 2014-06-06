Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qa0-x235.google.com ([2607:f8b0:400d:c00::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wsz7F-00069E-Lm
 for ath10k@lists.infradead.org; Fri, 06 Jun 2014 18:43:50 +0000
Received: by mail-qa0-f53.google.com with SMTP id k15so4258718qaq.12
 for <ath10k@lists.infradead.org>; Fri, 06 Jun 2014 11:43:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5391EFB0.4080604@yahoo.com>
References: <5391EFB0.4080604@yahoo.com>
Date: Fri, 6 Jun 2014 20:43:24 +0200
Message-ID: <CALhHN=oCUQHdLakS5bvCs2dXxH9yS4RLGNhgs0G2zdc5+VvVZw@mail.gmail.com>
Subject: Re: ATH10K set bitrates problem
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
To: Frank Agius <ftagius@yahoo.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 6 June 2014 18:43, Frank Agius <ftagius@yahoo.com> wrote:
> I am unable to set the bitrates for devices using the ath10k driver,
> regardless of the arguments I pass:
>
>
> # iw wlan0 set bitrates legacy-2.4 6 12 24
> command failed: Invalid argument (-22)
> # iw dev wlan0 set bitrates mcs-2.4 10
> command failed: Invalid argument (-22)
>
>
> The ath10k drivers were built from stable backports v3.15-rc1.   I am using
> firmware file firmware-2.bin_999.999.0.636
>
>
> Is this a known issue?
>
This is expected.
ath10k support only single rate setting (or single nss). So, please
check commit message,
ath10k: add set_bitrate_mask callback

Try this:
iw wlan0 set bitrates legacy-2.4 18 ht-mcs-2.4
iw wlan0 set bitrates legacy-2.4 ht-mcs-2.4 6
iw wlan0 set bitrates - back to default mask.

BR
Janusz
>
> frank agius
>
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
