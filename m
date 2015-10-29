Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zrl0J-0002XB-V2
 for ath10k@lists.infradead.org; Thu, 29 Oct 2015 11:04:24 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2] ath10k: add QCA9377 chipset support
References: <1446041393-4652-1-git-send-email-bartosz.markowski@tieto.com>
Date: Thu, 29 Oct 2015 13:03:42 +0200
In-Reply-To: <1446041393-4652-1-git-send-email-bartosz.markowski@tieto.com>
 (Bartosz Markowski's message of "Wed, 28 Oct 2015 15:09:53 +0100")
Message-ID: <87bnbiq6lt.fsf@kamboji.qca.qualcomm.com>
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
To: Bartosz Markowski <bartosz.markowski@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Bartosz Markowski <bartosz.markowski@tieto.com> writes:

> Add the hardware name, revision and update the pci_id table.
>
> Currently there're two HW ref. designs available I'm aware of,
> with 1.0.2 and 1.1 chip revisions. I've access and been using
> the first one so far and this patch cover only it.
>
> QCA9377 inherits most of the stuff (e.g. fw interfaces)
> from QCA61x4 design, so the integration was pretty straightforward.
>
> Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>

Applied, thanks.

I pushed the firmware image here:

https://github.com/kvalo/ath10k-firmware/tree/master/QCA9377/hw1.0

All reports, good or bad, are very welcome.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
