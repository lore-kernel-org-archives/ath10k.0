Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x230.google.com ([2a00:1450:400c:c05::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zc7Yk-0008Vf-95
 for ath10k@lists.infradead.org; Wed, 16 Sep 2015 07:55:19 +0000
Received: by wicfx3 with SMTP id fx3so60278810wic.1
 for <ath10k@lists.infradead.org>; Wed, 16 Sep 2015 00:54:55 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 16 Sep 2015 09:54:55 +0200
Message-ID: <CALhHN=r_z7phVTuA=5DZ6sq18nqdy_UMYRh679rbL1n_43bAAQ@mail.gmail.com>
Subject: qca99x0 don't work with MSI-X supported/enabled
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: vthiagar@qti.qualcomm.com

Hello,

Seems in case of qca99x0 we request

.msi_assign_ce_max              = 12

Next in case PC support MSI-X we fail when registering CE interrupts
with error msg:
ath10k_pci 0000:04:00.0: failed to request MSI-X ce irq 50: -22


Seems my linux limit max MSI-X to 8, so we should not request irq per CE?
BTW are CE8 .. CE11 used by the driver ? Or we can setup msi_assign_ce_max = 7?

Works fine when single MSI-X or legacy interrupt forced.

BR
Janusz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
