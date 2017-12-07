Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eMx6D-0003Kg-UI
 for ath10k@lists.infradead.org; Thu, 07 Dec 2017 14:24:31 +0000
MIME-Version: 1.0
Subject: Re: ath10k: use 64-bit crash dump timestamps
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <20171127115113.2831506-1-arnd@arndb.de>
References: <20171127115113.2831506-1-arnd@arndb.de>
Message-ID: <688aa963236549dfb9561afcf7c7488a@euamsexm01a.eu.qualcomm.com>
Date: Thu, 7 Dec 2017 15:23:51 +0100
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
To: Arnd Bergmann <arnd@arndb.de>
Cc: y2038@lists.linaro.org, Venkateswara Naralasetty <vnaralas@qti.qualcomm.com>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>, Erik Stromdahl <erik.stromdahl@gmail.com>, netdev@vger.kernel.org, Marcin Rokicki <marcin.rokicki@tieto.com>, Sarada Prasanna Garnayak <c_sgarna@qti.qualcomm.com>, Waldemar Rymarkiewicz <ext.waldemar.rymarkiewicz@tieto.com>

Arnd Bergmann <arnd@arndb.de> wrote:

> The dump format uses 64-bit timestamps already, but calling
> getnstimeofday() only returns a 32-bit number on 32-bit architectures,
> so that will overflow in y2038.
> 
> This changes it to use ktime_get_real_ts64() instead.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

Patch applied to ath-next branch of ath.git, thanks.

dafa42036012 ath10k: use 64-bit crash dump timestamps

-- 
https://patchwork.kernel.org/patch/10076697/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
