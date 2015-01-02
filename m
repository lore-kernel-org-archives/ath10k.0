Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y6wrf-0006sw-BD
 for ath10k@lists.infradead.org; Fri, 02 Jan 2015 07:41:44 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: Fix DMA burst size
References: <1419834066-11802-1-git-send-email-sujith@msujith.org>
Date: Fri, 2 Jan 2015 09:41:08 +0200
In-Reply-To: <1419834066-11802-1-git-send-email-sujith@msujith.org> (Sujith
 Manoharan's message of "Mon, 29 Dec 2014 11:51:06 +0530")
Message-ID: <87k3156357.fsf@kamboji.qca.qualcomm.com>
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
To: Sujith Manoharan <sujith@msujith.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Sujith Manoharan <sujith@msujith.org> writes:

> From: Sujith Manoharan <c_manoha@qca.qualcomm.com>
>
> A value of zero indicates that 128B is the maximum
> DMA request size for read/writes. But PCI cards based
> on AR9880 can support 256B, so enable this for
> the 10.2 firmware.
>
> Signed-off-by: Sujith Manoharan <c_manoha@qca.qualcomm.com>

Did you see any throughput improvements with this?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
