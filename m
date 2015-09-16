Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zc9C4-0000iN-7H
 for ath10k@lists.infradead.org; Wed, 16 Sep 2015 09:40:00 +0000
Message-ID: <55F938C7.30605@qti.qualcomm.com>
Date: Wed, 16 Sep 2015 15:09:19 +0530
From: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
MIME-Version: 1.0
Subject: Re: qca99x0 don't work with MSI-X supported/enabled
References: <CALhHN=r_z7phVTuA=5DZ6sq18nqdy_UMYRh679rbL1n_43bAAQ@mail.gmail.com>
In-Reply-To: <CALhHN=r_z7phVTuA=5DZ6sq18nqdy_UMYRh679rbL1n_43bAAQ@mail.gmail.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Janusz Dziedzic <janusz.dziedzic@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Wednesday 16 September 2015 01:24 PM, Janusz Dziedzic wrote:
> Hello,
>
> Seems in case of qca99x0 we request
>
> .msi_assign_ce_max              = 12
>
> Next in case PC support MSI-X we fail when registering CE interrupts
> with error msg:
> ath10k_pci 0000:04:00.0: failed to request MSI-X ce irq 50: -22
>
>
> Seems my linux limit max MSI-X to 8, so we should not request irq per CE?
> BTW are CE8 .. CE11 used by the driver ? Or we can setup msi_assign_ce_max = 7?

CE8 is used by the driver to get pktlog information. Currently we are using
7 CEs actively. When copy engine fast path to skip htc layer is added, CE5
will also be used, so it is going to be 8 active CEs. If this would fail
for MSI-X, may be we need to disable MSI-X for qca99x0?.

Vasanth

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
