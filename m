Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VECVM-0001Hr-W5
 for ath10k@lists.infradead.org; Tue, 27 Aug 2013 06:11:54 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 0/6] ath10k: CE cleanups
References: <1377068249-26025-1-git-send-email-michal.kazior@tieto.com>
Date: Tue, 27 Aug 2013 09:11:23 +0300
In-Reply-To: <1377068249-26025-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Wed, 21 Aug 2013 08:57:23 +0200")
Message-ID: <87a9k3oe7o.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> Hi,
>
> This patchset contains non-functional changes
> except patch #1 which changes memory allocation
> from dynamic to static.

Good cleanups, but there's a problem with long lines:

drivers/net/wireless/ath/ath10k/ce.h:184: WARNING: line over 80 characters
drivers/net/wireless/ath/ath10k/ce.h:231: WARNING: line over 80 characters
drivers/net/wireless/ath/ath10k/ce.c:858: WARNING: line over 80 characters
drivers/net/wireless/ath/ath10k/ce.c:875: WARNING: line over 80 characters
drivers/net/wireless/ath/ath10k/pci.c:1303: WARNING: line over 80 characters
drivers/net/wireless/ath/ath10k/pci.c:1304: WARNING: line over 80 characters

> There is still some more to clean up in PCI/CE
> but it's probably better to keep patchsets compact
> and more frequent.

I agree.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
