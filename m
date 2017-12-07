Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eMxEa-0000no-Df
 for ath10k@lists.infradead.org; Thu, 07 Dec 2017 14:33:10 +0000
MIME-Version: 1.0
Subject: Re: [2/3] ath9k: move spectral scan support under a separate config
 symbol
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1c982c915065a9b5ed3232eedb567f589eca261b.1511804622.git.mschiffer@universe-factory.net>
References: <1c982c915065a9b5ed3232eedb567f589eca261b.1511804622.git.mschiffer@universe-factory.net>
Message-ID: <39b862cad21f42aa9cf855c465216cab@euamsexm01a.eu.qualcomm.com>
Date: Thu, 7 Dec 2017 15:32:36 +0100
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
To: Matthias Schiffer <mschiffer@universe-factory.net>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, ath9k-devel@qca.qualcomm.com, ath10k@lists.infradead.org, linux-kernel@vger.kernel.org, nbd@nbd.name

Matthias Schiffer <mschiffer@universe-factory.net> wrote:

> At the moment, spectral scan support, and with it RELAY, is always enabled
> with ATH9K[_HTC]_DEBUGFS. Spectral scan support is currently the only user
> of RELAY in ath9k, and it unconditionally reserves a relay channel.
> 
> Having debugfs support in ath9k is often useful even on very small embedded
> routers, where we'd rather like to avoid the code size and RAM usage of the
> relay support.
> 
> Signed-off-by: Matthias Schiffer <mschiffer@universe-factory.net>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

2 patches applied to ath-next branch of ath.git, thanks.

9df7ddc3ed25 ath9k: move spectral scan support under a separate config symbol
42e01cb9cb10 ath10k: move spectral scan support under a separate config symbol

-- 
https://patchwork.kernel.org/patch/10077735/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
