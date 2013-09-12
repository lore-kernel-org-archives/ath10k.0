Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VK9VX-00067Y-3S
 for ath10k@lists.infradead.org; Thu, 12 Sep 2013 16:12:39 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 0/8] ath10k: boot, bmi and mac debug message cleanup
References: <20130908145435.3136.49168.stgit@localhost6.localdomain6>
Date: Thu, 12 Sep 2013 19:12:13 +0300
In-Reply-To: <20130908145435.3136.49168.stgit@localhost6.localdomain6> (Kalle
 Valo's message of "Sun, 08 Sep 2013 17:55:25 +0300")
Message-ID: <87d2oef28y.fsf@qca.qualcomm.com>
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
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

Kalle Valo <kvalo@qca.qualcomm.com> writes:

> Simple message log cleanup. Please review.
>
> ---
>
> Kalle Valo (8):
>       ath10k: add BMI log level
>       ath10k: rename ATH10K_DBG_CORE to BOOT
>       ath10k: cleanup debug messages in core.c
>       ath10k: add boot debug messages to pci.c and ce.c
>       ath10k: add boot debug messages to htc.c
>       ath10k: add boot messages to htt.c
>       ath10k: clean mac.c debug messages
>       ath10k: print phymode as a string

Applied.

Kalle

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
