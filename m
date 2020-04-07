Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLhPt-0003IB-Js
 for ath10k@lists.infradead.org; Tue, 07 Apr 2020 06:09:03 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v9 1/4] ath10k: disable TX complete indication of htt for
 sdio
References: <20200212080415.31265-2-wgong@codeaurora.org>
 <20200407054431.6B2A0C433BA@smtp.codeaurora.org>
 <84039fe1187e3ec7546edd4f9fe5600a@codeaurora.org>
Date: Tue, 07 Apr 2020 09:08:46 +0300
In-Reply-To: <84039fe1187e3ec7546edd4f9fe5600a@codeaurora.org> (Wen Gong's
 message of "Tue, 07 Apr 2020 14:04:58 +0800")
Message-ID: <87mu7nx1xt.fsf@kamboji.qca.qualcomm.com>
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
To: Wen Gong <wgong@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Wen Gong <wgong@codeaurora.org> writes:

> On 2020-04-07 13:44, Kalle Valo wrote:
>
>> This has new warnings:
>>
>> drivers/net/wireless/ath/ath10k/htt_tx.c: In function
>> 'ath10k_htt_htc_tx_complete':
>> drivers/net/wireless/ath/ath10k/htt_tx.c:566:30: warning: 'msg_type'
>> may be used uninitialized in this function [-Wmaybe-uninitialized]
>> drivers/net/wireless/ath/ath10k/htt_tx.c:573:6: warning: 'flags1' may
>> be used uninitialized in this function [-Wmaybe-uninitialized]
>> drivers/net/wireless/ath/ath10k/htt_tx.c:577:42: warning: 'desc_hdr'
>> may be used uninitialized in this function [-Wmaybe-uninitialized]
>>
>
> I already run ath10k-check, but not see these warnings.
> my gcc: gcc (Ubuntu 4.8.4-2ubuntu1~14.04.4) 4.8.4
> so is it because my gcc too version too low?

Most likely, I'm using 9.2 from crosstool:

x86_64-linux-gcc (GCC) 9.2.0

crosstool is a handy way to install GCC for kernel compilations, here
are my notes:

listings: https://www.kernel.org/pub/tools/crosstool/

wget https://www.kernel.org/pub/tools/crosstool/files/bin/x86_64/8.1.0/x86_64-gcc-8.1.0-nolibc-x86_64-linux.tar.xz
pushd /opt/cross/
tar -xf ~/tmp/crosstool/x86_64-gcc-8.1.0-nolibc-x86_64-linux.tar.xz

In top level create GNUMakefile:

CROSS_COMPILE=/opt/cross/gcc-8.1.0-nolibc/x86_64-linux/bin/x86_64-linux-
include Makefile

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
